import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DeliveryAdress extends StatelessWidget {
  const DeliveryAdress(
      {Key? key,
      required this.fullName,
      required this.fullAddress,
      required this.phoneNumber,
      required this.addressType})
      : super(key: key);

  final String fullName;
  final String fullAddress;
  final String phoneNumber;
  final String addressType;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              fullName.text.xl2.bold.make(),
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: addressType.text.white.bold.makeCentered(),
              ),
            ],
          ),
          8.heightBox,
          fullAddress.text.lg.maxLines(2).make(),
          8.heightBox,
          phoneNumber.text.lg.make(),
        ],
      ).p8(),
    ).p12();
  }
}
