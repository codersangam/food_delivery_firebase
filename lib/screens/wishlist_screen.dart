import 'package:flutter/material.dart';
import 'package:food_delivery/models/wishlist_model.dart';
import 'package:food_delivery/provider/wishlist_provider.dart';
import 'package:food_delivery/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class WishListScrenn extends StatelessWidget {
  const WishListScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    wishListProvider.getWishListProduct();
    return Scaffold(
      appBar: AppBar(
        title: 'My Wishlist'.text.make(),
      ),
      body: wishListProvider.getWishListProducts.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/empty_wishlist.png',
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                ).centered(),
              ],
            )
          : ListView.builder(
              itemCount: wishListProvider.getWishListProducts.length,
              itemBuilder: (context, index) {
                WishListModel data =
                    wishListProvider.getWishListProducts[index];
                debugPrint(data.toString());
                return Column(
                  children: [
                    WishListItems(
                      productId: data.wishListId.toString(),
                      productName: data.wishListName.toString(),
                      productImageUrl: data.wishListImage.toString(),
                      productPrice: data.wishListPrice.toString(),
                    ),
                  ],
                );
              }),
    );
  }
}

// ignore: must_be_immutable
class WishListItems extends StatefulWidget {
  const WishListItems({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.productPrice,
  });

  final String productId;
  final String productName;
  final String productImageUrl;
  final String productPrice;

  @override
  State<WishListItems> createState() => _WishListItemsState();
}

class _WishListItemsState extends State<WishListItems> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(widget.productImageUrl),
      title: widget.productName.text.make(),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '${widget.productPrice}\$/50 gm'.text.make(),
          IconButton(
            onPressed: () {
              Utils.showMessage(
                  context,
                  "Food Delivery",
                  'Remove Item From Your Wishlist?',
                  'Yes',
                  () {
                    Provider.of<WishListProvider>(context, listen: false)
                        .deleteWishListProducts(
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
    );
  }
}
