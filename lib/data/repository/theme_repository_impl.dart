import 'package:flutter/material.dart';
import 'package:keretaapp/data/local/theme_data_source.dart';
import 'package:keretaapp/data/repository/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl({@required ThemeDataSource dataSource})
      : _dataSource = dataSource;

  final ThemeDataSource _dataSource;

  @override
  Future<ThemeMode> loadThemeMode() {
    return _dataSource.loadThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) {
    return _dataSource.saveThemeMode(theme);
  }
}
