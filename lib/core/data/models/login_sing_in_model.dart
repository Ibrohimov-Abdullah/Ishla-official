// To parse this JSON data, do
//
//     final loginSignModel = loginSignModelFromJson(jsonString);

import 'dart:convert';

LoginSignModel loginSignModelFromJson(String str) => LoginSignModel.fromJson(json.decode(str));

String loginSignModelToJson(LoginSignModel data) => json.encode(data.toJson());

class LoginSignModel {
  final String? access;
  final String? refresh;
  final User? user;

  LoginSignModel({
    this.access,
    this.refresh,
    this.user,
  });

  LoginSignModel copyWith({
    String? access,
    String? refresh,
    User? user,
  }) =>
      LoginSignModel(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
        user: user ?? this.user,
      );

  factory LoginSignModel.fromJson(Map<String, dynamic> json) => LoginSignModel(
    access: json["access"],
    refresh: json["refresh"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "access": access,
    "refresh": refresh,
    "user": user?.toJson(),
  };
}

class User {
  final int? pk;
  final String? email;

  User({
    this.pk,
    this.email,
  });

  User copyWith({
    int? pk,
    String? email,
  }) =>
      User(
        pk: pk ?? this.pk,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    pk: json["pk"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "pk": pk,
    "email": email,
  };
}