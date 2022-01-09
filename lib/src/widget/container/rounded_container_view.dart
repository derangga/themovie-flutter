import 'package:flutter/material.dart';

class RoundedContainerView extends StatelessWidget {
  final double? width, height;
  final Widget? child;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const RoundedContainerView({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.padding,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      child: child,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: borderRadius,
      ),
    );
  }
}
