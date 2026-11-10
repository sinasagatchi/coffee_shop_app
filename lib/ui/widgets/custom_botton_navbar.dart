import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: 120,
      child: StylishBottomBar(
        backgroundColor: Apptheme.mocha,
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home),
            selectedIcon: const Icon(Icons.home),
            selectedColor: Apptheme.iconActiveColor,
            unSelectedColor: Apptheme.iconColor,
            title: Text(l10n.allCategory),
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_bag_rounded),
            selectedIcon: const Icon(Icons.shopping_bag_rounded),
            selectedColor: Apptheme.iconActiveColor,
            unSelectedColor: Apptheme.iconColor,
            title: Text(l10n.navigationCompleted),
          ),
          BottomBarItem(
            icon: const Icon(Icons.favorite),
            selectedIcon: const Icon(Icons.favorite),
            selectedColor: Apptheme.iconActiveColor,
            unSelectedColor: Apptheme.iconColor,
            title: Text(l10n.navigationPending),
          ),
          BottomBarItem(
            icon: const Icon(Icons.notification_add_rounded),
            selectedIcon: const Icon(Icons.notification_add_rounded),
            selectedColor: Apptheme.iconActiveColor,
            unSelectedColor: Apptheme.iconColor,
            title: Text(l10n.navigationReminders),
          ),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        option: AnimatedBarOptions(
          iconSize: 25,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.simple,
          opacity: 0.4,
        ),
      ),
    );
  }
}
