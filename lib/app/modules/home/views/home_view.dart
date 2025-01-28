import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_movie/app/routes/app_pages.dart';
import 'package:my_movie/app/widgets/movie_banner_list.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movieC = Get.find<MyMovieController>();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          MyColor.hightlightLight.withOpacity(.7),
          MyColor.hightlightDarkest,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    movieC.trendingMovieList.value == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CarouselSlider(
                            items: List.generate(
                              5,
                              (index) {
                                return Image.network(
                                  // ignore: invalid_use_of_protected_member
                                  'https://image.tmdb.org/t/p/w780${movieC.trendingMovieList.value!.results![index].posterPath}',
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            options: CarouselOptions(
                              autoPlay: true,
                              height: size.height * .7,
                              pauseAutoPlayOnTouch: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              viewportFraction: 1,
                              animateToClosest: true,
                            ),
                          ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 20,
                        left: 20,
                        bottom: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Welcome to\nmy movie',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Hope you can feel better\nafter explore me 😊😊😊',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(.9),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  movieC.clearData();
                                  Get.toNamed(Routes.SEARCHING);
                                },
                                label: Text("search"),
                                icon: Icon(Icons.search),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.hightlightMedium,
                                  shape: StadiumBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  Get.toNamed(Routes.WATCHLIST);
                                },
                                label: Text("Watchlist"),
                                icon: Icon(Icons.star),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColor.hightlightMedium,
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ~ search area

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Now Trending',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'See More >>',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: size.height * .25,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              movieC.trendingMovieList.value?.results?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            var data =
                                movieC.trendingMovieList.value!.results![index];
                            return MovieBannerList(
                              cases: 1,
                              index: index,
                              posterPath: data.posterPath,
                              id: data.id!.toInt(),
                              doubleFavTap: () {
                                movieC.addWatchlist(
                                    data, index, movieC.trendingMovieList);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${movieC.movieLanguage.value} / ${movieC.movieYear.value}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SEE_MORE,
                                      arguments: {"type": "movieLanguage"});
                                },
                                child: const Text(
                                  'See More >>',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              side: const BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Obx(
                                    () => Container(
                                      height: 200,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            width: size.width * .5,
                                            height: 5,
                                            decoration: BoxDecoration(
                                              color: MyColor.hightlightDarkest,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Year",
                                                    style: TextStyle(
                                                        color: MyColor
                                                            .hightlightDarkest,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  OutlinedButton.icon(
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return Obx(
                                                            () => AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              title: Text(
                                                                "Choose Date",
                                                                style: TextStyle(
                                                                    color: MyColor
                                                                        .hightlightDarkest),
                                                              ),
                                                              content: SizedBox(
                                                                height: 200,
                                                                width: 200,
                                                                child:
                                                                    YearPicker(
                                                                  dragStartBehavior:
                                                                      DragStartBehavior
                                                                          .down,
                                                                  currentDate:
                                                                      DateTime(movieC
                                                                          .movieYear
                                                                          .value!),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1970),
                                                                  lastDate: DateTime(
                                                                      DateTime.now()
                                                                          .year),
                                                                  selectedDate:
                                                                      DateTime(movieC
                                                                          .movieYear
                                                                          .value!),
                                                                  onChanged:
                                                                      (value) {
                                                                    movieC.movieYear
                                                                            .value =
                                                                        value
                                                                            .year;

                                                                    movieC.getTargettinglanguageMovie(
                                                                        language: movieC
                                                                            .movieLanguageId
                                                                            .value,
                                                                        year: value
                                                                            .year
                                                                            .toString());
                                                                    movieC
                                                                        .saveIdAndLanguageToLocal();
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      fixedSize: Size(
                                                          size.width * .4, 60),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 20,
                                                        vertical: 18,
                                                      ),
                                                      side: const BorderSide(
                                                          width: 1),
                                                    ),
                                                    label: Text(
                                                      movieC.movieYear.value
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: MyColor
                                                              .hightlightDarkest),
                                                    ),
                                                    icon: Icon(
                                                      Icons.date_range_rounded,
                                                      color: MyColor
                                                          .hightlightDarkest,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Language",
                                                    style: TextStyle(
                                                        color: MyColor
                                                            .hightlightDarkest,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  DropdownMenu(
                                                    width: size.width * .4,
                                                    leadingIcon: const Icon(
                                                        Icons
                                                            .translate_rounded),
                                                    hintText: "Movie Language",
                                                    menuStyle: MenuStyle(
                                                      elevation:
                                                          const WidgetStatePropertyAll(
                                                              10),
                                                      shape:
                                                          WidgetStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    dropdownMenuEntries: const [
                                                      DropdownMenuEntry(
                                                          value: "zh",
                                                          label: "China"),
                                                      DropdownMenuEntry(
                                                          value: "id",
                                                          label: "Indonesia"),
                                                      DropdownMenuEntry(
                                                          value: "en",
                                                          label: "English/Us"),
                                                      DropdownMenuEntry(
                                                          value: "th",
                                                          label: "Thailand"),
                                                      DropdownMenuEntry(
                                                          value: "ja",
                                                          label: "Japan"),
                                                    ],
                                                    initialSelection: movieC
                                                        .movieLanguageId.value,
                                                    onSelected: (value) async {
                                                      movieC.movieLanguageId
                                                          .value = value;
                                                      movieC.switchId(value);
                                                      await movieC
                                                          .getTargettinglanguageMovie(
                                                        language: value,
                                                        year: movieC
                                                            .movieYear.value
                                                            .toString(),
                                                      );
                                                      movieC
                                                          .saveIdAndLanguageToLocal();
                                                    },
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: const Text(
                              "Setting",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: size.height * .25,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              movieC.languageMovieList.value?.results?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            var data =
                                movieC.languageMovieList.value?.results?[index];
                            return GetBuilder(
                                init: movieC,
                                builder: (context) {
                                  return Stack(
                                    children: [
                                      MovieBannerList(
                                        id: data!.id!.toInt(),
                                        cases: 2,
                                        index: index,
                                        posterPath: data.posterPath,
                                        doubleFavTap: () {
                                          movieC.addWatchlist(
                                            data,
                                            index,
                                            movieC.languageMovieList,
                                          );
                                        },
                                      ),
                                      AnimatedPositioned(
                                        top: data.fav ? 0 : -50,
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 500),
                                        child: Icon(
                                          Icons.bookmark,
                                          size: 30,
                                          color: MyColor.hightlightLight,
                                        ),
                                      )
                                    ],
                                  );
                                },);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
