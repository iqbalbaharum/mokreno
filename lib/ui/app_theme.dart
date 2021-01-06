import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/provider/theme_repository_provider.dart';
import 'package:keretaapp/data/repository/theme_repository.dart';
import 'package:keretaapp/gen/fonts.gen.dart';

final appThemeNotifierProvider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.read(themeRepositoryProvider)));

// color
const primaryColor = Color(0xffa52b2a);
const secondaryColor = Color(0xffa52a65);
const accentColor = Color(0xff17c063);
const errorColor = Color(0xffff5544);

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme:
          GoogleFonts.sourceSansProTextTheme(ThemeData.light().textTheme),
      primaryColor: primaryColor,
      primaryColorDark: secondaryColor,
      accentColor: accentColor,
      errorColor: errorColor);
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.sourceSansProTextTheme(ThemeData.dark().textTheme),
    primaryColor: primaryColor,
    primaryColorDark: secondaryColor,
    accentColor: accentColor,
    errorColor: errorColor,
  );
}

class AppTheme extends ChangeNotifier {
  static const _defaultThemeMode = ThemeMode.light;

  final ThemeRepository _repository;

  ThemeMode _setting;

  ThemeMode get setting => _setting;

  AppTheme(this._repository);

  Future<ThemeMode> themeMode() async {
    if (setting == null) {
      _setting = await _repository.loadThemeMode() ?? _defaultThemeMode;
    }

    return _setting;
  }

  Future<void> loadLightMode() async {
    _setting = ThemeMode.light;
    await _repository.saveThemeMode(setting).whenComplete(notifyListeners);
  }
}
