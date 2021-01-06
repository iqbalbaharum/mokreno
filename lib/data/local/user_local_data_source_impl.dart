import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/local/user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final AppSharedPreferences _prefs;

  static const String keyName = 'auth_name';
  static const String keyMobile = 'auth_mobile';
  static const String keyUuid = 'auth_uuid';
  static const String keyEmail = 'auth_email';
  static const String keyRoles = 'auth_roles';

  UserLocalDataSourceImpl(this._prefs);

  @override
  Future<void> saveEmail(String email) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyEmail, email);
  }

  @override
  Future<void> saveMobile(String mobile) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyMobile, mobile);
  }

  @override
  Future<void> saveName(String name) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyName, name);
  }

  @override
  Future<void> saveUserId(String uuid) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyUuid, uuid);
  }

  @override
  Future<String> loadEmail() async {
    final prefs = await _prefs.getInstance();
    return prefs.getString(keyEmail);
  }

  @override
  Future<String> loadMobile() async {
    final prefs = await _prefs.getInstance();
    return prefs.getString(keyMobile);
  }

  @override
  Future<String> loadName() async {
    final prefs = await _prefs.getInstance();
    return prefs.getString(keyName);
  }

  @override
  Future<String> loadUserId() async {
    final prefs = await _prefs.getInstance();
    return prefs.getString(keyUuid);
  }

  @override
  Future<List<String>> loadRoles() async {
    final prefs = await _prefs.getInstance();
    return prefs.getStringList(keyUuid);
  }

  @override
  Future<void> saveRoles(List<String> roles) async {
    final prefs = await _prefs.getInstance();
    prefs.setStringList(keyRoles, roles);
  }
}
