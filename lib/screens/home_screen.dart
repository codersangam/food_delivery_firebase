import 'package:flutter/material.dart';
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
      drawer: const Drawer(),
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
                  children: const [
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
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
                  children: const [
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
                    SingleProduct(),
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
  }) : super(key: key);

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
              child: Container(
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  'https://www.pngall.com/wp-content/uploads/2/Peppermint-PNG-Photo.png',
                  fit: BoxFit.cover,
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
                  'Fresh Mint'.text.xl.bold.make(),
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
