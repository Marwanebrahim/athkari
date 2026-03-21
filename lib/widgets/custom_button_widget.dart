import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.hieght,
    required this.width,
    required this.color,
    required this.child,
  });
  final VoidCallback onTap;
  final double hieght;
  final double width;
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hieght,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
        ),

        child: child,
      ),
    );
  }
}
