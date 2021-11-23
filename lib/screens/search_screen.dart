import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Search'.text.make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView(
        children: [
          20.heightBox,
          Container(
            height: 52,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Vx.gray200,
                filled: true,
                hintText: 'Search for Items',
                suffixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          20.heightBox,
          ListTile(
            leading: Image.network(
                'https://post.healthline.com/wp-content/uploads/2020/10/apple-basket-apples-732x549-thumbnail-732x549.jpg'),
            title: 'Apple'.text.make(),
            subtitle: '50\$/50 gm'.text.make(),
            trailing: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                color: Vx.white,
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
