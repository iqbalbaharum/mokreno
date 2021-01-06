import 'package:keretaapp/data/models/user.dart';

abstract class AuthDataSource {
  Future<String> loadJwt();
  Future<void> saveJwt(String jwt);
}
