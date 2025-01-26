import 'package:get/get.dart';
import 'package:my_movie/app/controller/connection/movie_conn.dart';
import 'package:my_movie/app/data/models/movie_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final trendingMovieList = List<Movie>.empty().obs;
  final topRatedMovieList = List<Movie>.empty().obs;

  Future getTrendingMovie() async {
    trendingMovieList.value = await MovieConn().getTrendingMovie();
  }

  Future getTargettingCountryMovie() async {
    topRatedMovieList.value = await MovieConn().getTopRatedMovie();
  }

  @override
  void onInit() async {
    super.onInit();
    await getTrendingMovie();
    await getTargettingCountryMovie();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
