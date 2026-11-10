import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  static const Color espresso = Color(0xFFB87945);
  static const Color mocha = Color(0xFF4A2E1F);
  static const Color vanilla = Color(0xFFF5EBDD);
  static const Color sage = Color(0xFF87917A);

  static const Color backgroundColor = mocha;
  static const Color iconColor = sage;
  static const Color iconActiveColor = espresso;
  static const Color cardColor = vanilla;
  static const Color cardChipBackgroundColor = mocha;
  static const Color searchBackgroundColor = vanilla;
  static const Color searchCursorColor = espresso;
  static const Color reviewIconColor = espresso;
  static const Color indicatorInactiveColor = sage;
  static const Color indicatorActiveColor = espresso;
  static const Color buttonBackground1Color = espresso;
  static const Color buttonBackground2Color = sage;
  static const Color buttonBorderColor = espresso;

  static const Color introductionOverlay = Color(0xB34A2E1F);
  static const Color detailOverlay = Color(0xD94A2E1F);

  static ThemeData get theme {
    final textTheme = ThemeData.dark().textTheme.apply(
          bodyColor: vanilla,
          displayColor: vanilla,
        );

    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: espresso,
        onPrimary: mocha,
        secondary: sage,
        onSecondary: mocha,
        surface: mocha,
        onSurface: vanilla,
      ).copyWith(error: espresso, onError: mocha),
      scaffoldBackgroundColor: mocha,
      canvasColor: mocha,
      cardColor: vanilla,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      iconTheme: const IconThemeData(color: vanilla),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: espresso,
        selectionHandleColor: espresso,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: vanilla),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: vanilla,
        contentTextStyle: TextStyle(color: mocha),
      ),
    );
  }

  static TextStyle introtile = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static TextStyle introSubtile = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
  static TextStyle reviewRatting = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );
  static TextStyle tileLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static TextStyle subtileLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle searchTextStyle = GoogleFonts.roboto(
    color: mocha,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cardChipTextStyle = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleMedium = GoogleFonts.roboto(
    color: mocha,
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardTitleSmall = GoogleFonts.roboto(
    color: mocha,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle cardSubtitleLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 14,
    fontWeight: FontWeight.w800,
  );
  static TextStyle cardSubtitleMedium = GoogleFonts.roboto(
    color: mocha,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static TextStyle cardSubtitleSmall = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle priceCurrencySmall = GoogleFonts.roboto(
    color: mocha,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle priceValueSmall = GoogleFonts.roboto(
    color: mocha,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle priceCurrencyLarge = GoogleFonts.roboto(
    color: espresso,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle priceTitleLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle priceValueLarge = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle descriptionTitle = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  static TextStyle descriptionContent = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
  static TextStyle descriptionReadMore = GoogleFonts.roboto(
    color: espresso,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle chipActive = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle chipInactive = GoogleFonts.roboto(
    color: vanilla,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle buttonTextStyle = GoogleFonts.roboto(
    color: mocha,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  static TextStyle buttonActiveTextStyle = GoogleFonts.roboto(
    color: mocha,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  static TextStyle buttonInactiveTextStyle = GoogleFonts.roboto(
    color: mocha,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
}
