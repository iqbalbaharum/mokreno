import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_metadata.freezed.dart';
part 'entity_metadata.g.dart';

@freezed
abstract class EntityMetadata with _$EntityMetadata {
  factory EntityMetadata(String contactName, String contactNumber, String type,
      String plateno, String transmission, String runnerName) = _EntityMetadata;

  factory EntityMetadata.fromJson(Map<String, dynamic> json) =>
      _$EntityMetadataFromJson(json);
}
