import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailShimmer extends StatelessWidget {
  DetailShimmer();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int item = (size.height / 232).round();
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: 12, left: 12, right: 12),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[600]!,
        highlightColor: Colors.grey[700]!,
        enabled: true,
        child: ListView.builder(
            itemCount: item,
            itemBuilder: (c, i) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0)),
                      width: size.width,
                      height: 200,
                    ),
                    SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0)),
                      width: size.width,
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
