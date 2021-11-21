import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/config/url_constant.dart';
import '../../../navigation/route_app.dart';
import '../../../resources/drawable.dart';
import '../../../core/base/base_stateful.dart';
import '../../../data/model/tv_show.dart';
import '../../../resources/color_theme.dart';
import '../../../widget/text_view.dart';
import '../../../widget/footer_progress.dart';
import '../../../utils/extension/string_utils.dart';
import 'discover_tv_show_bloc.dart';

class DiscoverTvShowScreen extends StatefulWidget {
  @override
  _DiscoverTvShowScreenState createState() => _DiscoverTvShowScreenState();
}

class _DiscoverTvShowScreenState extends BaseState<DiscoverTvShowBloc,
    DiscoverTvShowState, DiscoverTvShowScreen> {
  Color gradientStart = Colors.transparent;
  Color gradientEnd = ColorTheme.primaryDark;
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
  Widget? mapStateToWidget(DiscoverTvShowState state) {
    if (state.status == DiscoverTvShowStatus.INITIAL) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: ColorTheme.light_brown,
        ),
      );
    } else if (state.status == DiscoverTvShowStatus.SUCCESS ||
        state.status == DiscoverTvShowStatus.LOADING) {
      return _tvShowList(state.tvShows, state.hasReachedMax);
    } else if (state.status == DiscoverTvShowStatus.FAILED) {
      if (state.tvShows.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView('${state.errorMessage.orEmpty()}',
                  textColor: Colors.white, textSize: 18.0),
              SizedBox(height: 12.0),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: TextView('Retry', textColor: Colors.white),
                  color: ColorTheme.light_brown,
                  onPressed: () {})
            ],
          ),
        );
      } else {
        return _tvShowList(
          state.tvShows,
          false,
          footerState: FooterLoadingState.ERROR,
          error: state.errorMessage.orEmpty(),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primary,
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryDark,
        title: Text('Tv Show'),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: ShapeDecoration(
              shape: CircleBorder(), color: ColorTheme.primaryDark),
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
      String? error}) {
    return ListView.separated(
        separatorBuilder: (ctx, position) =>
            Container(height: 12.0, color: ColorTheme.primary),
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
        Navigator.pushNamed(
          context,
          RouteApp.DETAIL_TV_SCREEN,
          arguments: tvShow.id,
        );
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
                      TextView('Release Date : ',
                          textColor: ColorTheme.light_brown),
                      SizedBox(width: 12.0),
                      TextView('Jan 19, 2021',
                          textColor: ColorTheme.light_brown)
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
