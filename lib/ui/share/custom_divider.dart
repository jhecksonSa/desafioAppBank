import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDivider extends StatelessWidget {
  final double paddingHorizontal;
  final double paddingVertical;
  Color color;

  CustomDivider({
    super.key,
    this.paddingHorizontal = 18,
    this.paddingVertical = 0,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Divider(
        height: 0.5,
        color: color,
      ),
    );
  }
}
