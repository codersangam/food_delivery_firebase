import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.labelText,
      this.controller,
      required this.keyBoardType})
      : super(key: key);

  final String labelText;
  TextEditingController? controller;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
