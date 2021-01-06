import 'package:core/src/widget/widget.dart';
import 'package:flutter/material.dart';

enum FooterLoadingState { LOADING, ERROR }

class FooterCircularProgressIndicator extends StatelessWidget {
  final FooterLoadingState loadingState;
  final GestureTapCallback onRetryTap;
  final String errorText;
  final Color errorColorText;
  final String fontFamily;

  FooterCircularProgressIndicator(
      {@required this.loadingState,
      this.onRetryTap,
      this.errorText,
      this.errorColorText,
      this.fontFamily}) : assert(loadingState != null);

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
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextView(
                      errorText,
                      textColor: errorColorText,
                      fontFamily: fontFamily,
                    ),
                  ),
                )),
            Visibility(
                visible: loadingState == FooterLoadingState.LOADING,
                child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
