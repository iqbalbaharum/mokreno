import 'package:keretaapp/data/models/auth.dart';
import 'package:keretaapp/data/models/user.dart';

abstract class UserRemoteDataSource {
  Future<Auth> signIn(String username, String password);
  Future<User> me();
  Future<User> signUp(
      String username, String email, String mobile, String password);
  Future<void> signOut();
}
