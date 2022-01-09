import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/fonts.dart';

class TextView extends StatelessWidget {
  final String? text;
  final int? maxLines;
  final Color? textColor;
  final double textSize;
  final String? fontFamily;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool bold;
  final bool singleLine;

  TextView(
    this.text, {
    Key? key,
    this.maxLines,
    this.textColor = Colors.white, // because theme apps dark
    this.textSize = 12,
    this.fontFamily = Fonts.SF_UI_TEXT,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.bold = false,
    this.singleLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: lines,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  FontWeight get fontWeight => bold ? FontWeight.bold : FontWeight.normal;

  int? get lines => singleLine ? 1 : maxLines;
}
