import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cse_connect/constants/custom_theme.dart';
import 'package:cse_connect/view_model/base_view_model.dart';

/// AppTheme class is a type of ViewModel to serve data from model to views in the context of App Themes.
///
/// Methods include:
/// * `switchTheme`
class AppTheme extends BaseModel {
  /// Key for dynamic theme.
  final String key = "DynamicTheme";

  late SharedPreferences _pref;
  late bool _isDarkMode;

  /// flag to check darkMode.
  bool get isdarkTheme => _isDarkMode;

  /// getter to fetch current theme.
  ThemeData get theme =>
      isdarkTheme ? CseConnectTheme.darkTheme : CseConnectTheme.lightTheme;

  /// Initializes the theme settings.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialize() {
    _isDarkMode = false;
    _loadFromPrefs();
  }

  /// This function switches the app theme.
  ///
  /// **params**:
  /// * `isOn`: `bool` type, the state to switch the theme to (true for Dark, false for Light).
  ///
  /// **returns**:
  ///   None
  void switchTheme({required bool isOn}) {
    _isDarkMode = isOn;
    _saveToPrefs();
    notifyListeners();
  }

  /// Initializes the SharedPreferences instance.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _initPrefs() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// Loads the theme preference from SharedPreferences.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _isDarkMode = _pref.getBool(key) ?? false;
    notifyListeners();
  }

  /// Saves the theme preference to SharedPreferences.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _isDarkMode);
  }
}
