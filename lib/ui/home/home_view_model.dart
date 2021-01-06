import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/data/models/result.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/provider/entity_repository_provider.dart';
import 'package:keretaapp/data/provider/user_repository_provider.dart';
import 'package:keretaapp/data/repository/entity_repository.dart';
import 'package:keretaapp/data/repository/user_repository.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel(
    ref.read(userRepositoryProvider),
    ref.read(entityRepositoryProvider),
    ref.read(prefsProvider)));

class HomeViewModel extends ChangeNotifier {
  final UserRepository _userRepository;
  final EntityRepository _entityRepository;
  final AppSharedPreferences _sharedPreferences;

  Result<Entity> _activeEntity;

  Result<Entity> get activeEntity => _activeEntity;

  HomeViewModel(
      this._userRepository, this._entityRepository, this._sharedPreferences);

  Future<String> getUsername() async {
    return (await this._sharedPreferences.getInstance()).getString('auth_name');
  }

  Future<String> getEmail() async {
    return (await this._sharedPreferences.getInstance())
        .getString('auth_email');
  }

  Future<void> getActiveEntity() async {
    return _entityRepository
        .getLatestNotEntityByState('end')
        .then((value) => _activeEntity = value)
        .whenComplete(notifyListeners);
  }
}
