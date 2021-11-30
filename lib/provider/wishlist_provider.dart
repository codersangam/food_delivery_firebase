import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    String? wishListId,
    String? wishListName,
    String? wishListImage,
    String? wishListPrice,
    String? wishListQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('wishListData')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('CustomerWishList')
        .doc(wishListId)
        .set({
      'wishListId': wishListId,
      'wishListName': wishListName,
      'wishListImage': wishListImage,
      'wishListPrice': wishListPrice,
      'wishListQuantity': wishListQuantity,
    });
  }
}
