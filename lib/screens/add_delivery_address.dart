import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_text_field.dart';
import 'package:velocity_x/velocity_x.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({Key? key}) : super(key: key);

  @override
  _AddDeliveryAddressState createState() => _AddDeliveryAddressState();
}

enum AddressTypes { home, work, others }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Delivery Address'.text.make(),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          child: 'Add New Address'.text.lg.make(),
        ),
      ).p12(),
      body: ListView(
        children: [
          CustomTextField(
              labelText: 'First Name', keyBoardType: TextInputType.name),
          CustomTextField(
              labelText: 'Last Name', keyBoardType: TextInputType.name),
          CustomTextField(
              labelText: 'Address 1',
              keyBoardType: TextInputType.streetAddress),
          CustomTextField(
              labelText: 'Address 2',
              keyBoardType: TextInputType.streetAddress),
          CustomTextField(labelText: 'City', keyBoardType: TextInputType.text),
          CustomTextField(labelText: 'State', keyBoardType: TextInputType.text),
          CustomTextField(
              labelText: 'Pincode', keyBoardType: TextInputType.number),
          CustomTextField(
              labelText: 'Country', keyBoardType: TextInputType.name),
          CustomTextField(
              labelText: 'Mobile Number', keyBoardType: TextInputType.phone),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 47,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'Set Location'.text.make(),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          ListTile(
            title: 'Select Address Type*'.text.make(),
          ),
          RadioListTile(
            title: 'Home'.text.make(),
            secondary: const Icon(
              Icons.home,
              color: Colors.red,
            ),
            value: AddressTypes.home,
            groupValue: myType,
            onChanged: (AddressTypes? value) {
              setState(() {
                myType = value!;
              });
            },
          ),
          RadioListTile(
            title: 'Work'.text.make(),
            secondary: const Icon(
              Icons.work,
              color: Colors.red,
            ),
            value: AddressTypes.work,
            groupValue: myType,
            onChanged: (AddressTypes? value) {
              setState(() {
                myType = value!;
              });
            },
          ),
          RadioListTile(
            title: 'Others'.text.make(),
            secondary: const Icon(
              Icons.other_houses,
              color: Colors.red,
            ),
            value: AddressTypes.others,
            groupValue: myType,
            onChanged: (AddressTypes? value) {
              setState(() {
                myType = value!;
              });
            },
          ),
        ],
      ).pSymmetric(h: 20),
    );
  }
}
