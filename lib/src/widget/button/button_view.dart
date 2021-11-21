import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double radius;
  final Widget text;

  ButtonView({
    required this.text,
    this.height,
    this.width,
    this.padding,
    this.onPressed,
    this.color,
    this.radius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
