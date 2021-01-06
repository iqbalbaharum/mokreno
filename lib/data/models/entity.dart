import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:keretaapp/data/models/entity_metadata.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
abstract class Entity with _$Entity {
  @JsonSerializable(explicitToJson: true)
  factory Entity(
          String state, String status, String userId, EntityMetadata metadata) =
      _Entity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}
