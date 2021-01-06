import 'package:keretaapp/data/models/auth.dart';
import 'package:keretaapp/data/models/result.dart';
import 'package:keretaapp/data/models/user.dart';

abstract class UserRepository {
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

  Future<Result<Auth>> signIn(String username, String password);
  Future<Result<User>> me();
  Future<Result<void>> signOut();
  Future<Result<User>> signUp(
      String username, String email, String mobile, String password);
}
