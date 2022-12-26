import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_project/model/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert';


void createuser({
  required String firstname,
  required String lastname,
  required String password,
}) async {
  final docUser = FirebaseFirestore.instance.collection('patients').doc();
  final user = User(
      id: docUser.id,
      firstname: firstname,
      lastname: lastname,
      password: password);
      
  final json = user.toJson();
  await docUser.set(json);
}

Stream <List<User>>readUsers() {
  return FirebaseFirestore.instance.collection('patients').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}

Future<void> delete(String id) async {
  await FirebaseFirestore.instance.collection('patients').doc(id).delete();
}