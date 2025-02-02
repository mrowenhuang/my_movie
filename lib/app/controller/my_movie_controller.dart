import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_movie/app/controller/connection/movie_conn.dart';
import 'package:my_movie/app/data/models/movie_model.dart';
import 'package:my_movie/app/data/models/search_movie_model.dart';

class MyMovieController extends GetxController {
  final box = GetStorage();

  final searchingMovieList = Rx<AllMovieData?>(null);
  final watchList = List<Movie?>.empty().obs;
  final trendingMovieList = Rx<AllMovieData?>(null);
  final languageMovieList = Rx<AllMovieData?>(null);
  var movieYear = Rx<int?>(2025);
  var movieLanguageId = Rx<String?>("id");
  var movieLanguage = Rx<String?>("Indonesia");
  var movieScheduleDescription = Rx<DateTime?>(null);

  void switchId(countryId) {
    switch (countryId) {
      case "zh":
        movieLanguage.value = "China";
        break;
      case "id":
        movieLanguage.value = "Indonesia";
        break;
      case "en":
        movieLanguage.value = "English/Us";
        break;
      case "th":
        movieLanguage.value = "Thailand";
        break;
      case "ja":
        movieLanguage.value = "japan";
        break;

      default:
    }
  }

  Future getSearchingMovie(String movie, String page) async {
    searchingMovieList.value = await MovieConn().getSearchingMovie(movie, page);
  }

  Future getTrendingMovie() async {
    trendingMovieList.value = await MovieConn().getTrendingMovie();
  }

  Future getTargettinglanguageMovie(
      {String? year = "2025",
      String? language = "id",
      String page = "1"}) async {
    languageMovieList.value = await MovieConn()
        .getLanguageMovie(language: language, year: year, page: page);
  }

  Movie findMovieDetail(int id, int cases) {
    Movie? movieData;
    switch (cases) {
      case 1:
        movieData = trendingMovieList.value!.results!.firstWhere(
          (element) => element.id == id,
        );
        break;
      case 2:
        movieData = languageMovieList.value!.results!.firstWhere(
          (element) => element.id == id,
        );
        break;
      case 3:
        movieData = searchingMovieList.value!.results!.firstWhere(
          (element) => element.id == id,
        );
        break;
      default:
    }

    for (var i = 0; i < movieData!.genreIds!.length; i++) {
      switch (movieData.genreIds![i]) {
        case 28:
          movieData.genreIds![i] = "Action";
          break;

        case 12:
          movieData.genreIds![i] = "Adventure";
          break;

        case 16:
          movieData.genreIds![i] = "Animation";
          break;

        case 35:
          movieData.genreIds![i] = "Comedy";
          break;

        case 80:
          movieData.genreIds![i] = "Crime";
          break;

        case 99:
          movieData.genreIds![i] = "Documentary";
          break;

        case 18:
          movieData.genreIds![i] = "Drama";
          break;

        case 10751:
          movieData.genreIds![i] = "Family";
          break;

        case 14:
          movieData.genreIds![i] = "Fantasy";
          break;

        case 36:
          movieData.genreIds![i] = "History";
          break;

        case 27:
          movieData.genreIds![i] = "Horror";
          break;

        case 10402:
          movieData.genreIds![i] = "Music";
          break;

        case 9648:
          movieData.genreIds![i] = "Mystery";
          break;

        case 10749:
          movieData.genreIds![i] = "Romance";
          break;

        case 878:
          movieData.genreIds![i] = "Science Fiction";
          break;

        case 10770:
          movieData.genreIds![i] = "TV Movie";
          break;

        case 53:
          movieData.genreIds![i] = "Thriller";
          break;

        case 10752:
          movieData.genreIds![i] = "War";
          break;

        case 37:
          movieData.genreIds![i] = "Western";
          break;

        default:
          print(' invalid entry');
      }
    }

    return movieData;
  }

  // ! mau di setting untuk bisa ke movie yang lain

  void addWatchlist(Movie data, int index, dynamic movieType) {
    var status = watchList.any((element) => element!.id == data.id);
    if (status) {
      movieType.value!.results![index].fav =
          !movieType.value!.results![index].fav;

      movieType.value!.results![index].description = null;

      update();

      watchList.removeWhere(
        (element) => element!.id == data.id,
      );
    } else {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            title: Text("Schedule Date & Time"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  movieType.value!.results![index].fav =
                      !movieType.value!.results![index].fav;

                  movieType.value!.results![index].description =
                      DateFormat('yyyy-MM-dd – kk:mm')
                          .format(movieScheduleDescription.value!);

                  update();
                  watchList.add(data);
                  box.write("movieList",
                      watchList.map((element) => element!.toJson()).toList());
                  Get.back();
                },
                child: Text('Save'),
              )
            ],
            content: Material(
              elevation: 10,
              child: SizedBox(
                height: 300,
                width: 300,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  onDateTimeChanged: (value) {
                    movieScheduleDescription.value = value;
                  },
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void removefromWatchList(
    Movie data,
  ) {
    watchList.removeWhere(
      (element) => element!.id == data.id,
    );
    watchList.refresh();
    box.write(
        "movieList", watchList.map((element) => element!.toJson()).toList());
  }

  void loadWatchList() {
    if (box.read('movieList') != null) {
      var rawData = box.read('movieList') as List;
      watchList.value = rawData.map((e) => Movie.fromJson(e)).toList();
    }
  }

  void saveIdAndLanguageToLocal() {
    box.write("language", movieLanguageId.value);
    box.write('year', movieYear.value);
  }

  void loadIdAndLanguage() {
    movieLanguageId.value = box.read('language') ?? "id";
    switchId(box.read('language') ?? "id");
    movieYear.value = box.read('year') ?? 2025;
  }

  void clearData() {
    searchingMovieList.value = null;
  }

  void printingData() {
    watchList.forEach(
      (element) => print(element?.title),
    );
  }

  @override
  void onInit() async {
    super.onInit();
    loadIdAndLanguage();
    loadWatchList();
    await getTrendingMovie();
    await getTargettinglanguageMovie(
      language: box.read('language') ?? "id",
      year: box.read('year')?.toString() ?? "2025",
    );
  }
}
