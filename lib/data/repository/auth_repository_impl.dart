import 'package:flutter/foundation.dart';
import 'package:keretaapp/data/local/auth_data_source.dart';
import 'package:keretaapp/data/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({@required AuthDataSource dataSource})
      : _dataSource = dataSource;

  final AuthDataSource _dataSource;

  @override
  Future<void> saveJwt(String jwt) {
    return _dataSource.saveJwt(jwt);
  }

  @override
  Future<String> loadJwt() {
    return _dataSource.loadJwt();
  }
}
