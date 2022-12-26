import 'dart:convert';

import 'package:flutter/foundation.dart';

list<user> userFromJson(String str) =>
    list<user>.from(json.decode(str).map((x) => user.fromJson(x)));

String userToJson(list<user> data) =>
    json.encode(list<dynamic>.from(data.map((x) => x.toJson())));

class user {
  required this.id;
  required this.firstname;
  required this.lastname;
  required this.password;

}
String id;
String firstname;
String lastname;
String password;

Factory user.fromJson(Map<String, dynamic> json) => user(
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
    };