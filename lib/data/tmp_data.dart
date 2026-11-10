import 'package:flutter_coffee_shop_app/entities/introduction.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';

import '../entities/coffee.dart';

class DataTmp {
  static List<String> categories(AppLocalizations l10n) => [
        l10n.allCategory,
        l10n.coffeeCappuccinoName,
        l10n.coffeeEspressoName,
        l10n.coffeeAmericanoName,
        l10n.categoryMacchiato,
        l10n.coffeeLatteName,
        l10n.categoryFrappe,
      ];

  // Introduction
  static List<Introduction> introductionList(AppLocalizations l10n) => [
        Introduction(
          title: l10n.introductionTitleOne,
          subtitle: l10n.introductionSubtitleOne,
          imageUrl: 'https://i.imgur.com/f1ZkmgC.jpg',
        ),
        Introduction(
          title: l10n.introductionTitleTwo,
          subtitle: l10n.introductionSubtitleTwo,
          imageUrl: 'https://i.imgur.com/IjY028x.jpg',
        ),
        Introduction(
          title: l10n.introductionTitleThree,
          subtitle: l10n.introductionSubtitleThree,
          imageUrl: 'https://i.imgur.com/nnroE8z.jpg',
        ),
      ];

  // Coffee List Items
  static List<Coffee> coffeeList(AppLocalizations l10n) => [
        Coffee(
          name: l10n.coffeeAmericanoName,
          ingredients: l10n.coffeeAmericanoIngredients,
          description: l10n.coffeeAmericanoDescription,
          imageUrl: 'https://i.imgur.com/y6Fj8tu.jpg',
          rating: 4.3,
          price: 3.8,
          reviews: '7.295',
        ),
        Coffee(
          name: l10n.coffeeLatteName,
          ingredients: l10n.coffeeLatteIngredients,
          description: l10n.coffeeLatteDescription,
          imageUrl: 'https://i.imgur.com/tEf7zGq.jpg',
          rating: 4.2,
          price: 3.5,
          reviews: '10.875',
        ),
        Coffee(
          name: l10n.coffeeCappuccinoName,
          ingredients: l10n.coffeeCappuccinoIngredients,
          description: l10n.coffeeCappuccinoDescription,
          imageUrl: 'https://i.imgur.com/2aBjCR7.jpg',
          rating: 4.5,
          price: 4.2,
          reviews: '6.986',
        ),
        Coffee(
          name: l10n.coffeeEspressoName,
          ingredients: l10n.coffeeEspressoIngredients,
          description: l10n.coffeeEspressoDescription,
          imageUrl: 'https://i.imgur.com/HOU9gZO.jpg',
          rating: 4.7,
          price: 4.2,
          reviews: '3.584',
        ),
        Coffee(
          name: l10n.coffeeMochaName,
          ingredients: l10n.coffeeMochaIngredients,
          description: l10n.coffeeMochaDescription,
          imageUrl: 'https://i.imgur.com/M73FiE2.jpg',
          rating: 4.2,
          price: 4.4,
          reviews: '6.752',
        ),
      ];
}
