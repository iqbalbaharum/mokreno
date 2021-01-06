import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:keretaapp/data/local/app_shared_preferences.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/data/remote/entity_remote_data_source.dart';

class EntityRemoteDataSourceImpl implements EntityRemoteDataSource {
  final Dio _dio;
  final AppSharedPreferences _sharedPreferences;

  EntityRemoteDataSourceImpl(this._dio, this._sharedPreferences);

  @override
  Future<Entity> create(Entity entity) {
    _dio.options.headers['content-type'] = 'application/json';

    return _dio
        .post<Map<String, dynamic>>(
          '/entity',
          data: json.encode(entity.toJson()),
        )
        .then((response) => Entity.fromJson(response.data));
  }

  @override
  Future<Entity> getUserEntity(String id) {
    _dio.options.headers['content-type'] = 'application/json';

    Map<String, dynamic> filter = {
      'where': {
        {'userId': id}
      }
    };

    return _dio
        .get<Map<String, dynamic>>('/entity', queryParameters: filter)
        .then((response) => Entity.fromJson(response.data));
  }

  @override
  Future<Entity> getLatestEntityByState(String state) {
    _dio.options.headers['content-type'] = 'application/json';
    return _dio
        .get<Map<String, dynamic>>('/entity/state/$state')
        .then((response) => Entity.fromJson(response.data));
  }

  @override
  Future<Entity> getLatestNotEntityByState(String state) {
    _dio.options.headers['content-type'] = 'application/json';
    return _dio
        .get<Map<String, dynamic>>('/entity/not/state/$state')
        .then((response) => Entity.fromJson(response.data));
  }
}
