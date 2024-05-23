import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  // Add products to cart
  void addCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    String? cartQuantity,
    String? cartUnit,
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
      'cartUnit': cartUnit,
    });
  }

  // Get Cart Products
  List<CartModel> cartItems = [];

  void getCartProduct() async {
    List<CartModel> newList = [];
    QuerySnapshot data = await FirebaseFirestore.instance
        .collection('cartsData')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('CustomerCart')
        .get();

    for (var element in data.docs) {
      CartModel cartModel = CartModel(
        cartId: element.get('cartId'),
        cartName: element.get('cartName'),
        cartImageUrl: element.get('cartImage'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
        cartUnit: element.get('cartUnit'),
      );
      newList.add(cartModel);
    }
    cartItems = newList;
    notifyListeners();
  }

  List<CartModel> get getCartProducts {
    return cartItems;
  }

  // Get Total Price
  getTotalPrice() {
    double totalAmount = 0.0;
    for (var element in cartItems) {
      double? price = double.tryParse(element.cartPrice.toString());
      double? quantity = double.tryParse(element.cartQuantity.toString());
      totalAmount += (price! * quantity!);
    }
    return totalAmount;
  }

  // Delete cartProducts
  void deleteCartProducts(cartId) {
    FirebaseFirestore.instance
        .collection('cartsData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('CustomerCart')
        .doc(cartId)
        .delete();
    notifyListeners();
  }

  // Update Cart Products
  void updateCartData({
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
        .update({
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
    });
  }
}
