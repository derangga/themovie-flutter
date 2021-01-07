import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DetailTvShowScreen extends StatefulWidget {
  @override
  _DetailTvShowScreenState createState() => _DetailTvShowScreenState();
}

class _DetailTvShowScreenState extends State<DetailTvShowScreen> {
  Size _size;
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  width: _size.width,
                  height: _size.height * 0.7,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [gradientStart, gradientEnd],
                      ).createShader(
                          Rect.fromLTRB(0, 120, rect.width, rect.height - 20));
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                      child: FadeInImage.assetNetwork(
                          placeholder: Drawable.NO_IMAGE,
                          image:
                              '${UrlConstant.IMAGE_URL}/obLBdhLxheKg8Li1qO11r2SwmYO.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                )),
            DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0.5,
                maxChildSize: 0.965,
                builder: (context, scrollController) {
                  return Container(
                      decoration: BoxDecoration(
                          color: ColorTheme.PRIMARY_DARK.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0))),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12.0),
                            height: 2.0,
                            width: 40,
                            color: Colors.grey[600],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  SizedBox(height: 16.0),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: TextView('Cobra Kai',
                                        textSize: 24.0,
                                        textColor: Colors.white),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    width: _size.width,
                                    height: 16,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: TextView(
                                              '6 Feb, 2021',
                                              textColor: Colors.grey[400],
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                          VerticalDivider(
                                            width: 20.0,
                                            color: Colors.grey,
                                            thickness: 1.5,
                                          ),
                                          TextView('7.5',
                                              textColor: Colors.grey[400]),
                                          SizedBox(width: 4.0),
                                          Icon(Icons.star,
                                              color: Colors.amber, size: 16),
                                          VerticalDivider(
                                            width: 20.0,
                                            color: Colors.grey,
                                            thickness: 1.5,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: TextView(
                                              'Fantasy',
                                              textColor: Colors.grey[400],
                                            ),
                                          ),
                                        ]),
                                  ),
                                  SizedBox(height: 32),
                                  TextView(
                                    'Overview',
                                    textSize: 18,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: TextView(
                                        'This Karate Kid sequel series picks up 30 years after the events of the 1984 All Valley Karate Tournament and finds Johnny Lawrence on the hunt for redemption by reopening the infamous Cobra Kai karate dojo. This reignites his old rivalry with the successful Daniel LaRusso, who has been working to maintain the balance in his life without mentor Mr. Miyagi.',
                                        textColor: Colors.grey[400],
                                        textAlign: TextAlign.center),
                                  ),
                                  SizedBox(height: 24.0),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RoundedButton(
                                            radius: 8.0,
                                            height: 46.0,
                                            width: _size.width,
                                            text: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextView(
                                                  'Trailer',
                                                  textColor: Colors.white,
                                                  textSize: 16.0,
                                                ),
                                                SizedBox(width: 8.0),
                                                Icon(
                                                  Icons
                                                      .play_circle_filled_rounded,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                            color: ColorTheme.ACCENT,
                                            onPressed: () {},
                                          ),
                                        ),
                                        Expanded(
                                            child: Container(
                                          height: 46.0,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextView('Favorite',
                                                    textSize: 16.0,
                                                    textColor:
                                                        ColorTheme.ACCENT),
                                                SizedBox(width: 8.0),
                                                Icon(
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: ColorTheme.ACCENT,
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 32.0),
                                  Container(
                                    color: ColorTheme.PRIMARY,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: TextView(
                                            'Top Series Cast',
                                            textSize: 18,
                                            textColor: Colors.white,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        Container(
                                          width: _size.width,
                                          height: 260.0,
                                          child: _castAndCrew(
                                              height: 260.0, width: 140.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 24.0),
                                  Container(
                                    color: ColorTheme.PRIMARY,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: TextView(
                                            'Similar Tv Show',
                                            textSize: 18,
                                            textColor: Colors.white,
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        Container(
                                          width: _size.width,
                                          height: 260.0,
                                          child: _similarTvShow(
                                              height: 260.0, width: 140.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                }),
          ],
        ),
      ),
    );
  }

  Widget _castAndCrew({double height, double width}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => Container(
        width: 12.0,
        color: ColorTheme.PRIMARY,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (ctx, position) => PortraitContent(
        height: height,
        width: width,
        imageUrl: '${UrlConstant.IMAGE_URL}/8zw5vcKlg05Is12Fww4QxRjO1f3.jpg',
        margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
        content: TextView(
          'Jason Statham',
          textColor: Colors.white,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subContent: TextView(
          'Shaw',
          textColor: Colors.grey[400],
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _similarTvShow({double height, double width}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => Container(
        width: 12.0,
        color: ColorTheme.PRIMARY,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (ctx, position) => PortraitContent(
        height: height,
        width: width,
        imageUrl: '${UrlConstant.IMAGE_URL}/8zw5vcKlg05Is12Fww4QxRjO1f3.jpg',
        margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
        content: TextView(
          'Wonder Woman 1989',
          textColor: Colors.white,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subContent: Row(
          children: [
            TextView(
              '8.4',
              textColor: Colors.grey[400],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(width: 8.0),
            Icon(Icons.star, color: Colors.amber)
          ],
        ),
      ),
    );
  }
}
