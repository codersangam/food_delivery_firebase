import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/wishlist_model.dart';

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
      'wishList': true,
    });
  }

  // Get WishList Products
  List<WishListModel> wishLstItems = [];

  void getWishListProduct() async {
    List<WishListModel> newList = [];
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection('wishListData')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('CustomerWishList')
        .get();

    for (var element in data.docs) {
      WishListModel wishListModel = WishListModel(
        wishListId: element.get('wishListId'),
        wishListName: element.get('wishListName'),
        wishListImage: element.get('wishListImage'),
        wishListPrice: element.get('wishListPrice'),
      );
      newList.add(wishListModel);
    }
    wishLstItems = newList;
    notifyListeners();
  }

  List<WishListModel> get getWishListProducts {
    return wishLstItems;
  }

  // Delete Wishlist Products
  void deleteWishListProducts(wishListId) {
    FirebaseFirestore.instance
        .collection('wishListData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('CustomerWishList')
        .doc(wishListId)
        .delete();
    notifyListeners();
  }
}
