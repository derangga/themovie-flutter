typedef Parser<T> = T Function(dynamic json);

class PagingDTO<T> {
  int page, totalPage, totalResults;
  T data;

  PagingDTO.fromJson(Map<String, dynamic> json, Parser<T> parser) {
    page = json['page'];
    totalPage = json['total_pages'];
    totalResults = json['total_results'];
    data = parser(json['results']);
  }
}
