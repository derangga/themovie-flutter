import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import '../config/failure.dart';
import '../remote/tv_show_remote_source.dart';
import '../mapper/tv_show_mapper.dart';
import '../mapper/cast_and_crew_mapper.dart';
import '../mapper/video_mapper.dart';
import '../model/tv_show.dart';
import '../model/detail_tv_show.dart';
import '../model/cast_and_crew.dart';
import '../model/videos.dart';
import 'endpoint.dart';

class TvShowRemoteSourceImpl extends TvShowRemoteSource {
  TvShowRemoteSourceImpl(Dio dio) : super(dio);

  @override
  Future<Either<Failure, List<TvShow>>> getDiscoverTvShow(int page) async {
    String url =
        "${Endpoint.DISCOVER_TV_SHOW}?api_key=$token&sort_by=popularity.desc&page=$page";
    final result = await get<List<TvShow>>(url, converter: (response) {
      final List<TvShow> tvShows = List.empty(growable: true);
      if (response['results'] != null) {
        response['results'].forEach((v) {
          tvShows.add(TvShowDTO.fromJson(v).toModel());
        });
      }
      return tvShows;
    });
    return result;
  }

  @override
  Future<Either<Failure, DetailTvShow>> getDetailTvShow(int? tvShowId) async {
    String url =
        "${Endpoint.DETAIL_TV_SHOW.replaceAll(Endpoint.TV_ID, '$tvShowId')}?api_key=$token";
    final result = await get<DetailTvShow>(url,
        converter: (response) => DetailTvShowDTO.fromJson(response).toModel());
    return result;
  }

  @override
  Future<Either<Failure, List<Cast>>> getCastAndCrew(int? tvShowId) async {
    String url =
        "${Endpoint.CREDITS_TV_SHOW.replaceAll(Endpoint.TV_ID, '$tvShowId')}?api_key=$token";
    final result = await get<List<Cast>>(url, converter: (response) {
      final List<Cast> casts = List.empty(growable: true);
      if (response['cast'] != null) {
        response['cast'].forEach((v) {
          casts.add(CastDTO.fromJson(v).toModel());
        });
      }
      return casts;
    });
    return result;
  }

  @override
  Future<Either<Failure, List<TvShow>>> getSimilarTvShow(
      int? tvShowId, int page) async {
    String url =
        "${Endpoint.SIMILAR_TV_SHOW.replaceAll(Endpoint.TV_ID, '$tvShowId')}?api_key=$token";
    final result = await get<List<TvShow>>(url, converter: (response) {
      final List<TvShow> tvShows = List.empty(growable: true);
      if (response['results'] != null) {
        response['results'].forEach((v) {
          tvShows.add(TvShowDTO.fromJson(v).toModel());
        });
      }
      return tvShows;
    });
    return result;
  }

  @override
  Future<Either<Failure, List<Video>>> getTvShowTrailer(int tvShowId) async {
    String url =
        "${Endpoint.TRAILER_TV_SHOW.replaceAll(Endpoint.TV_ID, "$tvShowId")}?api_key=$token";
    final result = await get<List<Video>>(url, converter: (response) {
      final List<Video> videos = List.empty(growable: true);
      if (response['results'] != null) {
        response['results'].forEach((v) {
          videos.add(VideoDTO.fromJson(v).toModel());
        });
      }
      return videos;
    });
    return result;
  }
}
