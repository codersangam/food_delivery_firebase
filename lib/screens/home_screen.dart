import 'package:flutter/material.dart';
import 'package:food_delivery/screens/product_details.dart';
import 'package:food_delivery/widgets/my_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffcbcbcb),
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: 'Home'.text.make(),
        actions: const [
          CircleAvatar(
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(
              child: Icon(Icons.shop),
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
                  'View All'.text.xl.gray400.make(),
                ],
              ),
              10.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleProduct(
                      prodctTitle: 'Fresh Mint',
                      productImageUrl:
                          'https://www.pngall.com/wp-content/uploads/2/Peppermint-PNG-Photo.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetails(
                                productName: 'Fresh Mint',
                                productImageUrl:
                                    'https://www.pngall.com/wp-content/uploads/2/Peppermint-PNG-Photo.png'),
                          ),
                        );
                      },
                    ),
                    SingleProduct(
                      prodctTitle: 'Spinach',
                      productImageUrl:
                          'https://cdn.mos.cms.futurecdn.net/atyrpYQoxdoTzmEgu8HMWE-970-80.jpg.webp',
                      onTap: () {},
                    ),
                    SingleProduct(
                      prodctTitle: 'Potato',
                      productImageUrl:
                          'https://freshpointlocal.co.uk/wp-content/uploads/2018/12/Potatoes-2.jpg',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Fresh Fruits'.text.xl2.bold.make(),
                  'View All'.text.xl.gray400.make(),
                ],
              ),
              10.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleProduct(
                      prodctTitle: 'Apple',
                      productImageUrl:
                          'https://post.healthline.com/wp-content/uploads/2020/10/apple-basket-apples-732x549-thumbnail-732x549.jpg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductDetails(
                                productName: 'Apple',
                                productImageUrl:
                                    'https://post.healthline.com/wp-content/uploads/2020/10/apple-basket-apples-732x549-thumbnail-732x549.jpg'),
                          ),
                        );
                      },
                    ),
                    SingleProduct(
                      prodctTitle: 'Banana',
                      productImageUrl:
                          'https://i.insider.com/617315d94f281c001296ae78?width=1000&format=jpeg&auto=webp',
                      onTap: () {},
                    ),
                    SingleProduct(
                      prodctTitle: 'Pear',
                      productImageUrl:
                          'https://images.immediate.co.uk/production/volatile/sites/30/2020/02/pears-28f8900.jpg?webp=true&quality=90&resize=385%2C350',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    Key? key,
    required this.prodctTitle,
    required this.productImageUrl,
    required this.onTap,
  }) : super(key: key);

  final String prodctTitle;
  final String productImageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 280,
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
                onTap: onTap,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    productImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  prodctTitle.text.xl.bold.make(),
                  '50\$/50 gm'.text.make(),
                  SizedBox(
                    width: 100,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          '50 gm'.text.make(),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  const VxStepper(
                    min: 1,
                    max: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
