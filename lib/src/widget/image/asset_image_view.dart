import 'package:flutter/material.dart';

class AssetImageView extends StatelessWidget {
  final BorderRadiusGeometry rounded;
  final String path;
  final double? width, height;
  final BoxFit? fit;
  const AssetImageView({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.rounded = BorderRadius.zero,
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
