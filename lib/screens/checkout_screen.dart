import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/delivery_address.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Checkout'.text.make(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {}, child: 'Add New Address'.text.lg.make()),
      ).p12(),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/location.png',
                fit: BoxFit.fill,
                height: 40,
              ),
              'Delivered To:'.text.lg.make(),
            ],
          ),
          const DeliveryAdress(
            fullName: 'Sangam Singh',
            fullAddress:
                '#27, Chaitanya PG. Opp. KNS College, Bangalore, Karnataka, 560064',
            phoneNumber: '9148857297',
          ),
        ],
      ),
    );
  }
}
