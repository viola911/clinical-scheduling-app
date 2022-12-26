import 'package:cloud_firebase/cloud_firebase.dart';
import 'package:scheduling_app/model/user.dart';

void createuser({
  required String firstname,
  required String lastname,
  required String password,
}) async {
  final docuser = firebasefirestore.instance.collection('patients').doc();
  final user = user(
      id: docuser.id,
      firstname: firstname,
      lastname: lastname,
      password: password);
  final json = user.toJson();
  await docuser.set(json);
}

Stream<list<user>> readusers() {
  return firebasefirestore.instance.collection('patients').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => user.fromJson(doc.data())).toList());
}

Future<void> delete(String id) async {
  await firebasefirestore.instance.collection('patients').doc(id).delete();
}
