// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntityMetadata _$_$_EntityMetadataFromJson(Map<String, dynamic> json) {
  return _$_EntityMetadata(
    json['contactName'] as String,
    json['contactNumber'] as String,
    json['type'] as String,
    json['plateno'] as String,
    json['transmission'] as String,
    json['runnerName'] as String,
  );
}

Map<String, dynamic> _$_$_EntityMetadataToJson(_$_EntityMetadata instance) =>
    <String, dynamic>{
      'contactName': instance.contactName,
      'contactNumber': instance.contactNumber,
      'type': instance.type,
      'plateno': instance.plateno,
      'transmission': instance.transmission,
      'runnerName': instance.runnerName,
    };
