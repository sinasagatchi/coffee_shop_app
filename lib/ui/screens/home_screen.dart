import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/app_locale_scope.dart';
import 'package:flutter_coffee_shop_app/data/tmp_data.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/screens/introduction_screen.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categories = DataTmp.categories(l10n);
    final coffeeItems = DataTmp.coffeeList(l10n);
    final currentSelectedCategoryIndex = selectedCategoryIndex;
    final filteredCoffee = coffeeItems.where((coffee) {
      final query = searchQuery.toLowerCase();
      final matchesSearch = coffee.name.toLowerCase().contains(query) ||
          coffee.ingredients.toLowerCase().contains(query);
      final matchesCategory = currentSelectedCategoryIndex == 0 ||
          coffee.name.toLowerCase() ==
              categories[currentSelectedCategoryIndex].toLowerCase();

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: Apptheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 22,
            top: 30,
            end: 22,
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const SizedBox(height: 25),
                Text(l10n.homeFindTheBest, style: Apptheme.tileLarge),
                Text(l10n.homeCoffeeForYou, style: Apptheme.tileLarge),
                const SizedBox(height: 28),
                SearchWidget(
                  onChanged: (value) {
                    setState(() => searchQuery = value);
                  },
                  onSearch: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isActive = currentSelectedCategoryIndex == index;

                      return Padding(
                        padding: const EdgeInsetsDirectional.only(end: 24),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedCategoryIndex = index);
                          },
                          child: Column(
                            children: [
                              Text(
                                category,
                                style: isActive
                                    ? Apptheme.chipActive
                                    : Apptheme.chipInactive,
                              ),
                              const SizedBox(height: 2),
                              Icon(
                                Icons.circle,
                                color: isActive
                                    ? Apptheme.iconActiveColor
                                    : Colors.transparent,
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 252,
                  child: filteredCoffee.isEmpty
                      ? Center(
                          child: Text(
                            l10n.noCoffeeFound,
                            style: Apptheme.descriptionContent,
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredCoffee.length,
                          itemBuilder: (context, index) {
                            return VerticalCardWidget(
                              coffee: filteredCoffee[index],
                            );
                          },
                        ),
                ),
                const SizedBox(height: 25),
                Text(l10n.homeSpecialForYou, style: Apptheme.subtileLarge),
                const SizedBox(height: 17),
                for (var index = 0; index < 10; index++)
                  const HorizontalCardWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const IntroductionScreen(),
              ),
            );
          },
          width: 45,
          height: 45,
          tooltip: AppLocalizations.of(context)!.homeIntroductionTooltip,
          child: const Icon(Icons.widgets, color: Apptheme.iconColor),
        ),
        const SizedBox(width: 10),
        const _LanguageSelector(),
        const Spacer(),
        CustomContainer(
          width: 45,
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://i.imgur.com/uTjWuc8.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeScope = AppLocaleScope.of(context);
    final isEnglish = localeScope.locale.languageCode == 'en';

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Apptheme.mocha,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Apptheme.sage),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _LanguageOption(
            code: 'EN',
            label: l10n.languageEnglish,
            tooltip: l10n.switchToEnglish,
            selected: isEnglish,
            onTap: () => localeScope.onLocaleChanged(const Locale('en')),
          ),
          _LanguageOption(
            code: 'TR',
            label: l10n.languageTurkish,
            tooltip: l10n.switchToTurkish,
            selected: !isEnglish,
            onTap: () => localeScope.onLocaleChanged(const Locale('tr', 'TR')),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.code,
    required this.label,
    required this.tooltip,
    required this.selected,
    required this.onTap,
  });

  final String code;
  final String label;
  final String tooltip;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Semantics(
        button: true,
        selected: selected,
        label: label,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.center,
            width: 38,
            decoration: BoxDecoration(
              color: selected ? Apptheme.vanilla : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: selected ? Border.all(color: Apptheme.espresso) : null,
            ),
            child: Text(
              code,
              style: TextStyle(
                color: selected ? Apptheme.mocha : Apptheme.vanilla,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
