import 'dart:convert';
import 'package:mobile_project/services/user_services.dart';
import 'package:flutter/foundation.dart';

List<User>userFromJson(String str) =>
    List.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.password,})
  


String id;
String firstname;
String lastname;
String password;

factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      password: json["password"],
    );

Map<String, dynamic> toJson() => {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "password": password,
      };}