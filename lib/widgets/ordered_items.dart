import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderedItems extends StatelessWidget {
  const OrderedItems({Key? key, required this.data}) : super(key: key);

  final CartModel data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        data.cartImageUrl.toString(),
        width: 60,
      ),
      title: data.cartName!.text.make(),
      subtitle: data.cartUnit?.text.make(),
      trailing: '${data.cartPrice!}\$'.text.make(),
    );
  }
}
