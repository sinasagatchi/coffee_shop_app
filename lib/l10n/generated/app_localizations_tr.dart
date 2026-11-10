// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get introductionTitleOne => 'Kahvenin Tadını Çıkarın';

  @override
  String get introductionSubtitleOne =>
      'Daha önce hiç olmadığı kadar yoğun kahve kokusunu ve lezzetini keşfedin.';

  @override
  String get introductionTitleTwo => 'Kahveyle Anın Tadını Çıkarın';

  @override
  String get introductionSubtitleTwo =>
      'Özenle hazırladığımız harmanları deneyin, farkı hissedin.';

  @override
  String get introductionTitleThree => 'Kahve Keyfinizi Yükseltin';

  @override
  String get introductionSubtitleThree =>
      'Özenle kavrulmuş kahvelerimizin zengin ve güçlü aromalarını keşfedin.';

  @override
  String get getStarted => 'Başlayın';

  @override
  String get allCategory => 'Tümü';

  @override
  String get categoryMacchiato => 'Macchiato';

  @override
  String get categoryFrappe => 'Frappé';

  @override
  String get homeFindTheBest => 'Size en uygun';

  @override
  String get homeCoffeeForYou => 'kahveyi keşfedin';

  @override
  String get homeSpecialForYou => 'Size özel';

  @override
  String get searchCoffeeHint => 'Kahvenizi bulun...';

  @override
  String get searchCoffeeTooltip => 'Kahve ara';

  @override
  String get noCoffeeFound => 'Kahve bulunamadı';

  @override
  String get navigationCompleted => 'Tamamlananlar';

  @override
  String get navigationPending => 'Bekleyenler';

  @override
  String get navigationReminders => 'Hatırlatıcılar';

  @override
  String get coffeeAmericanoName => 'Americano';

  @override
  String get coffeeAmericanoIngredients => 'Kremalı';

  @override
  String get coffeeAmericanoDescription =>
      'Americano, espressoya sıcak su eklenerek hazırlanan bir kahvedir. Filtre kahveye güçlü aromalı bir alternatiftir. İkinci Dünya Savaşı sırasında Avrupa\'daki Amerikalı askerlerin espressolarını daha uzun süre içebilmek için sıcak suyla seyreltmesiyle ortaya çıkmıştır.';

  @override
  String get coffeeLatteName => 'Latte';

  @override
  String get coffeeLatteIngredients => 'Çikolatalı';

  @override
  String get coffeeLatteDescription =>
      'Latte, espresso ve buharda ısıtılmış sütle hazırlanır; üzerine az miktarda süt köpüğü eklenir. İtalya kökenli bu kahve bugün dünyanın dört bir yanında sevilir. Yumuşak ve kremamsı tadı, şeker ya da aromalı şuruplarla tatlandırılabilir.';

  @override
  String get coffeeCappuccinoName => 'Cappuccino';

  @override
  String get coffeeCappuccinoIngredients => 'Yulaf Sütlü';

  @override
  String get coffeeCappuccinoDescription =>
      'Cappuccino, espresso ve buharda ısıtılmış sütle hazırlanır; üzerine genellikle süt köpüğü eklenir. İtalya kökenli bu kahve, güçlü aromasıyla dünyanın dört bir yanında sevilir ve çoğunlukla küçük fincanda servis edilir.';

  @override
  String get coffeeEspressoName => 'Espresso';

  @override
  String get coffeeEspressoIngredients => 'Şekerli';

  @override
  String get coffeeEspressoDescription =>
      'Espresso, ince öğütülmüş kahvenin içinden basınçla sıcak su geçirilerek hazırlanan yoğun bir kahvedir. İtalya kökenlidir ve bugün dünyanın her yerinde içilir. Güçlü aroması nedeniyle genellikle küçük fincanda servis edilir.';

  @override
  String get coffeeMochaName => 'Mocha';

  @override
  String get coffeeMochaIngredients => 'Krem Şantili';

  @override
  String get coffeeMochaDescription =>
      'Mocha, espresso, çikolata ve buharda ısıtılmış sütle hazırlanır. Yoğun ve zengin aroması, üzerine eklenen krem şanti ve çikolata parçalarıyla tamamlanır. İtalya kökenli bu kahve bugün dünyanın dört bir yanında sevilir.';

  @override
  String get detailDescription => 'Açıklama';

  @override
  String get detailPrice => 'Fiyat';

  @override
  String get detailBuyNow => 'Satın Al';

  @override
  String get detailReadMore => 'Devamını Oku';

  @override
  String get detailReadLess => 'Daha Az Göster';

  @override
  String get detailCoffeeIngredient => 'Kahve';

  @override
  String get detailMilkIngredient => 'Süt';

  @override
  String get detailRoastLevel => 'Orta Kavrulmuş';

  @override
  String get detailBackTooltip => 'Geri';

  @override
  String get favoriteAddTooltip => 'Favorilere ekle';

  @override
  String get favoriteRemoveTooltip => 'Favorilerden çıkar';

  @override
  String get coffeeAddTooltip => 'Kahveyi seç (önizleme)';

  @override
  String coffeeSelectedPreview(String coffeeName) {
    return '$coffeeName seçildi (yalnızca önizleme).';
  }

  @override
  String coffeeSizeSelectedPreview(String coffeeName, String size) {
    return '$coffeeName ($size) seçildi. Sipariş özelliği yalnızca önizlemedir.';
  }

  @override
  String get featuredArticleTitle => 'Denemeniz Gereken 5 Kahve Çekirdeği';

  @override
  String get featuredArticleActionTooltip => 'Kahve yazısı';

  @override
  String get homeIntroductionTooltip => 'Tanıtımı aç';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get switchToEnglish => 'Dili İngilizceye değiştir';

  @override
  String get switchToTurkish => 'Dili Türkçeye değiştir';
}
