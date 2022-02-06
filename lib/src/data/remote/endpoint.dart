class Endpoint {
  static const DISCOVER_MOVIE = 'discover/movie';
  static const MOVIE_ID = '{movie_id}';
  static const UPCOMING_MOVIE = 'movie/upcoming';
  static const DETAIL_MOVIE = 'movie/$MOVIE_ID';
  static const SIMILIAR_MOVIE = 'movie/$MOVIE_ID/similar';
  static const CREDITS_MOVIE = 'movie/$MOVIE_ID/credits';
  static const REVIEW_MOVIE = 'movie/$MOVIE_ID/reviews';
  static const TRAILER_MOVIE = 'movie/$MOVIE_ID/videos';
  static const GENRE_MOVIE = 'genre/movie/list';
  static const DISCOVER_TV_SHOW = 'discover/tv';
  static const TV_ID = '{tv_id}';
  static const DETAIL_TV_SHOW = 'tv/$TV_ID';
  static const SIMILAR_TV_SHOW = 'tv/$TV_ID/similar';
  static const CREDITS_TV_SHOW = 'tv/$TV_ID/credits';
  static const REVIEW_TV_SHOW = 'tv/$TV_ID/reviews';
  static const TRAILER_TV_SHOW = 'tv/$TV_ID/videos';
  static const TRENDING_MOVIE = 'trending/movie/day';
  static const TRENDING_TV_SHOW = 'trending/tv/day';
}
