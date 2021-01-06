// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Entity _$EntityFromJson(Map<String, dynamic> json) {
  return _Entity.fromJson(json);
}

/// @nodoc
class _$EntityTearOff {
  const _$EntityTearOff();

// ignore: unused_element
  _Entity call(
      String state, String status, String userId, EntityMetadata metadata) {
    return _Entity(
      state,
      status,
      userId,
      metadata,
    );
  }

// ignore: unused_element
  Entity fromJson(Map<String, Object> json) {
    return Entity.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Entity = _$EntityTearOff();

/// @nodoc
mixin _$Entity {
  String get state;
  String get status;
  String get userId;
  EntityMetadata get metadata;

  Map<String, dynamic> toJson();
  $EntityCopyWith<Entity> get copyWith;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res>;
  $Res call(
      {String state, String status, String userId, EntityMetadata metadata});

  $EntityMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$EntityCopyWithImpl<$Res> implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  final Entity _value;
  // ignore: unused_field
  final $Res Function(Entity) _then;

  @override
  $Res call({
    Object state = freezed,
    Object status = freezed,
    Object userId = freezed,
    Object metadata = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed ? _value.state : state as String,
      status: status == freezed ? _value.status : status as String,
      userId: userId == freezed ? _value.userId : userId as String,
      metadata:
          metadata == freezed ? _value.metadata : metadata as EntityMetadata,
    ));
  }

  @override
  $EntityMetadataCopyWith<$Res> get metadata {
    if (_value.metadata == null) {
      return null;
    }
    return $EntityMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc
abstract class _$EntityCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory _$EntityCopyWith(_Entity value, $Res Function(_Entity) then) =
      __$EntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String state, String status, String userId, EntityMetadata metadata});

  @override
  $EntityMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$EntityCopyWithImpl<$Res> extends _$EntityCopyWithImpl<$Res>
    implements _$EntityCopyWith<$Res> {
  __$EntityCopyWithImpl(_Entity _value, $Res Function(_Entity) _then)
      : super(_value, (v) => _then(v as _Entity));

  @override
  _Entity get _value => super._value as _Entity;

  @override
  $Res call({
    Object state = freezed,
    Object status = freezed,
    Object userId = freezed,
    Object metadata = freezed,
  }) {
    return _then(_Entity(
      state == freezed ? _value.state : state as String,
      status == freezed ? _value.status : status as String,
      userId == freezed ? _value.userId : userId as String,
      metadata == freezed ? _value.metadata : metadata as EntityMetadata,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Entity implements _Entity {
  _$_Entity(this.state, this.status, this.userId, this.metadata)
      : assert(state != null),
        assert(status != null),
        assert(userId != null),
        assert(metadata != null);

  factory _$_Entity.fromJson(Map<String, dynamic> json) =>
      _$_$_EntityFromJson(json);

  @override
  final String state;
  @override
  final String status;
  @override
  final String userId;
  @override
  final EntityMetadata metadata;

  @override
  String toString() {
    return 'Entity(state: $state, status: $status, userId: $userId, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Entity &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.metadata, metadata) ||
                const DeepCollectionEquality()
                    .equals(other.metadata, metadata)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(metadata);

  @override
  _$EntityCopyWith<_Entity> get copyWith =>
      __$EntityCopyWithImpl<_Entity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EntityToJson(this);
  }
}

abstract class _Entity implements Entity {
  factory _Entity(
          String state, String status, String userId, EntityMetadata metadata) =
      _$_Entity;

  factory _Entity.fromJson(Map<String, dynamic> json) = _$_Entity.fromJson;

  @override
  String get state;
  @override
  String get status;
  @override
  String get userId;
  @override
  EntityMetadata get metadata;
  @override
  _$EntityCopyWith<_Entity> get copyWith;
}
