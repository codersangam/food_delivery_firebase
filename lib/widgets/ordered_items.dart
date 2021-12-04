import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderedItems extends StatelessWidget {
  const OrderedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://i.insider.com/617315d94f281c001296ae78?width=1000&format=jpeg&auto=webp',
        width: 60,
      ),
      title: 'Banana'.text.make(),
      subtitle: '50 Kg'.text.make(),
      trailing: '60\$'.text.make(),
    );
  }
}
