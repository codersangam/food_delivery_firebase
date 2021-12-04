import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController addressOne = TextEditingController();
  TextEditingController addressTwo = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController phone = TextEditingController();

// Set Delivery Address
  void validator(context) async {
    if (firstName.text.isEmpty) {
      VxToast.show(context, msg: 'First Name is Empty');
    } else if (lastName.text.isEmpty) {
      VxToast.show(context, msg: 'Last Name is Empty');
    } else if (addressOne.text.isEmpty) {
      VxToast.show(context, msg: 'Address1 is Empty');
    } else if (city.text.isEmpty) {
      VxToast.show(context, msg: 'City is Empty');
    } else if (state.text.isEmpty) {
      VxToast.show(context, msg: 'State is Empty');
    } else if (pincode.text.isEmpty) {
      VxToast.show(context, msg: 'Pincode is Empty');
    } else if (country.text.isEmpty) {
      VxToast.show(context, msg: 'Country is Empty');
    } else if (phone.text.isEmpty) {
      VxToast.show(context, msg: 'Phone is Empty');
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('DeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'First Name': firstName.text,
        'Last Name': lastName.text,
        'Address1': addressOne.text,
        'City': city.text,
        'State': state.text,
        'Pincode': pincode.text,
        'Country': country.text,
        'Phone': phone.text,
      }).then((value) {
        isLoading = false;
        notifyListeners();
        VxToast.show(context, msg: 'Delivery address added');
        Navigator.pop(context);
        notifyListeners();
      });
      notifyListeners();
    }
  }
}
