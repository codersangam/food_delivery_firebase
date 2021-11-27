import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.search}) : super(key: key);

  final List<ProductModel> search;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName!.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);

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
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
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
          Column(
              children: _searchItem.map((data) {
            return SearchSingleItem(
              productName: data.productName.toString(),
              productImageUrl: data.productImageUrl.toString(),
              productPrice: data.productPrice.toString(),
            );
          }).toList()),
        ],
      ),
    );
  }
}

class SearchSingleItem extends StatelessWidget {
  const SearchSingleItem({
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
      subtitle: productPrice.text.make(),
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
    );
  }
}
