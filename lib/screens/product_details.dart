import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/wishlist_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails(
      {super.key,
      required this.productName,
      required this.productImageUrl,
      required this.productPrice});

  final String productName;
  final String productImageUrl;
  final String productPrice;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishListScrenn(),
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_border_outlined),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 450,
              child: Image.network(
                widget.productImageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.productName.text.bold.xl2.make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      '50 gm'.text.xl.make(),
                      const VxStepper(
                        min: 1,
                        max: 20,
                      )
                    ],
                  ),
                  10.heightBox,
                  'Product Details:'.text.bold.xl2.make(),
                  10.heightBox,
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release'
                      .text
                      .make(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: '${widget.productPrice}\$'.text.xl3.bold.make(),
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: 'Add To Cart'.text.make(),
              ),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
