// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  UserListModel({
    required this.userName,
    required this.userEmail,
    required this.signInMethod,
    this.password,
  });

  String userName;
  String userEmail;
  String? password;
  String? signInMethod;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    userName: json["userName"],
    userEmail: json["userEmail"],
    password: json["password"],
    signInMethod: json["signInMethod"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "userEmail": userEmail,
    "password": password,
    "signInMethod": signInMethod,
  };
}
