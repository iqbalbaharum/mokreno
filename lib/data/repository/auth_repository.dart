abstract class AuthRepository {
  Future<String> loadJwt();
  Future<void> saveJwt(String jwt);
}
