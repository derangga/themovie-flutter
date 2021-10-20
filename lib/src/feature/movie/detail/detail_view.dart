import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Size _size;
  Color gradientStart = Colors.transparent;
  Color gradientEnd = Colors.black;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(color: Colors.black, child: _detailTvView()),
    );
  }

  Widget _detailTvView() {
    return Stack(
      children: [
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: _size.width,
              height: _size.height,
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
                      placeholder: "Drawable.NO_IMAGE",
                      image: '',
                      fit: BoxFit.cover),
                ),
              ),
            )),
        DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.2,
            maxChildSize: 0.965,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
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
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: _size.width,
                                height: 16,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Wed, 23 2019',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      VerticalDivider(
                                        width: 20.0,
                                        color: Colors.grey,
                                        thickness: 1.5,
                                      ),
                                      Text(
                                        '6.9',
                                        style:
                                            TextStyle(color: Colors.grey[400]),
                                      ),
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
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 32),
                              Text('Overview',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text('Overview',
                                    style: TextStyle(color: Colors.grey[400]),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(height: 24.0),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Trailer',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16)),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.play_circle_filled_rounded,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        color: Colors.brown.shade200,
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
                                                textColor: Colors.brown
                                                    .shade200), //ColorTheme.ACCENT),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.brown.shade200,
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
                                color: Colors.indigo,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      // child: _castAndCrew(
                                      //     height: 260.0,
                                      //     width: 140.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.0),
                              Container(
                                color: Colors.indigo,
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      //   child: _similarTvShow(
                                      //       height: 260.0,
                                      //       width: 140.0),
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
    );
  }

  Widget TextView(String title,
      {Color textColor, double textSize, TextAlign textAlign}) {
    return Text(
      title,
      style: TextStyle(color: textColor, fontSize: textSize),
      textAlign: textAlign,
    );
  }

  // Widget _castAndCrew({double height, double width}) {
  //   return ListView.separated(
  //     separatorBuilder: (ctx, position) => Container(
  //       width: 12.0,
  //       color: Colors.indigo,
  //     ),
  //     scrollDirection: Axis.horizontal,
  //     itemCount: 3,
  //     itemBuilder: (ctx, position) => PortraitContent(
  //       height: height,
  //       width: width,
  //       imageUrl:
  //       '${UrlConstant.IMAGE_URL}${castAndCrew[position].profilePath}',
  //       margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
  //       content: TextView(
  //         '${castAndCrew[position].name}',
  //         textColor: Colors.white,
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //       subContent: TextView(
  //         '${castAndCrew[position].character}',
  //         textColor: Colors.grey[400],
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _similarTvShow({double height, double width}) {
  //   return ListView.separated(
  //     separatorBuilder: (ctx, position) => Container(
  //       width: 12.0,
  //       color: Colors.indigo,
  //     ),
  //     scrollDirection: Axis.horizontal,
  //     itemCount: 3,
  //     itemBuilder: (ctx, position) => PortraitContent(
  //       height: height,
  //       width: width,
  //       imageUrl: '${UrlConstant.IMAGE_URL}${tvShows[position].posterPath}',
  //       margin: position == 0 ? EdgeInsets.only(left: 12.0) : null,
  //       content: TextView(
  //         '${tvShows[position].originalName}',
  //         textColor: Colors.white,
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //       subContent: Row(
  //         children: [
  //           TextView(
  //             '${tvShows[position].voteAverage}',
  //             textColor: Colors.grey[400],
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //           SizedBox(width: 8.0),
  //           Icon(Icons.star, color: Colors.amber)
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
