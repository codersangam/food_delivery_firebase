import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:food_delivery/utils/utils.dart';
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
      body: cartProvider.getCartProducts.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_cart.png',
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                ).centered(),
              ],
            )
          : ListView.builder(
              itemCount: cartProvider.getCartProducts.length,
              itemBuilder: (context, index) {
                CartModel data = cartProvider.getCartProducts[index];
                // ignore: avoid_print
                print(data);
                return Column(
                  children: [
                    CartItems(
                      productId: data.cartId.toString(),
                      productName: data.cartName.toString(),
                      productImageUrl: data.cartImageUrl.toString(),
                      productPrice: data.cartPrice.toString(),
                      productQuantity: data.cartQuantity.toString(),
                      productUnit: data.cartUnit.toString(),
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

// ignore: must_be_immutable
class CartItems extends StatefulWidget {
  CartItems(
      {Key? key,
      required this.productId,
      required this.productName,
      required this.productImageUrl,
      required this.productPrice,
      required this.productQuantity,
      required this.productUnit})
      : super(key: key);

  final String productId;
  final String productName;
  final String productImageUrl;
  final String productPrice;
  String? productQuantity;
  final String productUnit;

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int cart = 1;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListTile(
      leading: Image.network(widget.productImageUrl),
      title: widget.productName.text.make(),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '${widget.productPrice}\$/${widget.productUnit}'.text.sm.make(),
          IconButton(
            onPressed: () {
              Utils.showMessage(
                  context,
                  "Food Delivery",
                  'Remove Item?',
                  'Yes',
                  () {
                    Provider.of<CartProvider>(context, listen: false)
                        .deleteCartProducts(
                      widget.productId,
                    );
                    Navigator.of(context).pop();
                  },
                  buttonText2: 'No',
                  isConfirmDialog: true,
                  onPressed2: () {
                    Navigator.of(context).pop();
                  });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      trailing: VxStepper(
        min: 1,
        max: 20,
        onChange: (value) {
          cart = value;
          cartProvider.updateCartData(
            cartId: widget.productId,
            cartName: widget.productName,
            cartImage: widget.productImageUrl,
            cartPrice: widget.productPrice,
            cartQuantity: cart.toString(),
          );
        },
      ),
    );
  }
}
