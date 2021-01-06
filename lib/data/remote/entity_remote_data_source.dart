import 'package:keretaapp/data/models/entity.dart';

abstract class EntityRemoteDataSource {
  Future<Entity> create(Entity entity);
  Future<Entity> getUserEntity(String id);
  Future<Entity> getLatestEntityByState(String state);
  Future<Entity> getLatestNotEntityByState(String state);
}
