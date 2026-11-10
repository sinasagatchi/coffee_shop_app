// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get introductionTitleOne => 'Rise and Savor the Coffee';

  @override
  String get introductionSubtitleOne =>
      'Experience the aroma and flavor like never before.';

  @override
  String get introductionTitleTwo => 'Savor the Moment with Our Coffee';

  @override
  String get introductionSubtitleTwo =>
      'Indulge in our artisanal blends and taste the difference.';

  @override
  String get introductionTitleThree => 'Elevate Your Coffee Experience';

  @override
  String get introductionSubtitleThree =>
      'Discover a world of rich, bold flavors with our premium roasts.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get allCategory => 'All';

  @override
  String get categoryMacchiato => 'Macchiato';

  @override
  String get categoryFrappe => 'Frappé';

  @override
  String get homeFindTheBest => 'Find the best';

  @override
  String get homeCoffeeForYou => 'coffee for you';

  @override
  String get homeSpecialForYou => 'Special for you';

  @override
  String get searchCoffeeHint => 'Find your coffee...';

  @override
  String get searchCoffeeTooltip => 'Search coffee';

  @override
  String get noCoffeeFound => 'No coffee found';

  @override
  String get navigationCompleted => 'Completed';

  @override
  String get navigationPending => 'Pending';

  @override
  String get navigationReminders => 'Reminders';

  @override
  String get coffeeAmericanoName => 'Americano';

  @override
  String get coffeeAmericanoIngredients => 'With Cream';

  @override
  String get coffeeAmericanoDescription =>
      'An Americano is a coffee drink made with espresso and hot water. It is a popular alternative to drip coffee and has a strong, bold flavor. The drink originated in Europe during World War II, when American soldiers diluted espresso with hot water to make it last longer.';

  @override
  String get coffeeLatteName => 'Latte';

  @override
  String get coffeeLatteIngredients => 'With Chocolate';

  @override
  String get coffeeLatteDescription =>
      'A latte is a coffee drink made with espresso and steamed milk. It is typically topped with a small amount of frothed milk. The drink originated in Italy and is now enjoyed around the world. It has a mild, creamy flavor and is often sweetened with sugar or flavored syrups.';

  @override
  String get coffeeCappuccinoName => 'Cappuccino';

  @override
  String get coffeeCappuccinoIngredients => 'With Oat Milk';

  @override
  String get coffeeCappuccinoDescription =>
      'A cappuccino is a coffee beverage made with espresso and steamed milk, often topped with a layer of frothed milk. This espresso drink originated in Italy and is now popular around the world. It has a strong, bold flavor and is typically served in a small cup.';

  @override
  String get coffeeEspressoName => 'Espresso';

  @override
  String get coffeeEspressoIngredients => 'With Sugar';

  @override
  String get coffeeEspressoDescription =>
      'Espresso is a concentrated coffee made by forcing hot water through finely ground coffee beans. It originated in Italy and is now enjoyed around the world. Espresso has a strong, bold flavor and is typically served in small shots.';

  @override
  String get coffeeMochaName => 'Mocha';

  @override
  String get coffeeMochaIngredients => 'With Whipped Cream';

  @override
  String get coffeeMochaDescription =>
      'A mocha is a coffee drink made with espresso, chocolate, and steamed milk. It has a rich, indulgent flavor and is often topped with whipped cream and chocolate shavings. The drink originated in Italy and is now enjoyed around the world.';

  @override
  String get detailDescription => 'Description';

  @override
  String get detailPrice => 'Price';

  @override
  String get detailBuyNow => 'Buy Now';

  @override
  String get detailReadMore => 'Read More';

  @override
  String get detailReadLess => 'Read Less';

  @override
  String get detailCoffeeIngredient => 'Coffee';

  @override
  String get detailMilkIngredient => 'Milk';

  @override
  String get detailRoastLevel => 'Medium Roasted';

  @override
  String get detailBackTooltip => 'Back';

  @override
  String get favoriteAddTooltip => 'Add to favorites';

  @override
  String get favoriteRemoveTooltip => 'Remove from favorites';

  @override
  String get coffeeAddTooltip => 'Select coffee (preview)';

  @override
  String coffeeSelectedPreview(String coffeeName) {
    return '$coffeeName selected (preview only).';
  }

  @override
  String coffeeSizeSelectedPreview(String coffeeName, String size) {
    return '$coffeeName ($size) selected. Ordering is a preview only.';
  }

  @override
  String get featuredArticleTitle => '5 Coffee Beans You Must Try';

  @override
  String get featuredArticleActionTooltip => 'Coffee article';

  @override
  String get homeIntroductionTooltip => 'Open introduction';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTurkish => 'Turkish';

  @override
  String get switchToEnglish => 'Switch language to English';

  @override
  String get switchToTurkish => 'Switch language to Turkish';
}
