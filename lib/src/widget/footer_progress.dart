import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/loading/circular_loading_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

enum FooterLoadingState { LOADING, ERROR }

class FooterCircularProgressIndicator extends StatelessWidget {
  final FooterLoadingState loadingState;
  final GestureTapCallback onRetryTap;
  final String errorText;
  final Color? buttonColor;
  final Color? errorColorText;
  final String? fontFamily;

  FooterCircularProgressIndicator({
    required this.loadingState,
    required this.errorText,
    required this.onRetryTap,
    this.errorColorText,
    this.buttonColor,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Center(
        child: Stack(
          children: [
            Visibility(
              visible: loadingState == FooterLoadingState.ERROR,
              child: ButtonView(
                text: TextView(
                  errorText,
                  textColor: errorColorText,
                  fontFamily: fontFamily,
                  textSize: 16.0,
                ),
                color: buttonColor,
                onPressed: onRetryTap,
              ),
            ),
            Visibility(
              visible: loadingState == FooterLoadingState.LOADING,
              child: CircularLoadingView(),
            )
          ],
        ),
      ),
    );
  }
}
