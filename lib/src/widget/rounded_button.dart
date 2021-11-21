import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double radius;
  final Widget text;

  RoundedButton(
      {required this.height,
      required this.width,
      required this.text,
      this.padding,
      this.onPressed,
      this.color,
      this.radius = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          color: color,
          onPressed: onPressed,
          child: text),
    );
  }
}
