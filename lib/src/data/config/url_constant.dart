class UrlConstant {
  static const IMAGE_URL = "https://image.tmdb.org/t/p/w500";
  static const YT_THUMBNAIL = "https://img.youtube.com/vi/{key}/0.jpg";
  static const YT_VIDEO = "https://www.youtube.com/watch?v={key}";

  static String youtubeThumbnail(String key) {
    return YT_THUMBNAIL.replaceAll("{key}", key);
  }

  static String youtubeVideo(String key) {
    return YT_VIDEO.replaceAll("{key}", key);
  }
}
