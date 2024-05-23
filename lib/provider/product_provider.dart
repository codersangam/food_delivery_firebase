import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;

  List<ProductModel> search = [];

  productsModel(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productId: element.get('productId'),
      productName: element.get('productName'),
      productImageUrl: element.get('productImageUrl'),
      productPrice: element.get('productPrice'),
      productUnit: element.get('productUnit'),
    );
    search.add(productModel!);
  }

  // Get Fruit Prodcuts
  List<ProductModel> herbProducts = [];
  fetchHerbProducts() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('HerbProducts').get();

    for (var element in value.docs) {
      // ignore: avoid_print
      print(element);
      productsModel(element);
      newList.add(productModel!);
    }
    herbProducts = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbProducts {
    return herbProducts;
  }

  // Get Fruit Prodcuts
  List<ProductModel> fruitProducts = [];
  fetchFruitProducts() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('FruitProducts').get();

    // ignore: avoid_function_literals_in_foreach_calls
    value.docs.forEach((element) {
      // ignore: avoid_print
      print(element);
      productsModel(element);
      newList.add(productModel!);
    });
    fruitProducts = newList;
    notifyListeners();
  }

  List<ProductModel> get getFruitProducts {
    return fruitProducts;
  }

  // Return SearchItems
  List<ProductModel> get getSearchProducts {
    return search;
  }
}
