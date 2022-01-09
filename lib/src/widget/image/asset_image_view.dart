import 'package:flutter/material.dart';

class AssetImageView extends StatelessWidget {
  final BorderRadius? rounded;
  final String path;
  final double? width, height;
  final BoxFit? fit;
  const AssetImageView({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.rounded,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: rounded,
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
