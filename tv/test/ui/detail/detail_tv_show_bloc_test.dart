import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/src/data/model/cast_and_crew.dart';
import 'package:tv/src/data/model/detail_tv_show.dart';
import 'package:tv/src/data/model/tv_show.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';
import 'package:tv/src/ui/detail/detail_tv_show_bloc.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  MockTvShowRepository tvShowRepository;
  final Logger logger = Logger();
  DetailTvShowBloc detailBloc;

  final tvShowResponse = [
    TvShow(
        id: 0,
        name: '',
        originalName: '',
        originalLanguage: '',
        backdropPath: '',
        posterPath: '',
        firstAirDate: '',
        overview: '',
        popularity: 0,
        voteAverage: '',
        voteCount: 0)
  ];

  final detailTvShowResponse = DetailTvShow(
      backdropPath: "",
      firstAirDate: "",
      genres: [],
      homepage: "",
      id: 0,
      inProduction: false,
      lastAirDate: "",
      name: "",
      numberOfEpisodes: 0,
      numberOfSeasons: 0,
      originalLanguage: "",
      originalName: "",
      overview: "",
      popularity: 0,
      posterPath: "",
      seasons: [],
      status: "",
      tagline: "",
      type: "",
      voteAverage: "",
      voteCount: 0);

  final castAndCrewResponse = [
    Cast(
      character: "",
      creditId: "",
      id: 0,
      name: "",
      originalName: "",
      popularity: 0,
      profilePath: "",
    )
  ];

  setUp(() {
    tvShowRepository = MockTvShowRepository();
    detailBloc = DetailTvShowBloc(logger, tvShowRepository);
  });
}
