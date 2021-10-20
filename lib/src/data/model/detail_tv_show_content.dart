import 'cast_and_crew.dart';
import 'detail_tv_show.dart';
import 'tv_show.dart';

class DetailTvShowContent {
  DetailTvShow detailTvShow;
  List<TvShow> similarTvShow;
  List<Cast> castsTvShow;

  DetailTvShowContent(
      {this.detailTvShow, this.similarTvShow, this.castsTvShow});
}
