import 'package:flutter/foundation.dart';

typedef ArrayParser<T> = T Function(List<dynamic> jsonArray);
typedef Parser<T> = T Function(dynamic json);

/// DTO Parser wrapper
class PagingDTO<T> {
  int page, totalPage, totalResults;
  T data;

  /// To parse json that the result field is JsonArray :
  /// {
  ///   "page" : int,
  ///   "results" : [],
  ///   "total_pages" : int,
  ///   "total_results" : int
  /// }
  PagingDTO.fromJsonArray(
      Map<String, dynamic> json, ArrayParser<T> parserArray) {
    page = json['page'];
    totalPage = json['total_pages'];
    totalResults = json['total_results'];
    data = parserArray(json['results']);
  }

  /// to parse json that the result field is JsonObject :
  /// {
  ///   "page" : int,
  ///   "results" : {},
  ///   "total_pages" : int,
  ///   "total_results" : int
  /// }
  PagingDTO.fromJsonObject(Map<String, dynamic> json, Parser<T> parser) {
    page = json['page'];
    totalPage = json['total_pages'];
    totalResults = json['total_results'];
    data = parser(json['results']);
  }
}

class PagingModel<T> {
  int page, totalPage, totalResults;
  T data;

  PagingModel(
      {@required this.data,
      @required this.page,
      @required this.totalPage,
      @required this.totalResults})
      : assert(data != null),
        assert(page != null),
        assert(totalPage != null),
        assert(totalResults != null);
}
