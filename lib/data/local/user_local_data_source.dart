abstract class UserLocalDataSource {
  Future<String> loadUserId();
  Future<String> loadName();
  Future<String> loadMobile();
  Future<String> loadEmail();
  Future<List<String>> loadRoles();

  Future<void> saveUserId(String uuid);
  Future<void> saveName(String name);
  Future<void> saveMobile(String mobile);
  Future<void> saveEmail(String email);
  Future<void> saveRoles(List<String> roles);
}
