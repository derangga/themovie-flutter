import 'package:flutter/material.dart';

class LinearContainerView extends StatelessWidget {
  final double? width, height;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final LinearContainerOrientation orientation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Widget> children;
  final Color? background;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  const LinearContainerView({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
    this.orientation = LinearContainerOrientation.VERTICAL,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.children = const <Widget>[],
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        child: getWidgetOrientation(),
        decoration: BoxDecoration(
          color: background,
          border: border,
          borderRadius: borderRadius,
        ));
  }

  Widget getWidgetOrientation() {
    if (orientation == LinearContainerOrientation.VERTICAL) {
      return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      );
    }
  }
}

enum LinearContainerOrientation { HORIZONTAL, VERTICAL }
