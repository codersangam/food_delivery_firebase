import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  void addUserData({
    User? currentUser,
    String? userName,
    String? userImage,
    String? userEmail,
  }) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser!.uid)
        .set({
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'userId': currentUser.uid,
    });
  }
}
