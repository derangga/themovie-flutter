import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

enum FooterLoadingState { LOADING, ERROR }

class FooterCircularProgressIndicator extends StatelessWidget {
  final FooterLoadingState loadingState;
  final GestureTapCallback? onRetryTap;
  final String? errorText;
  final Color? errorColorText;
  final String? fontFamily;
  final Color? loadingColor;

  FooterCircularProgressIndicator({
    required this.loadingState,
    this.onRetryTap,
    this.errorText,
    this.errorColorText,
    this.fontFamily,
    this.loadingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Stack(
          children: [
            Visibility(
              visible: loadingState == FooterLoadingState.ERROR,
              child: InkWell(
                  onTap: onRetryTap,
                  child: Container(
                    color: ColorTheme.light_brown,
                    padding: EdgeInsets.all(16.0),
                    child: TextView(
                      errorText,
                      textColor: errorColorText,
                      fontFamily: fontFamily,
                    ),
                  )),
            ),
            Visibility(
                visible: loadingState == FooterLoadingState.LOADING,
                child: CircularProgressIndicator(
                  backgroundColor: loadingColor,
                ))
          ],
        ),
      ),
    );
  }
}
