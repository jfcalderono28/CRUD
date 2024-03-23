import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Buscar
Future<List> getPeople() async {
  List people = [];

  CollectionReference collectionReferencePeople = db.collection("people");
  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var documento in queryPeople.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {"name": data["name"], "uid": documento.id};
    people.add(person);
  }

  return people;
}

//guardar
Future<void> savePeople(String name) async {
  await db.collection("people").add({"name": name});
}

//actualizar
Future<void> updatePeople(String uid, String newName) async {
  await db.collection("people").doc(uid).update({"name": newName});
}

//Borrar
Future<void> deletePeople(
  String uid,
) async {
  await db.collection("people").doc(uid).delete();
}
