import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;

import '../core/models/user.dart';

class CloudFirestore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static final CloudFirestore _cloudFirestore = CloudFirestore._internal();

  factory CloudFirestore() {
    return _cloudFirestore;
  }

  CloudFirestore._internal();

  Future uploadUserData({required User user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(fb.FirebaseAuth.instance.currentUser!.uid)
        .set(user.toMap())
        .then((value) => log("user Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future deleteFavoriteHerb({required String id}) async {
    await FirebaseFirestore.instance
        .collection("favorite")
        .doc(fb.FirebaseAuth.instance.currentUser!.uid)
        .collection("herbs")
        .doc(id)
        .delete()
        .then((value) => log("user Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  Future<User> getUserData() async {
    var snapshot = await firebaseFirestore
        .collection("User")
        .doc(fb.FirebaseAuth.instance.currentUser!.uid)
        .get();

    User user = User.fromMap(snapshot.data() as dynamic);
    return user;
  }

  Future<List<User>> getAllData() async {
    List<User> users = [];
    await firebaseFirestore.collection("users").get().then((value) {
      for (var element in value.docs) {
        users.add(User.fromMap(element.data()));
      }
    });

    return users;
  }

  Future<List<User>> search(
      {required String type,
      required String searchKey,
      required String place}) async {
    List<User> users = [];
    await firebaseFirestore
        .collection("users")
        .where("place", isEqualTo: place)
        .where(type, isGreaterThanOrEqualTo: searchKey)
        .get()
        .then((value) {
      for (var element in value.docs) {
        users.add(User.fromMap(element.data()));
      }
    });

    return users;
  }
}
