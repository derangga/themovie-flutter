import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/widget/app_scaffold.dart';
import 'package:themovie_flutter/src/widget/image/asset_image_view.dart';
import 'package:themovie_flutter/src/widget/text/text_view.dart';

import '../../core/base/base_cubit_widget.dart';
import '../../data/remote/config/url_constant.dart';
import '../../data/model/movie.dart';
import '../../data/model/tv_show.dart';
import '../../resources/color_theme.dart';
import '../../resources/drawable.dart';
import '../../utils/date_helper.dart';
import '../../widget/custom_widget/movie_card_view.dart';
import '../../widget/dark_app_bar.dart';
import 'favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState
    extends BaseCubitWidget<FavoriteBloc, FavoriteState, FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => bloc..getMovieFavorite()),
      child: AppScaffold(
        appBar: DarkAppBar(
          title: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              final type = state.favoriteType == FavoriteType.MOVIE
                  ? 'Movies'
                  : 'Tv Shows';
              return Text('Favorite $type');
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                bloc.showFilterFavoriteBottomSheet();
              },
              tooltip: 'Favorite Type',
              icon: Icon(
                Icons.tune,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: BlocListener<FavoriteBloc, FavoriteState>(
          listener: ((context, state) => mapStateBlocListener(state)),
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: ((context, state) => mapStateHandler(state)),
          ),
        ),
      ),
    );
  }

  @override
  Widget mapStateHandler(FavoriteState state) {
    switch (state.favoriteType) {
      case FavoriteType.TVSHOW:
        return tvShowList(state.tvShows);
      default:
        return movieList(state.movies);
    }
  }

  @override
  void mapStateBlocListener(FavoriteState state) {
    if (state.showBotomSheet) {
      showBottomSheet(state.favoriteType);
    }
  }

  Widget movieList(List<Movie> movies) {
    if (movies.isNotEmpty) {
      return ListView.separated(
        separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
        itemCount: movies.length,
        itemBuilder: (ctx, position) {
          final movie = movies[position];
          final topMargin = position == 0 ? 8.0 : 0.0;
          return MovieCardView(
            margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, 0.0),
            backgroundColor: ColorTheme.primaryDark,
            imageUrl: '${UrlConstant.IMAGE_URL}${movie.posterPath}',
            title: movie.title,
            overview: movie.overview,
            movieRating: movie.voteAverage,
            dateRelease: DateHelper.formatConverter(
              movie.releaseDate,
              DateHelper.FORMAT_YYYY_MM_DD,
              DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
            ),
            voteCount: movie.voteCount,
            placeholder: Drawable.NO_IMAGE,
            errorPlaceholder: Drawable.NO_IMAGE,
            onTap: () {
              bloc.goToDetailMovie(context, movie.id);
            },
          );
        },
      );
    } else {
      return emptyFavorite('Movie');
    }
  }

  Widget tvShowList(List<TvShow> tvShows) {
    if (tvShows.isNotEmpty) {
      return ListView.separated(
        separatorBuilder: (ctx, position) => SizedBox(height: 8.0),
        itemCount: tvShows.length,
        itemBuilder: (ctx, position) {
          final tvShow = tvShows[position];
          final topMargin = position == 0 ? 8.0 : 0.0;
          return MovieCardView(
            margin: EdgeInsets.fromLTRB(16.0, topMargin, 16.0, 0.0),
            backgroundColor: ColorTheme.primaryDark,
            imageUrl: '${UrlConstant.IMAGE_URL}${tvShow.posterPath}',
            title: tvShow.originalName,
            overview: tvShow.overview,
            movieRating: tvShow.voteAverage,
            dateRelease: DateHelper.formatConverter(
              tvShow.firstAirDate,
              DateHelper.FORMAT_YYYY_MM_DD,
              DateHelper.FORMAT_DD_MMM_COMMA_YYYY,
            ),
            voteCount: tvShow.voteCount,
            placeholder: Drawable.NO_IMAGE,
            errorPlaceholder: Drawable.NO_IMAGE,
            onTap: () {
              bloc.goToDetailTvShow(context, tvShow.id);
            },
          );
        },
      );
    } else {
      return emptyFavorite('Tv Show');
    }
  }

  Widget emptyFavorite(String type) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssetImageView(
              fit: BoxFit.cover,
              path: Drawable.NO_FAVORITE,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextView(
              'No Favorite $type',
              textSize: 24.0,
              bold: true,
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(FavoriteType type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorTheme.primaryDark,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Movies'),
                trailing: Radio<FavoriteType>(
                  value: FavoriteType.MOVIE,
                  activeColor: Colors.white,
                  groupValue: type,
                  onChanged: (FavoriteType? value) {
                    Navigator.pop(context);
                    bloc.getMovieFavorite();
                  },
                ),
              ),
              ListTile(
                title: const Text('Tv Shows'),
                trailing: Radio<FavoriteType>(
                  value: FavoriteType.TVSHOW,
                  activeColor: Colors.white,
                  groupValue: type,
                  onChanged: (FavoriteType? value) {
                    Navigator.pop(context);
                    bloc.getTvShowFavorite();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
