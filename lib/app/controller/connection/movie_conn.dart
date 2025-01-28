import 'package:dio/dio.dart';
import 'package:my_movie/app/controller/connection/dio.dart';
import 'package:my_movie/app/data/models/movie_model.dart';
import 'package:my_movie/app/data/models/search_movie_model.dart';

class MovieConn {
  final Dio _dio = DioConn.dio;

  Future getTrendingMovie() async {
    final response = await _dio.get('3/trending/movie/day?language=en-US');

    if (response.statusCode == 200) {
      // print(response.data['results']);
      return AllMovieData.fromJson(response.data);
    } else {
      print(response.statusCode);
    }
  }

  Future getTopRatedMovie() async {
    final response = await _dio.get('3/movie/top_rated?language=en-US&page=1');

    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map(
            (e) => Movie.fromJson(e),
          )
          .toList();
    } else {
      print(response.statusCode);
    }
  }

  Future getSearchingMovie(String movie, String page) async {
    final response = await _dio.get('3/search/movie?query=$movie&page=$page');

    if (response.statusCode == 200) {
      return AllMovieData.fromJson(response.data);
    } else {
      print(response.statusCode);
    }
  }

  Future getLanguageMovie(
      {String? year, String? language, String page = "1"}) async {
    final response = await _dio.get(
        '3/discover/movie?language=en-US&sort_by=popularity.desc&page=$page&primary_release_year=$year&with_original_language=$language');

    if (response.statusCode == 200) {
      return AllMovieData.fromJson(response.data);
    } else {
      print(response.statusCode);
    }
  }
}
