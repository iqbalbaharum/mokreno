import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/provider/app_shared_preferences_provider.dart';
import 'package:keretaapp/data/repository/user_repository.dart';

final profileViewModelProvider =
    ChangeNotifierProvider((ref) => ProfileViewModel(ref.read(prefsProvider)));

class ProfileViewModel extends ChangeNotifier {
  final AppSharedPreferences _sharedPreferences;

  String _username;
  String _mobile;
  String _email;

  String get username => _username;
  String get mobile => _mobile;
  String get email => _email;

  ProfileViewModel(this._sharedPreferences);

  void init() async {
    _username =
        (await this._sharedPreferences.getInstance()).getString('auth_name');
    _mobile =
        (await this._sharedPreferences.getInstance()).getString('auth_mobile');
    _email =
        (await this._sharedPreferences.getInstance()).getString('auth_email');
  }
}
