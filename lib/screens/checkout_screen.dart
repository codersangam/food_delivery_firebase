import 'package:flutter/material.dart';
import 'package:food_delivery/models/delivery_address_model.dart';
import 'package:food_delivery/provider/checkout_provider.dart';
import 'package:food_delivery/screens/add_delivery_address.dart';
import 'package:food_delivery/screens/payment_summary.dart';
import 'package:food_delivery/widgets/delivery_address.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

DeliveryAddressModel? data;

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context);
    checkoutProvider.getDeliveryAddressDetail();
    return Scaffold(
      appBar: AppBar(
        title: 'Checkout'.text.make(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDeliveryAddress(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PaymentSummary(deliveryAddressDetails: data),
                ),
              );
            },
            child: 'Go to Payment'.text.lg.make()),
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
          checkoutProvider.getDeliveryAddressDetails.isEmpty
              ? Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Vx.gray200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      'Delivery Address Not Found'.text.bold.xl.makeCentered(),
                ).p12()
              : Column(
                  children: checkoutProvider.getDeliveryAddressDetails.map((e) {
                  setState(() {
                    data = e;
                  });
                  return DeliveryAdress(
                    fullName:
                        '${e.firstName.toString()} ${e.lastName.toString()}',
                    fullAddress:
                        '${e.addressOne}, ${e.city}, ${e.state}, ${e.pincode}, ${e.country}',
                    phoneNumber: e.phone.toString(),
                    addressType: 'Home',
                  );
                }).toList())
        ],
      ),
    );
  }
}
