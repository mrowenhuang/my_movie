import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_movie/app/data/models/movie_model.dart';

class WatchlistController extends GetxController {
  //TODO: Implement WatchlistController
  final box = GetStorage();

  //  final watchList;

  var watchList = RxList<Movie?>.empty();

  void restoreData() {
    if (box.read('movieList').runtimeType != List<dynamic>) {
      watchList = box.read('movieList');
    }
    // print(box.read('movieList'));
  }

  @override
  void onInit() {
    super.onInit();
    // print
    restoreData();
    // watchList = box.read('movieList');
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
