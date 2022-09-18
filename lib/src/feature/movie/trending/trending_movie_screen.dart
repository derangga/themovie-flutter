import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc_widget.dart';
import '../../../data/config/url_constant.dart';
import '../../../data/model/movie.dart';
import '../../../resources/color_theme.dart';
import '../../../resources/drawable.dart';
import '../../../widget/app_scaffold.dart';
import '../../../widget/button/button_view.dart';
import '../../../widget/container/linear_container_view.dart';
import '../../../widget/custom_widget/movie_card_view.dart';
import '../../../widget/dark_app_bar.dart';
import '../../../widget/loading/circular_loading_view.dart';
import '../../../widget/text/text_view.dart';
import 'trending_movie_bloc.dart';

class TrendingMovieScreen extends StatefulWidget {
  const TrendingMovieScreen({Key? key}) : super(key: key);

  @override
  _TrendingMovieScreennState createState() => _TrendingMovieScreennState();
}

class _TrendingMovieScreennState extends BaseBlocWidget<TrendingMovieBloc,
    TrendingMovieState, TrendingMovieScreen> {
  @override
  Widget mapStateHandler(TrendingMovieState state) {
    if (state is SuccessGetMovieState) {
      return createMovieList(state.movies);
    } else if (state is FailedGetMovieState) {
      return createErrorView();
    } else {
      return Center(
        child: CircularLoadingView(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => bloc..add(GetTrendingMovieEvent()),
      child: AppScaffold(
        appBar: DarkAppBar(
          title: Text('Trending Movies'),
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
          child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
            builder: (blocContext, state) {
              return mapStateHandler(state);
            },
          ),
        ),
      ),
    ));
  }

  Widget createErrorView() {
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
              bloc.add(GetTrendingMovieEvent());
            },
          ),
        ],
      ),
    );
  }

  Widget createMovieList(List<Movie> movies) {
    return ListView.separated(
      separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
      itemCount: movies.length,
      itemBuilder: (ctx, position) => createMovieItem(
        movies[position],
        position,
        movies.length - 1,
      ),
    );
  }

  Widget createMovieItem(Movie movie, int position, int lastPosition) {
    final topMargin = position == 0 ? 8.0 : 0.0;
    final bottomMargin = position == lastPosition ? 8.0 : 0.0;
    return MovieCardView(
      margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, bottomMargin),
      backgroundColor: ColorTheme.primaryDark,
      imageUrl: '${UrlConstant.IMAGE_URL}${movie.posterPath}',
      title: movie.title,
      overview: movie.overview,
      movieRating: movie.voteAverage,
      dateRelease: movie.releaseDate,
      voteCount: movie.voteCount,
      placeholder: Drawable.NO_IMAGE,
      errorPlaceholder: Drawable.NO_IMAGE,
      onTap: () {
        bloc.goToDetailMovie(context, movie.id);
      },
    );
  }
}
