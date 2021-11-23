import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Cart'.text.make(),
      ),
      body: ListTile(
        leading: Image.network(
            'https://post.healthline.com/wp-content/uploads/2020/10/apple-basket-apples-732x549-thumbnail-732x549.jpg'),
        title: 'Apple'.text.make(),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            '50\$/50 gm'.text.make(),
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
      ),
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
