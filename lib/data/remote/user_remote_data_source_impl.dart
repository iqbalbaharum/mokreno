import 'package:dio/dio.dart';
import 'package:keretaapp/data/models/auth.dart';
import 'package:keretaapp/data/models/user.dart';
import 'package:keretaapp/data/remote/user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl(this._dio);

  @override
  Future<Auth> signIn(String username, String password) async {
    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    return _dio.post<Map<String, dynamic>>(
      '/user/login',
      data: {"email": username, "password": password},
    ).then((response) => Auth.fromJson(response.data));
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<User> me() async {
    return _dio
        .get<Map<String, dynamic>>('/me')
        .then((response) => User.fromJson(response.data));
  }

  @override
  Future<User> signUp(
      String username, String email, String mobile, String password) {
    _dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
    return _dio.post<Map<String, dynamic>>(
      '/user',
      data: {
        "name": username,
        "mobile": mobile,
        "email": email,
        "password": password
      },
    ).then((response) => User.fromJson(response.data));
  }
}
