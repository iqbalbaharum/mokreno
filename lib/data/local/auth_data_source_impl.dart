import 'package:enum_to_string/enum_to_string.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/local/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final AppSharedPreferences _prefs;

  static const String keyJwt = 'auth_jwt';

  AuthDataSourceImpl(this._prefs);

  @override
  Future<void> saveJwt(String jwt) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyJwt, jwt);
  }

  @override
  Future<String> loadJwt() async {
    final prefs = await _prefs.getInstance();
    return prefs.getString(keyJwt);
  }
}
