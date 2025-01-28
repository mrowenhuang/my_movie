import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_detail/bindings/movie_detail_binding.dart';
import '../modules/movie_detail/views/movie_detail_view.dart';
import '../modules/searching/bindings/searching_binding.dart';
import '../modules/searching/views/searching_view.dart';
import '../modules/see_more/bindings/see_more_binding.dart';
import '../modules/see_more/views/see_more_view.dart';
import '../modules/watchlist/bindings/watchlist_binding.dart';
import '../modules/watchlist/views/watchlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHING,
      page: () => const SearchingView(),
      binding: SearchingBinding(),
    ),
    GetPage(
      name: _Paths.WATCHLIST,
      page: () => const WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: _Paths.SEE_MORE,
      page: () => const SeeMoreView(),
      binding: SeeMoreBinding(),
    ),
  ];
}
