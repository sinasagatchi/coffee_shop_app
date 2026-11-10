import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @introductionTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Rise and Savor the Coffee'**
  String get introductionTitleOne;

  /// No description provided for @introductionSubtitleOne.
  ///
  /// In en, this message translates to:
  /// **'Experience the aroma and flavor like never before.'**
  String get introductionSubtitleOne;

  /// No description provided for @introductionTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Savor the Moment with Our Coffee'**
  String get introductionTitleTwo;

  /// No description provided for @introductionSubtitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Indulge in our artisanal blends and taste the difference.'**
  String get introductionSubtitleTwo;

  /// No description provided for @introductionTitleThree.
  ///
  /// In en, this message translates to:
  /// **'Elevate Your Coffee Experience'**
  String get introductionTitleThree;

  /// No description provided for @introductionSubtitleThree.
  ///
  /// In en, this message translates to:
  /// **'Discover a world of rich, bold flavors with our premium roasts.'**
  String get introductionSubtitleThree;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @allCategory.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allCategory;

  /// No description provided for @categoryMacchiato.
  ///
  /// In en, this message translates to:
  /// **'Macchiato'**
  String get categoryMacchiato;

  /// No description provided for @categoryFrappe.
  ///
  /// In en, this message translates to:
  /// **'Frappé'**
  String get categoryFrappe;

  /// No description provided for @homeFindTheBest.
  ///
  /// In en, this message translates to:
  /// **'Find the best'**
  String get homeFindTheBest;

  /// No description provided for @homeCoffeeForYou.
  ///
  /// In en, this message translates to:
  /// **'coffee for you'**
  String get homeCoffeeForYou;

  /// No description provided for @homeSpecialForYou.
  ///
  /// In en, this message translates to:
  /// **'Special for you'**
  String get homeSpecialForYou;

  /// No description provided for @searchCoffeeHint.
  ///
  /// In en, this message translates to:
  /// **'Find your coffee...'**
  String get searchCoffeeHint;

  /// No description provided for @searchCoffeeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search coffee'**
  String get searchCoffeeTooltip;

  /// No description provided for @noCoffeeFound.
  ///
  /// In en, this message translates to:
  /// **'No coffee found'**
  String get noCoffeeFound;

  /// No description provided for @navigationCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get navigationCompleted;

  /// No description provided for @navigationPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get navigationPending;

  /// No description provided for @navigationReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get navigationReminders;

  /// No description provided for @coffeeAmericanoName.
  ///
  /// In en, this message translates to:
  /// **'Americano'**
  String get coffeeAmericanoName;

  /// No description provided for @coffeeAmericanoIngredients.
  ///
  /// In en, this message translates to:
  /// **'With Cream'**
  String get coffeeAmericanoIngredients;

  /// No description provided for @coffeeAmericanoDescription.
  ///
  /// In en, this message translates to:
  /// **'An Americano is a coffee drink made with espresso and hot water. It is a popular alternative to drip coffee and has a strong, bold flavor. The drink originated in Europe during World War II, when American soldiers diluted espresso with hot water to make it last longer.'**
  String get coffeeAmericanoDescription;

  /// No description provided for @coffeeLatteName.
  ///
  /// In en, this message translates to:
  /// **'Latte'**
  String get coffeeLatteName;

  /// No description provided for @coffeeLatteIngredients.
  ///
  /// In en, this message translates to:
  /// **'With Chocolate'**
  String get coffeeLatteIngredients;

  /// No description provided for @coffeeLatteDescription.
  ///
  /// In en, this message translates to:
  /// **'A latte is a coffee drink made with espresso and steamed milk. It is typically topped with a small amount of frothed milk. The drink originated in Italy and is now enjoyed around the world. It has a mild, creamy flavor and is often sweetened with sugar or flavored syrups.'**
  String get coffeeLatteDescription;

  /// No description provided for @coffeeCappuccinoName.
  ///
  /// In en, this message translates to:
  /// **'Cappuccino'**
  String get coffeeCappuccinoName;

  /// No description provided for @coffeeCappuccinoIngredients.
  ///
  /// In en, this message translates to:
  /// **'With Oat Milk'**
  String get coffeeCappuccinoIngredients;

  /// No description provided for @coffeeCappuccinoDescription.
  ///
  /// In en, this message translates to:
  /// **'A cappuccino is a coffee beverage made with espresso and steamed milk, often topped with a layer of frothed milk. This espresso drink originated in Italy and is now popular around the world. It has a strong, bold flavor and is typically served in a small cup.'**
  String get coffeeCappuccinoDescription;

  /// No description provided for @coffeeEspressoName.
  ///
  /// In en, this message translates to:
  /// **'Espresso'**
  String get coffeeEspressoName;

  /// No description provided for @coffeeEspressoIngredients.
  ///
  /// In en, this message translates to:
  /// **'With Sugar'**
  String get coffeeEspressoIngredients;

  /// No description provided for @coffeeEspressoDescription.
  ///
  /// In en, this message translates to:
  /// **'Espresso is a concentrated coffee made by forcing hot water through finely ground coffee beans. It originated in Italy and is now enjoyed around the world. Espresso has a strong, bold flavor and is typically served in small shots.'**
  String get coffeeEspressoDescription;

  /// No description provided for @coffeeMochaName.
  ///
  /// In en, this message translates to:
  /// **'Mocha'**
  String get coffeeMochaName;

  /// No description provided for @coffeeMochaIngredients.
  ///
  /// In en, this message translates to:
  /// **'With Whipped Cream'**
  String get coffeeMochaIngredients;

  /// No description provided for @coffeeMochaDescription.
  ///
  /// In en, this message translates to:
  /// **'A mocha is a coffee drink made with espresso, chocolate, and steamed milk. It has a rich, indulgent flavor and is often topped with whipped cream and chocolate shavings. The drink originated in Italy and is now enjoyed around the world.'**
  String get coffeeMochaDescription;

  /// No description provided for @detailDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get detailDescription;

  /// No description provided for @detailPrice.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get detailPrice;

  /// No description provided for @detailBuyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now'**
  String get detailBuyNow;

  /// No description provided for @detailReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read More'**
  String get detailReadMore;

  /// No description provided for @detailReadLess.
  ///
  /// In en, this message translates to:
  /// **'Read Less'**
  String get detailReadLess;

  /// No description provided for @detailCoffeeIngredient.
  ///
  /// In en, this message translates to:
  /// **'Coffee'**
  String get detailCoffeeIngredient;

  /// No description provided for @detailMilkIngredient.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get detailMilkIngredient;

  /// No description provided for @detailRoastLevel.
  ///
  /// In en, this message translates to:
  /// **'Medium Roasted'**
  String get detailRoastLevel;

  /// No description provided for @detailBackTooltip.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get detailBackTooltip;

  /// No description provided for @favoriteAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get favoriteAddTooltip;

  /// No description provided for @favoriteRemoveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get favoriteRemoveTooltip;

  /// No description provided for @coffeeAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select coffee (preview)'**
  String get coffeeAddTooltip;

  /// No description provided for @coffeeSelectedPreview.
  ///
  /// In en, this message translates to:
  /// **'{coffeeName} selected (preview only).'**
  String coffeeSelectedPreview(String coffeeName);

  /// No description provided for @coffeeSizeSelectedPreview.
  ///
  /// In en, this message translates to:
  /// **'{coffeeName} ({size}) selected. Ordering is a preview only.'**
  String coffeeSizeSelectedPreview(String coffeeName, String size);

  /// No description provided for @featuredArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'5 Coffee Beans You Must Try'**
  String get featuredArticleTitle;

  /// No description provided for @featuredArticleActionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Coffee article'**
  String get featuredArticleActionTooltip;

  /// No description provided for @homeIntroductionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open introduction'**
  String get homeIntroductionTooltip;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get languageTurkish;

  /// No description provided for @switchToEnglish.
  ///
  /// In en, this message translates to:
  /// **'Switch language to English'**
  String get switchToEnglish;

  /// No description provided for @switchToTurkish.
  ///
  /// In en, this message translates to:
  /// **'Switch language to Turkish'**
  String get switchToTurkish;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
