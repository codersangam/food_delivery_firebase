import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  void addCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    String? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('cartsData')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('CustomerCart')
        .doc(cartId)
        .set({
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
    });
  }
}
