// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entity _$_$_EntityFromJson(Map<String, dynamic> json) {
  return _$_Entity(
    json['state'] as String,
    json['status'] as String,
    json['userId'] as String,
    json['metadata'] == null
        ? null
        : EntityMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_EntityToJson(_$_Entity instance) => <String, dynamic>{
      'state': instance.state,
      'status': instance.status,
      'userId': instance.userId,
      'metadata': instance.metadata?.toJson(),
    };
