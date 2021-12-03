import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DeliveryAdress extends StatelessWidget {
  const DeliveryAdress(
      {Key? key,
      required this.fullName,
      required this.fullAddress,
      required this.phoneNumber})
      : super(key: key);

  final String fullName;
  final String fullAddress;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Vx.gray200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fullName.text.xl2.bold.make(),
          8.heightBox,
          fullAddress.text.lg.maxLines(2).make(),
          8.heightBox,
          phoneNumber.text.lg.make(),
        ],
      ).p8(),
    ).p12();
  }
}
