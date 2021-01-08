import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/ui/discover/discover_tv_show_bloc.dart';

class DiscoverTvShowScreen extends StatefulWidget {
  @override
  _DiscoverTvShowScreenState createState() => _DiscoverTvShowScreenState();
}

class _DiscoverTvShowScreenState extends BaseState<DiscoverTvShowBloc,
    DiscoverTvShowState, DiscoverTvShowScreen> {
  Color gradientStart = Colors.transparent;
  Color gradientEnd = ColorTheme.PRIMARY_DARK;
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void setupOnInitState() {
    _scrollController.addListener(_onScroll);
    getMovies(true);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      getMovies(false);
    }
  }

  void getMovies(bool isFirstLoad) {
    if (isFirstLoad)
      bloc.add(GetFirstPageTvShowEvent());
    else
      bloc.add(GetNextPageTvShowEvent());
  }

  @override
  Widget mapStateToWidget(DiscoverTvShowState state) {
    if (state is LoadingFirstPageState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is SuccessGetDiscoverTvShowState) {
      return _tvShowList(state.tvShows, state.hasReachedMax);
    } else if (state is ErrorGetFirstPageTvShowState) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView('${state.message}',
                textColor: Colors.white, textSize: 18.0),
            SizedBox(height: 12.0),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: TextView('Retry', textColor: Colors.white),
                color: ColorTheme.ACCENT,
                onPressed: () {})
          ],
        ),
      );
    } else if (state is ErrorGetNextPageTvShowState) {
      return _tvShowList(state.tvShows, false,
          footerState: FooterLoadingState.ERROR, error: state.message);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.PRIMARY,
      appBar: AppBar(
        backgroundColor: ColorTheme.PRIMARY_DARK,
        title: Text('Tv Show'),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: ShapeDecoration(
              shape: CircleBorder(), color: ColorTheme.PRIMARY_DARK),
          child: IconButton(
              //70 72 94
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: Container(
        child: BlocBuilder<DiscoverTvShowBloc, DiscoverTvShowState>(
            builder: (blocCtx, state) {
          return Container(
            child: mapStateToWidget(state),
          );
        }),
      ),
    );
  }

  Widget _tvShowList(List<TvShow> tvShows, bool hasReachBottom,
      {FooterLoadingState footerState = FooterLoadingState.LOADING,
      String error}) {
    return ListView.separated(
        separatorBuilder: (ctx, position) =>
            Container(height: 12.0, color: ColorTheme.PRIMARY),
        controller: _scrollController,
        itemCount: hasReachBottom ? tvShows.length : tvShows.length + 1,
        itemBuilder: (ctx, position) {
          if (position >= tvShows.length) {
            return FooterCircularProgressIndicator(
              loadingState: footerState,
              errorText: error,
              errorColorText: Colors.red,
              onRetryTap: () {
                getMovies(false);
              },
            );
          } else
            return _tvShowItem(tvShows[position]);
        });
  }

  Widget _tvShowItem(TvShow tvShow) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteApp.DETAIL_TV_SCREEN,
            arguments: tvShow.id);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 220,
            child: FadeInImage.assetNetwork(
              image: '${UrlConstant.IMAGE_URL}${tvShow.backdropPath}',
              fit: BoxFit.cover,
              placeholder: Drawable.NO_IMAGE,
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView('${tvShow.originalName}',
                        textSize: 24.0, textColor: Colors.white),
                    SizedBox(height: 8),
                    Row(children: [
                      TextView('Release Date : ', textColor: ColorTheme.ACCENT),
                      SizedBox(width: 12.0),
                      TextView('Jan 19, 2021', textColor: ColorTheme.ACCENT)
                    ]),
                    SizedBox(height: 8),
                    TextView('${tvShow.overview}',
                        overflow: TextOverflow.ellipsis,
                        textColor: Colors.grey,
                        maxLines: 3),
                  ])),
        ],
      ),
    );
  }
}
