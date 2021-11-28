import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    cartProvider.getCartProduct();
    return Scaffold(
      appBar: AppBar(
        title: 'Cart'.text.make(),
      ),
      body: ListView.builder(
          itemCount: cartProvider.getCartProducts.length,
          itemBuilder: (context, index) {
            CartModel data = cartProvider.getCartProducts[index];
            // ignore: avoid_print
            print(data);
            return Column(
              children: [
                CartItems(
                  productName: data.cartName.toString(),
                  productImageUrl: data.cartImageUrl.toString(),
                  productPrice: data.cartPrice.toString(),
                ),
              ],
            );
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: '90\$'.text.xl3.bold.make(),
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: 'Checkout'.text.xl.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
  }) : super(key: key);

  final String productName;
  final String productImageUrl;
  final String productPrice;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(productImageUrl),
      title: productName.text.make(),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '$productPrice\$/50 gm'.text.make(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      trailing: const VxStepper(
        min: 1,
        max: 20,
      ),
    );
  }
}
