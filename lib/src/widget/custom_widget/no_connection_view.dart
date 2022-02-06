import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

class NoConnectionView extends StatelessWidget {
  final VoidCallback? onPressed;
  final String errorText;
  const NoConnectionView({
    Key? key,
    required this.errorText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AssetImageView(path: Drawable.NO_CONNECTION),
        SizedBox(height: 20.0),
        TextView(
          errorText,
          textSize: 16,
          bold: true,
        ),
        SizedBox(height: 12.0),
        ButtonView(
          width: 80.0,
          text: TextView(
            'Retry',
            bold: true,
          ),
          color: ColorTheme.light_brown,
          radius: 4.0,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
