import 'package:flutter/cupertino.dart';
import 'package:keretaapp/data/local/auth_data_source.dart';
import 'package:keretaapp/data/local/user_local_data_source.dart';
import 'package:keretaapp/data/models/auth.dart';
import 'package:keretaapp/data/models/result.dart';
import 'package:keretaapp/data/models/user.dart';
import 'package:keretaapp/data/remote/user_remote_data_source.dart';
import 'package:keretaapp/data/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl({@required localDataSource, @required remoteDataSource})
      : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  // Getter
  @override
  Future<String> loadUserId() {
    return _localDataSource.loadUserId();
  }

  @override
  Future<String> loadEmail() {
    return _localDataSource.loadEmail();
  }

  @override
  Future<String> loadMobile() {
    return _localDataSource.loadMobile();
  }

  @override
  Future<String> loadName() {
    return _localDataSource.loadName();
  }

  @override
  Future<void> saveEmail(String email) {
    return _localDataSource.saveEmail(email);
  }

  @override
  Future<void> saveMobile(String mobile) {
    return _localDataSource.saveMobile(mobile);
  }

  @override
  Future<void> saveName(String name) {
    return _localDataSource.saveName(name);
  }

  @override
  Future<void> saveUserId(String uuid) {
    return _localDataSource.saveUserId(uuid);
  }

  @override
  Future<List<String>> loadRoles() {
    return _localDataSource.loadRoles();
  }

  @override
  Future<void> saveRoles(List<String> roles) {
    return _localDataSource.saveRoles(roles);
  }

  // Methods
  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_remoteDataSource.signOut);
  }

  @override
  Future<Result<Auth>> signIn(String username, String password) {
    return Result.guardFuture(
        () => _remoteDataSource.signIn(username, password));
  }

  @override
  Future<Result<User>> me() {
    return Result.guardFuture(_remoteDataSource.me);
  }

  @override
  Future<Result<User>> signUp(
      String username, String email, String mobile, String password) {
    return Result.guardFuture(
        () => _remoteDataSource.signUp(username, email, mobile, password));
  }
}
