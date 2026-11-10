import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/data/tmp_data.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/screens/screens.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:flutter_coffee_shop_app/ui/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final introductionItems = DataTmp.introductionList(l10n);
    final itemCount = introductionItems.length;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final item = introductionItems[index];

              return LayoutBuilder(
                builder: (context, constraints) {
                  final viewportHeight = constraints.maxHeight;

                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(item.imageUrl, fit: BoxFit.cover),
                      ),
                      const Positioned.fill(
                        child: ColoredBox(color: Apptheme.introductionOverlay),
                      ),
                      Positioned.fill(
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: viewportHeight,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: viewportHeight * 0.38),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 50,
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        item.title,
                                        style: Apptheme.introtile,
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        item.subtitle,
                                        style: Apptheme.introSubtile,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: viewportHeight * 0.08),
                                SmoothPageIndicator(
                                  controller: controller,
                                  count: itemCount,
                                  effect: const ExpandingDotsEffect(
                                    activeDotColor:
                                        Apptheme.indicatorActiveColor,
                                    dotColor: Apptheme.indicatorInactiveColor,
                                    dotHeight: 5,
                                    dotWidth: 10,
                                  ),
                                ),
                                SizedBox(height: viewportHeight * 0.08),
                                CustomFilledButton(
                                  width: 136,
                                  height: 54,
                                  color: Apptheme.buttonBackground1Color,
                                  borderRadius: 16,
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    l10n.getStarted,
                                    style: Apptheme.buttonTextStyle,
                                  ),
                                ),
                                SizedBox(height: viewportHeight * 0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
