import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/resources/drawable.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/button/button_view.dart';
import 'package:themovie_flutter/src/widget/container/linear_container_view.dart';
import 'package:themovie_flutter/src/widget/custom_widget/movie_card_view.dart';
import 'package:themovie_flutter/src/widget/dark_app_bar.dart';
import 'package:themovie_flutter/src/widget/loading/circular_loading_view.dart';
import '../../../data/config/url_constant.dart';
import '../../../core/base/base_stateful.dart';
import '../../../data/model/tv_show.dart';
import '../../../resources/color_theme.dart';
import '../../../widget/text/text_view.dart';
import '../../../widget/footer_progress.dart';
import '../../../utils/extension/string_utils.dart';
import '../../../utils/extension/context_utils.dart';
import 'discover_tv_show_bloc.dart';

class DiscoverTvShowScreen extends StatefulWidget {
  @override
  _DiscoverTvShowScreenState createState() => _DiscoverTvShowScreenState();
}

class _DiscoverTvShowScreenState extends BaseStateWidget<DiscoverTvShowBloc,
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
    if (maxScroll - currentScroll <= _scrollThreshold &&
        !bloc.isOnLoadingOrFailed()) {
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
    if (state.status == DiscoverTvShowStatus.SUCCESS ||
        state.status == DiscoverTvShowStatus.LOADING) {
      return tvShowList(state.tvShows, state.hasReachedMax);
    } else if (state.status == DiscoverTvShowStatus.FAILED) {
      if (state.tvShows.isEmpty) {
        return initialErrorView();
      } else {
        return tvShowList(
          state.tvShows,
          false,
          footerState: FooterLoadingState.ERROR,
          error: state.errorMessage.orEmpty(),
        );
      }
    } else {
      return Center(
        child: CircularLoadingView(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: DarkAppBar(
        title: Text('Discover TV Shows'),
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          decoration: ShapeDecoration(
              shape: CircleBorder(), color: ColorTheme.primaryDark),
          child: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: Container(
        child: BlocBuilder<DiscoverTvShowBloc, DiscoverTvShowState>(
          builder: (blocCtx, state) {
            return mapStateToWidget(state);
          },
        ),
      ),
    );
  }

  Widget initialErrorView() {
    return Center(
      child: LinearContainerView(
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextView(
            'There is something wrong with your request',
            textColor: Colors.white,
            textSize: 16.0,
            bold: true,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.0),
          ButtonView(
            text: TextView(
              'Retry',
              textColor: Colors.white,
              textSize: 14.0,
            ),
            color: Colors.redAccent,
            onPressed: () {
              bloc.add(GetFirstPageTvShowEvent());
            },
          ),
        ],
      ),
    );
  }

  Widget tvShowList(List<TvShow> tvShows, bool hasReachBottom,
      {FooterLoadingState footerState = FooterLoadingState.LOADING,
      String? error}) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
      controller: _scrollController,
      itemCount: hasReachBottom ? tvShows.length : tvShows.length + 1,
      itemBuilder: (ctx, position) {
        if (position >= tvShows.length) {
          return FooterCircularProgressIndicator(
            loadingState: footerState,
            errorText: 'Retry',
            errorColorText: Colors.white,
            buttonColor: Colors.redAccent,
            onRetryTap: () {
              getMovies(false);
            },
          );
        } else {
          return tvShowItem(position, tvShows[position]);
        }
      },
    );
  }

  Widget tvShowItem(int position, TvShow tvShow) {
    final topMargin = position == 0 ? 8.0 : 0.0;
    return MovieCardView(
      margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, 0.0),
      backgroundColor: ColorTheme.primaryDark,
      imageUrl: '${UrlConstant.IMAGE_URL}${tvShow.posterPath}',
      title: tvShow.originalName,
      overview: tvShow.overview,
      movieRating: tvShow.voteAverage,
      dateRelease: tvShow.firstAirDate,
      voteCount: tvShow.voteCount,
      placeholder: Drawable.NO_IMAGE,
      errorPlaceholder: Drawable.NO_IMAGE,
      onTap: () {
        context.navigatePushNamed(
          RouteApp.DETAIL_TV_SCREEN,
          arguments: tvShow.id,
        );
      },
    );
  }
}
