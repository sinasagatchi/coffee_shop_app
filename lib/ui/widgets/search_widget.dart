import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onSearch;

  const SearchWidget({
    super.key,
    required this.onChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsetsDirectional.only(start: 10, end: 20),
      height: 60,
      decoration: const BoxDecoration(
        color: Apptheme.searchBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onSearch,
            tooltip: l10n.searchCoffeeTooltip,
            icon: const Icon(
              CupertinoIcons.search,
              color: Apptheme.mocha,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              onSubmitted: (_) => onSearch(),
              cursorColor: Apptheme.searchCursorColor,
              style: Apptheme.searchTextStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: l10n.searchCoffeeHint,
                hintStyle: Apptheme.searchTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
