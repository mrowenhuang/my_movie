import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_movie/app/controller/connection/movie_conn.dart';
import 'package:my_movie/app/data/models/movie_model.dart';
import 'package:my_movie/app/data/models/search_movie_model.dart';

class MyMovieController extends GetxController {
  final box = GetStorage();
  var searchingMovieList = Rx<SearchMovie?>(null);
  var watchList = List<Movie?>.empty().obs;

  Future getSearchingMovie(String movie, String page) async {
    searchingMovieList.value = await MovieConn().getSearchingMovie(movie, page);
  }

  Movie findMovieDetail(int id) {
    final movieData = searchingMovieList.value!.results!.firstWhere(
      (element) => element.id == id,
    );

    // for (var element in movieData.genreIds!) {
    //   switch (element) {
    //     case 28:
    //       element =
    //       break;
    //     default:
    //   }
    // }

    for (var i = 0; i < movieData.genreIds!.length; i++) {
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

  void addWatchlist(Movie data, int index) {
    var status = watchList.any((element) => element!.id == data.id);

    if (status) {
      searchingMovieList.value!.results![index].fav =
          !searchingMovieList.value!.results![index].fav;
      update();

      watchList.removeWhere(
        (element) => element!.id == data.id,
      );
    } else {
      searchingMovieList.value!.results![index].fav =
          !searchingMovieList.value!.results![index].fav;

      update();
      watchList.add(data);
      box.write("movieList", watchList);
    }
  }

  void clearData() {
    searchingMovieList.value = null;
  }

  void printingData() {
    watchList.forEach(
      (element) => print(element?.title),
    );

    // watchList.firstWhere(
    //   (element) {
    //     if (element.id == ) {

    //     }
    //   },
    // );
  }
}
