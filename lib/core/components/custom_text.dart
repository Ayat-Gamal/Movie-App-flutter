
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 16.0,
    this.weight = FontWeight.normal,
    this.color = Colors.white});

  final String text;
  final double size ;
  final FontWeight weight;
  final Color color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight
      ),
    );
  }
}
