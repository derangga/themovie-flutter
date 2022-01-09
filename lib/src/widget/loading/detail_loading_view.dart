import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/widget/container/linear_container_view.dart';
import 'package:themovie_flutter/src/widget/container/rounded_container_view.dart';

class DetailLoadingView extends StatelessWidget {
  const DetailLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LinearContainerView(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      children: [
        RoundedContainerView(
          height: size.height / 2,
          backgroundColor: ColorTheme.primaryDark,
          borderRadius: BorderRadius.circular(8.0),
        ),
        SizedBox(height: 12),
        RoundedContainerView(
          height: 18.0,
          backgroundColor: ColorTheme.primaryDark,
          borderRadius: BorderRadius.circular(8.0),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: RoundedContainerView(
                height: 46.0,
                backgroundColor: ColorTheme.primaryDark,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: RoundedContainerView(
                height: 46.0,
                backgroundColor: ColorTheme.primaryDark,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Expanded(
          child: RoundedContainerView(
            backgroundColor: ColorTheme.primaryDark,
            borderRadius: BorderRadius.circular(8.0),
          ),
        )
      ],
    );
  }
}
