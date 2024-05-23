import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductUnit extends StatelessWidget {
  const ProductUnit({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            title.text.lg.make().expand(),
            const Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
