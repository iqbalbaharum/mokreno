// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'entity_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
EntityMetadata _$EntityMetadataFromJson(Map<String, dynamic> json) {
  return _EntityMetadata.fromJson(json);
}

/// @nodoc
class _$EntityMetadataTearOff {
  const _$EntityMetadataTearOff();

// ignore: unused_element
  _EntityMetadata call(String contactName, String contactNumber, String type,
      String plateno, String transmission, String runnerName) {
    return _EntityMetadata(
      contactName,
      contactNumber,
      type,
      plateno,
      transmission,
      runnerName,
    );
  }

// ignore: unused_element
  EntityMetadata fromJson(Map<String, Object> json) {
    return EntityMetadata.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $EntityMetadata = _$EntityMetadataTearOff();

/// @nodoc
mixin _$EntityMetadata {
  String get contactName;
  String get contactNumber;
  String get type;
  String get plateno;
  String get transmission;
  String get runnerName;

  Map<String, dynamic> toJson();
  $EntityMetadataCopyWith<EntityMetadata> get copyWith;
}

/// @nodoc
abstract class $EntityMetadataCopyWith<$Res> {
  factory $EntityMetadataCopyWith(
          EntityMetadata value, $Res Function(EntityMetadata) then) =
      _$EntityMetadataCopyWithImpl<$Res>;
  $Res call(
      {String contactName,
      String contactNumber,
      String type,
      String plateno,
      String transmission,
      String runnerName});
}

/// @nodoc
class _$EntityMetadataCopyWithImpl<$Res>
    implements $EntityMetadataCopyWith<$Res> {
  _$EntityMetadataCopyWithImpl(this._value, this._then);

  final EntityMetadata _value;
  // ignore: unused_field
  final $Res Function(EntityMetadata) _then;

  @override
  $Res call({
    Object contactName = freezed,
    Object contactNumber = freezed,
    Object type = freezed,
    Object plateno = freezed,
    Object transmission = freezed,
    Object runnerName = freezed,
  }) {
    return _then(_value.copyWith(
      contactName:
          contactName == freezed ? _value.contactName : contactName as String,
      contactNumber: contactNumber == freezed
          ? _value.contactNumber
          : contactNumber as String,
      type: type == freezed ? _value.type : type as String,
      plateno: plateno == freezed ? _value.plateno : plateno as String,
      transmission: transmission == freezed
          ? _value.transmission
          : transmission as String,
      runnerName:
          runnerName == freezed ? _value.runnerName : runnerName as String,
    ));
  }
}

/// @nodoc
abstract class _$EntityMetadataCopyWith<$Res>
    implements $EntityMetadataCopyWith<$Res> {
  factory _$EntityMetadataCopyWith(
          _EntityMetadata value, $Res Function(_EntityMetadata) then) =
      __$EntityMetadataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contactName,
      String contactNumber,
      String type,
      String plateno,
      String transmission,
      String runnerName});
}

/// @nodoc
class __$EntityMetadataCopyWithImpl<$Res>
    extends _$EntityMetadataCopyWithImpl<$Res>
    implements _$EntityMetadataCopyWith<$Res> {
  __$EntityMetadataCopyWithImpl(
      _EntityMetadata _value, $Res Function(_EntityMetadata) _then)
      : super(_value, (v) => _then(v as _EntityMetadata));

  @override
  _EntityMetadata get _value => super._value as _EntityMetadata;

  @override
  $Res call({
    Object contactName = freezed,
    Object contactNumber = freezed,
    Object type = freezed,
    Object plateno = freezed,
    Object transmission = freezed,
    Object runnerName = freezed,
  }) {
    return _then(_EntityMetadata(
      contactName == freezed ? _value.contactName : contactName as String,
      contactNumber == freezed ? _value.contactNumber : contactNumber as String,
      type == freezed ? _value.type : type as String,
      plateno == freezed ? _value.plateno : plateno as String,
      transmission == freezed ? _value.transmission : transmission as String,
      runnerName == freezed ? _value.runnerName : runnerName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EntityMetadata implements _EntityMetadata {
  _$_EntityMetadata(this.contactName, this.contactNumber, this.type,
      this.plateno, this.transmission, this.runnerName)
      : assert(contactName != null),
        assert(contactNumber != null),
        assert(type != null),
        assert(plateno != null),
        assert(transmission != null),
        assert(runnerName != null);

  factory _$_EntityMetadata.fromJson(Map<String, dynamic> json) =>
      _$_$_EntityMetadataFromJson(json);

  @override
  final String contactName;
  @override
  final String contactNumber;
  @override
  final String type;
  @override
  final String plateno;
  @override
  final String transmission;
  @override
  final String runnerName;

  @override
  String toString() {
    return 'EntityMetadata(contactName: $contactName, contactNumber: $contactNumber, type: $type, plateno: $plateno, transmission: $transmission, runnerName: $runnerName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EntityMetadata &&
            (identical(other.contactName, contactName) ||
                const DeepCollectionEquality()
                    .equals(other.contactName, contactName)) &&
            (identical(other.contactNumber, contactNumber) ||
                const DeepCollectionEquality()
                    .equals(other.contactNumber, contactNumber)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.plateno, plateno) ||
                const DeepCollectionEquality()
                    .equals(other.plateno, plateno)) &&
            (identical(other.transmission, transmission) ||
                const DeepCollectionEquality()
                    .equals(other.transmission, transmission)) &&
            (identical(other.runnerName, runnerName) ||
                const DeepCollectionEquality()
                    .equals(other.runnerName, runnerName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contactName) ^
      const DeepCollectionEquality().hash(contactNumber) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(plateno) ^
      const DeepCollectionEquality().hash(transmission) ^
      const DeepCollectionEquality().hash(runnerName);

  @override
  _$EntityMetadataCopyWith<_EntityMetadata> get copyWith =>
      __$EntityMetadataCopyWithImpl<_EntityMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EntityMetadataToJson(this);
  }
}

abstract class _EntityMetadata implements EntityMetadata {
  factory _EntityMetadata(
      String contactName,
      String contactNumber,
      String type,
      String plateno,
      String transmission,
      String runnerName) = _$_EntityMetadata;

  factory _EntityMetadata.fromJson(Map<String, dynamic> json) =
      _$_EntityMetadata.fromJson;

  @override
  String get contactName;
  @override
  String get contactNumber;
  @override
  String get type;
  @override
  String get plateno;
  @override
  String get transmission;
  @override
  String get runnerName;
  @override
  _$EntityMetadataCopyWith<_EntityMetadata> get copyWith;
}
