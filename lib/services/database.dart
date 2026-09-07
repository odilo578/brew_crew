import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Database {
  // Firestore.instance is now FirebaseFireStore.instance
final String uid;
Database({required this.uid});
// collection referece
final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

Future updateUserData(String sugars, String name, int strength) async {
  return await brewCollection.doc(uid).set({
    'sugars' : sugars, 
    'name' : name, 
    'strength' : strength,
  });
}
//get bre's stream

Stream<QuerySnapshot> get brews {
  return brewCollection.snapshots();
}
}
