import 'package:flutter/foundation.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/data/models/result.dart';
import 'package:keretaapp/data/remote/entity_remote_data_source.dart';

import 'entity_repository.dart';

class EntityRepositoryImpl implements EntityRepository {
  EntityRepositoryImpl({@required EntityRemoteDataSource dataSource})
      : _dataSource = dataSource;

  final EntityRemoteDataSource _dataSource;

  @override
  Future<Result<Entity>> create(Entity entity) {
    return Result.guardFuture(() => _dataSource.create(entity));
  }

  @override
  Future<Result<Entity>> getUserEntity(String id) {
    return Result.guardFuture(() => _dataSource.getUserEntity(id));
  }

  @override
  Future<Result<Entity>> getLatestEntityByState(String state) {
    return Result.guardFuture(() => _dataSource.getLatestEntityByState(state));
  }

  @override
  Future<Result<Entity>> getLatestNotEntityByState(String notstate) {
    return Result.guardFuture(
        () => _dataSource.getLatestNotEntityByState(notstate));
  }
}
