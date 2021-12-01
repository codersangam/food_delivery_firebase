import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/provider/cart_provider.dart';
import 'package:food_delivery/provider/product_provider.dart';
import 'package:food_delivery/provider/user_provider.dart';
import 'package:food_delivery/provider/wishlist_provider.dart';
import 'package:food_delivery/screens/cart_screen.dart';
import 'package:food_delivery/screens/product_details.dart';
import 'package:food_delivery/screens/search_screen.dart';
import 'package:food_delivery/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? productProvider;

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbProducts();
    productProvider.fetchFruitProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    userProvider.fetchUserDetails();
    return Scaffold(
      // backgroundColor: const Color(0xffcbcbcb),
      drawer: MyDrawer(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        title: 'Home'.text.make(),
        actions: [
          CircleAvatar(
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                          search: productProvider!.getSearchProducts),
                    ),
                  );
                },
                icon: const Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shop)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/fresh-vegetables-in-the-eco-cotton-bag-at-the-royalty-free-image-1583774382.jpg?crop=0.891xw:1.00xh;0.0554xw,0&resize=768:*'),
                  ),
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Herbs Seasonings'.text.xl2.bold.make(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            search: productProvider!.getHerbProducts,
                          ),
                        ),
                      );
                    },
                    child: 'View All'.text.xl.gray400.make(),
                  ),
                ],
              ),
              10.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider!.getHerbProducts.map((data) {
                    return SingleProduct(
                      productId: data.productId.toString(),
                      prodctTitle: data.productName.toString(),
                      productImageUrl: data.productImageUrl.toString(),
                      productPrice: data.productPrice.toString(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              productName: data.productName.toString(),
                              productImageUrl: data.productImageUrl.toString(),
                              productPrice: data.productPrice.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Fresh Fruits'.text.xl2.bold.make(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            search: productProvider!.getFruitProducts,
                          ),
                        ),
                      );
                    },
                    child: 'View All'.text.xl.gray400.make(),
                  ),
                ],
              ),
              10.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider!.getFruitProducts.map((data) {
                    return SingleProduct(
                      productId: data.productId.toString(),
                      prodctTitle: data.productName.toString(),
                      productImageUrl: data.productImageUrl.toString(),
                      productPrice: data.productPrice.toString(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                              productName: data.productName.toString(),
                              productImageUrl: data.productImageUrl.toString(),
                              productPrice: data.productPrice.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProduct extends StatefulWidget {
  const SingleProduct({
    Key? key,
    required this.productId,
    required this.prodctTitle,
    required this.productImageUrl,
    required this.productPrice,
    required this.onTap,
  }) : super(key: key);

  final String productId;
  final String prodctTitle;
  final String productImageUrl;
  final String productPrice;
  final VoidCallback onTap;

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  int cart = 1;
  bool isWishList = false;

  getWishtListBool() {
    FirebaseFirestore.instance
        .collection("wishListData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("CustomerWishList")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (mounted)
              {
                if (value.exists)
                  {
                    setState(
                      () {
                        isWishList = value.get("wishList");
                      },
                    ),
                  },
              },
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    WishListProvider wishListProvider = Provider.of<WishListProvider>(context);
    getWishtListBool();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 250,
      width: 160,
      decoration: BoxDecoration(
        color: Vx.gray200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    widget.productImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.prodctTitle.text.xl.bold.make(),
                  '${widget.productPrice}\$'.text.make(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              '50 gm'.text.make(),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          color: Vx.white,
                          onPressed: () {
                            cartProvider.addCartData(
                              cartId: widget.productId,
                              cartName: widget.prodctTitle,
                              cartImage: widget.productImageUrl,
                              cartPrice: widget.productPrice,
                              cartQuantity: cart.toString(),
                            );
                            VxToast.show(context, msg: 'Items Addded to Cart');
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isWishList = isWishList.toggle();
                        isWishList
                            ? wishListProvider.addWishListData(
                                wishListId: widget.productId,
                                wishListName: widget.prodctTitle,
                                wishListImage: widget.productImageUrl,
                                wishListPrice: widget.productPrice,
                              )
                            : Provider.of<WishListProvider>(context,
                                    listen: false)
                                .deleteWishListProducts(
                                widget.productId,
                              );
                      });
                    },
                    icon: isWishList
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
