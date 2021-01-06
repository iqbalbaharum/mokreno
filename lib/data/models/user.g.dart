// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    user: json['user'] as String,
    name: json['name'] as String,
    mobile: json['mobile'] as String,
    email: json['email'] as String,
    session: json['session'] as String,
    roles: (json['roles'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'user': instance.user,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'session': instance.session,
      'roles': instance.roles,
    };
