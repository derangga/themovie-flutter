import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheImageView extends StatelessWidget {
  final String imageUrl;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorPlaceholder;
  final double? width, height;
  final BoxFit? fit;
  final BorderRadius rounded;
  const CacheImageView(
    this.imageUrl, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorPlaceholder,
    this.rounded = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: rounded,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: placeholder,
        errorWidget: errorPlaceholder,
        fadeInDuration: const Duration(milliseconds: 700),
        fadeOutDuration: const Duration(milliseconds: 300),
        fit: fit,
      ),
    );
  }
}
