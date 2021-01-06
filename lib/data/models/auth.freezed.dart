// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Auth _$AuthFromJson(Map<String, dynamic> json) {
  return _Auth.fromJson(json);
}

/// @nodoc
class _$AuthTearOff {
  const _$AuthTearOff();

// ignore: unused_element
  _Auth call({String token}) {
    return _Auth(
      token: token,
    );
  }

// ignore: unused_element
  Auth fromJson(Map<String, Object> json) {
    return Auth.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Auth = _$AuthTearOff();

/// @nodoc
mixin _$Auth {
  String get token;

  Map<String, dynamic> toJson();
  $AuthCopyWith<Auth> get copyWith;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res> implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  final Auth _value;
  // ignore: unused_field
  final $Res Function(Auth) _then;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

/// @nodoc
abstract class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) then) =
      __$AuthCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> extends _$AuthCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(_Auth _value, $Res Function(_Auth) _then)
      : super(_value, (v) => _then(v as _Auth));

  @override
  _Auth get _value => super._value as _Auth;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(_Auth(
      token: token == freezed ? _value.token : token as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Auth implements _Auth {
  const _$_Auth({this.token});

  factory _$_Auth.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'Auth(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Auth &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthToJson(this);
  }
}

abstract class _Auth implements Auth {
  const factory _Auth({String token}) = _$_Auth;

  factory _Auth.fromJson(Map<String, dynamic> json) = _$_Auth.fromJson;

  @override
  String get token;
  @override
  _$AuthCopyWith<_Auth> get copyWith;
}
