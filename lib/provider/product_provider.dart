import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbProducts = [];
  ProductModel? productModel;

  fetchHerbProducts() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbProducts').get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      // ignore: avoid_print
      print(element);
      productModel = ProductModel(
        productName: element.get('productName'),
        productImageUrl: element.get('productImageUrl'),
        productPrice: element.get('productPrice'),
      );
      newList.add(productModel!);
    });
    herbProducts = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbProducts {
    return herbProducts;
  }

  List<ProductModel> fruitProducts = [];
  fetchFruitProducts() async {
    List<ProductModel> myList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('FruitProducts').get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      // ignore: avoid_print
      print(element);
      productModel = ProductModel(
        productName: element.get('productName'),
        productImageUrl: element.get('productImageUrl'),
        productPrice: element.get('productPrice'),
      );
      myList.add(productModel!);
    });
    fruitProducts = myList;
    notifyListeners();
  }

  List<ProductModel> get getFruitProducts {
    return fruitProducts;
  }
}
