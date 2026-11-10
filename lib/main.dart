import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop_app/app_locale_scope.dart';
import 'package:flutter_coffee_shop_app/l10n/generated/app_localizations.dart';
import 'package:flutter_coffee_shop_app/ui/screens/screens.dart';
import 'package:flutter_coffee_shop_app/ui/theme/app_theme.dart';

void main() {
  DevicePreview.enable(enabled: !kReleaseMode);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _setLocale(Locale locale) {
    if (_locale == locale) return;
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse}),
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [Locale('en'), Locale('tr', 'TR')],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: Apptheme.theme,
      builder: (context, child) => AppLocaleScope(
        locale: _locale,
        onLocaleChanged: _setLocale,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: child!,
        ),
      ),
      home: const IntroductionScreen(),
    );
  }
}
