import 'package:tv/src/data/model/cast_and_crew.dart';
import 'package:tv/src/data/model/detail_tv_show.dart';
import 'package:tv/src/data/model/tv_show.dart';

class DetailTvShowContent {
  DetailTvShow detailTvShow;
  List<TvShow> similarTvShow;
  List<Cast> castsTvShow;

  DetailTvShowContent(
      {this.detailTvShow, this.similarTvShow, this.castsTvShow});
}
