import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      required this.keyBoardType});

  final String labelText;
  final TextEditingController controller;
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
