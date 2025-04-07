import 'package:flutter/material.dart';

///This file contains various custom themes.
///
///For instance, lightTheme, darkTheme, _lightTextTheme, _darkTextTheme, etc.
///These are imported to other files/widgets to apply the required themes.
class CseConnectTheme {
  static const Color _lightCursorColor = Color(0xFF000000);
  static const Color _lightAccentColor = Color(0xFF000000);
  static const Color _lightScaffoldColor = Colors.white;
  static const Color _lightPrimaryColor =  Color(0xFF35A0CB);
  static const Color _lightOnPrimaryColor = Color(0xFFFFFFFF);
  static const Color _lightPrimaryContainer =  Color(0xFF71D3ED);
  static const Color _lightonPrimaryContainer =  Color(0xFF000000);
  static const Color _lightPrimaryFixed = Color(0xFFD3EAF3);
  static const Color _lightOnPrimaryFixed = Color(0xFF174659);
  static const Color _lightPrimaryFixedDim = Color(0xFFA6D5E8);
  static const Color _lightonPrimaryFixedVariant = Color(0xFF1B5167);
  static const Color _lightSecondary = Color(0xFF89D1C8);
  static const Color _lightOnSecondaryColor = Color(0xFF000000);
  static const Color _lightSecondaryContainer =  Color(0xFF91F4E8);
  static const Color _lightOnSecondaryContainer = Color(0xFF000000);
  static const Color _lightSecondaryFixed = Color(0xFFCBE4E1);
  static const Color _lightOnSecondaryFixed = Color(0xFF091716);
  static const Color _lightSecondaryFixedDim = Color(0xFFAFD4D0);
  static const Color _lightonSecondaryFixedVariant = Color(0xFF173B36);
  static const Color _lightTertiaryColor =  Color(0xFF61D4D4);
  static const Color _lightOnTertiaryColor = Color(0xFF000000);
  static const Color _lightTertiaryContainer =  Color(0xFF8FF3F2);
  static const Color _lightonTertiaryContainer =  Color(0xFF8FF3F2);
  static const Color _lightTertiaryFixed = Color(0xFFBAE3E3);
  static const Color _lightOnTertiaryFixed = Color(0xFF010202);
  static const Color _lightTertiaryFixedDim = Color(0xFFA6D5E8);
  static const Color _lightonTertiaryFixedVariant = Color(0xFF0B2626);
  static const Color _error = Color(0xFFFFFFFF);
  static const Color _onError = Color(0xFFFFFFFF);
  static const Color _errorContainer =  Color(0xFF71D3ED);
  static const Color _onErrorContainer =  Color(0xFF71D3ED);
  static const Color _surface =  Color(0xFFFCFCFC);
  static const Color _onSurface =  Color(0xFF111111);
  static const Color _surfaceDim = Color(0xFFD3EAF3);
  static const Color _surfaceBright = Color(0xFFD3EAF3);
  static const Color _surfaceContainerLowest = Color(0xFF174659);
  static const Color _surfaceContainer = Color(0xFFA6D5E8);
  static const Color _onSurfaceVariant = Color(0xFF1B5167);


  static const Color _lightPrimaryVariantColor = Color(0xFFCBE4E1);
  static const Color _lightIconColor = Color(0xFF000000);
  static const Color _lightInBlack = Color(0xff000000);
  static const Color _lightColorSchemePrimary = Color(0xFFCBE4E1);

  static const Color _darkCursorColor = Color(0xFFFFFFFF);
  static const Color _darkAccentColor = Color(0xFFFFFFFF);
  static const Color _darkScaffoldColor = Color(0xFF005049);
  static const Color _darkPrimaryColor = Colors.black;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkIconColor = Colors.white70;
  static const Color _darkInWhite = Color(0xffffffff);
  static const Color _darkColorSchemePrimary = Color(0xFFCBE4E1);

  /// Theme for light mode.
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: _surface,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _lightCursorColor,
    ),
    primaryColor: _lightPrimaryColor,
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    inputDecorationTheme: _lightInputDecor,
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      onPrimary: _lightOnPrimaryColor,
      primaryContainer: _lightPrimaryContainer,
      onPrimaryContainer: _lightonPrimaryContainer,
      primaryFixed: _lightPrimaryFixed,
      onPrimaryFixed: _lightOnPrimaryFixed,
      primaryFixedDim: _lightPrimaryFixedDim,
      onPrimaryFixedVariant: _lightonPrimaryFixedVariant,
      secondary: _lightSecondary,
      onSecondary: _lightOnSecondaryColor,
      secondaryContainer: _lightSecondaryContainer,
      onSecondaryContainer:_lightOnSecondaryContainer,
      secondaryFixed: _lightSecondaryFixed,
      onSecondaryFixed: _lightOnSecondaryFixed,
      secondaryFixedDim: _lightSecondaryFixedDim,
      onSecondaryFixedVariant: _lightonSecondaryFixedVariant,
      tertiary: _lightTertiaryColor,
      onTertiary: _lightOnTertiaryColor,
      tertiaryContainer: _lightTertiaryContainer,
      onTertiaryContainer:_lightonTertiaryContainer,
      tertiaryFixed: _lightTertiaryFixed,
      onTertiaryFixed: _lightOnTertiaryFixed,
      tertiaryFixedDim: _lightTertiaryFixedDim,
      onTertiaryFixedVariant: _lightonTertiaryFixedVariant,
    ).copyWith(secondary: _lightAccentColor),
  );

  /// Theme for dark mode.
  static final darkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _darkCursorColor,
    ),
    scaffoldBackgroundColor: _darkScaffoldColor,
    primaryColor: _darkPrimaryColor,
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    textTheme: _darkTextTheme,
    inputDecorationTheme: _darkInputDecor,
    colorScheme: const ColorScheme.dark(
      primaryContainer: _darkPrimaryVariantColor,
      primary: _darkColorSchemePrimary,
      secondary: Colors.black,
      onSecondary: Colors.white,
      secondaryContainer: _lightScaffoldColor,
      tertiary: Colors.white70,
      tertiaryContainer: Color.fromARGB(255, 61, 61, 61),
    ).copyWith(secondary: _darkAccentColor),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
    ),
    headlineSmall: TextStyle(
      color: _lightInBlack,
      fontSize: 20,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyLarge: TextStyle(fontSize: 14, color: Color(0xFF737373)),
    bodyMedium: TextStyle(fontSize: 14),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF737373),
      fontSize: 12.0,
    ),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
    ),
    headlineSmall: TextStyle(color: _darkInWhite, fontSize: 20),
    titleLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFF737373),
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      color: Color(0xFF737373),
      fontSize: 12.0,
    ),
  );

  static const InputDecorationTheme _lightInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );
  static const InputDecorationTheme _darkInputDecor = InputDecorationTheme(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF008A37)),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorMaxLines: 3,
  );
}
