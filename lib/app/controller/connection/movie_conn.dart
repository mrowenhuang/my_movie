import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_movie/app/controller/dio.dart';
import 'package:my_movie/app/data/models/movie_model.dart';

class MovieConn {
  final Dio _dio = DioConn.dio;

  Future getTrendingMovie() async {
    final response = await _dio.get('3/trending/movie/day?language=en-US');

    if (response.statusCode == 200) {
      // print(response.data['results']);
      return (response.data['results'] as List)
          .map(
            (e) => Movie.fromJson(e),
          )
          .toList();
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

  Future getFilterMovie({String? year, String? language, String page = "1"}) async {
    final response = await _dio.get('3/discover/movie?language=en-US&sort_by=popularity.desc&page=1&primary_release_year=2020&with_original_language=zh');

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


}
