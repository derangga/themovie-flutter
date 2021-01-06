import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color textColor;
  final double textSize;
  final FontWeight textStyle;
  final String fontFamily;
  final TextOverflow overflow;

  TextView(this.text,
      {this.maxLines,
      this.textColor,
      this.textSize,
      this.textStyle,
      this.fontFamily,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: textStyle,
            fontFamily: fontFamily),
        overflow: overflow);
  }
}
