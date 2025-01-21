import 'package:my_movie/app/data/models/movie_model.dart';

class SearchMovie {
  num? page;
  List<Movie>? results;
  num? totalPages;
  num? totalResults;

  SearchMovie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SearchMovie.fromJson(Map<String, dynamic> json) {
    page = json['page'] as num?;
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results?.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'] as num?;
    totalResults = json['total_results'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
