import 'package:flutter/material.dart';
import 'package:keretaapp/data/models/entity.dart';
import 'package:keretaapp/data/models/result.dart';

abstract class EntityRepository {
  Future<Result<Entity>> create(Entity entity);
  Future<Result<Entity>> getUserEntity(String id);
  Future<Result<Entity>> getLatestEntityByState(String state);
  Future<Result<Entity>> getLatestNotEntityByState(String notstate);
}
