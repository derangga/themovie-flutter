import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailShimmer extends StatelessWidget {
  DetailShimmer();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(24.0),
      height: size.height,
      width: size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Container(
          width: double.infinity,
          height: size.height * 8,
        ),
      ),
    );
  }
}
