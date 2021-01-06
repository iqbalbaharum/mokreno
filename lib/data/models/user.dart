import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {String user,
      String name,
      String mobile,
      String email,
      String session,
      List<String> roles}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
