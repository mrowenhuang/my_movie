import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/app/controller/connection/movie_conn.dart';
import 'package:my_movie/app/data/models/search_movie_model.dart';

class SearchingController extends GetxController {
  //TODO: Implement SearchingController

  var movieYear = Rx<DateTime?>(null);
  var movieLanguage = Rx<String?>(null);
  var filterStatus = Rx<bool>(false);

  late TextEditingController searchC;

  var searchingMovieList = Rx<SearchMovie?>(null);

  Future getSearchingMovie(String movie) async {
    searchingMovieList.value = await MovieConn().getSearchingMovie(movie: movie, page: "1");
  }

  @override
  void onInit() {
    super.onInit();

    searchC = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchC.dispose();
  }
}
