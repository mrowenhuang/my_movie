import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:my_movie/app/routes/app_pages.dart';
import 'package:my_movie/app/widgets/list_container.dart';
import 'package:my_movie/app/widgets/move_movie_page.dart';
import 'package:my_movie/app/widgets/page_and_results.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MyMovieController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColor.hightlightLight.withOpacity(.7),
                MyColor.hightlightDarkest,
              ],
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text("Searching movie"),
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      transitionAnimationController:
                          controller.animationController,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: constraints.maxWidth * .5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: MyColor.hightlightDarkest,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: MyColor.hightlightDarkest,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: constraints.maxWidth * .5,
                                        height: constraints.maxHeight * .25,
                                        child: Card(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: YearPicker(
                                            currentDate:
                                                controller.movieYear.value,
                                            firstDate: DateTime(1970),
                                            lastDate:
                                                DateTime(DateTime.now().year),
                                            selectedDate:
                                                controller.movieYear.value,
                                            onChanged: (value) {
                                              controller.movieYear.value =
                                                  value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Language",
                                        style: TextStyle(
                                            color: MyColor.hightlightDarkest,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      DropdownMenu(
                                        hintText: "Movie Language",
                                        width: constraints.maxWidth * .35,
                                        menuStyle: MenuStyle(
                                          elevation: WidgetStatePropertyAll(10),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        dropdownMenuEntries: const [
                                          DropdownMenuEntry(
                                              value: "zh", label: "China"),
                                          DropdownMenuEntry(
                                              value: "id", label: "Indonesia"),
                                          DropdownMenuEntry(
                                              value: "en", label: "English"),
                                          DropdownMenuEntry(
                                              value: "th", label: "Thailand"),
                                          DropdownMenuEntry(
                                              value: "ja", label: "Japan"),
                                        ],
                                        initialSelection:
                                            controller.movieLanguage.value,
                                        onSelected: (value) {
                                          controller.movieLanguage.value =
                                              value;
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Filter Status",
                                        style: TextStyle(
                                            color: MyColor.hightlightDarkest,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      CupertinoSwitch(
                                        value: controller.filterStatus.value,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          controller.filterStatus.value = value;
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  padding: EdgeInsets.zero,
                  splashRadius: 25,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller.searchC,
                            style: TextStyle(color: MyColor.hightlightDarkest),
                            cursorColor: MyColor.hightlightDarkest,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: "Find Your Movie",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                              fillColor: Colors.transparent,
                              filled: true,
                              contentPadding: const EdgeInsets.all(20),
                              suffixStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            onSubmitted: (value) {
                              movieC.getSearchingMovie(
                                  controller.searchC.text, 1.toString());
                              controller.activePage.value = 1;
                            },
                          ),
                        ),
                        // todo : testing button
                        // ElevatedButton(
                        //     onPressed: () {
                        //       movieC.printingData();
                        //     },
                        //     child: Text("data")),
                        // todo : end testing area
                      ],
                    ),
                    const SizedBox(height: 10),
                    PageAndResults(
                        movieC: movieC.searchingMovieList.value,
                        activePage: controller.activePage.value),
                    const SizedBox(height: 10),
                    Expanded(
                      child: movieC.searchingMovieList.value == null ||
                              movieC.searchingMovieList.value!.results!.isEmpty
                          ? const Center(
                              child: Text(
                                "No Results",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: movieC.searchingMovieList
                                                .value?.results?.length ??
                                            0,
                                        padding: EdgeInsets.zero,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var data = movieC.searchingMovieList
                                              .value!.results![index];

                                          for (var element
                                              in movieC.watchList) {
                                            if (element!.id == data.id!) {
                                              data.fav = true;
                                            }
                                          }
                                          return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.MOVIE_DETAIL,
                                                  arguments: {
                                                    "id": data.id,
                                                    "cases": 3,
                                                  });
                                            },
                                            child: Slidable(
                                              endActionPane: ActionPane(
                                                motion: const ScrollMotion(),
                                                children: [
                                                  GestureDetector(
                                                    onLongPress: () {},
                                                    onTap: () {
                                                      // data.fav = !data.fav;

                                                      movieC.addWatchlist(
                                                        data,
                                                        index,
                                                        movieC
                                                            .searchingMovieList,
                                                      );

                                                      // movieC
                                                      //     .addToListAndStorage(
                                                      //         data);
                                                      // movieC.addWatchlist(
                                                      //     index);
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          15,
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: GetBuilder(
                                                          init: movieC,
                                                          builder: (context) {
                                                            return Icon(
                                                              data.fav
                                                                  ? Icons
                                                                      .bookmark_add
                                                                  : Icons
                                                                      .bookmark_add_outlined,
                                                              color: MyColor
                                                                  .hightlightMedium,
                                                              size: 30,
                                                            );
                                                          }),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              child: Stack(
                                                children: [
                                                  ListContainer(
                                                    containerHeight: 130,
                                                    title: data.title!,
                                                    posterPath: data.posterPath,
                                                    overView: data.overview!,
                                                    customText:
                                                        'Release Date : ${data.releaseDate}',
                                                    oriLanguage:
                                                        data.originalLanguage!,
                                                  ),
                                                  GetBuilder(
                                                    init: movieC,
                                                    builder: (controller) {
                                                      return data.fav
                                                          ? Positioned(
                                                              top: 0,
                                                              left: 0,
                                                              child: Icon(
                                                                Icons.bookmark,
                                                                size: 35,
                                                                color: MyColor
                                                                    .hightlightLight,
                                                              ),
                                                            )
                                                          : const SizedBox();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 10),
                    movieC.searchingMovieList.value?.totalPages != null &&
                            movieC.searchingMovieList.value!.totalPages! > 1
                        ? MoveMoviePage(
                            nextPage: () {
                              controller.activePage.value <
                                      movieC
                                          .searchingMovieList.value!.totalPages!
                                  ? movieC.getSearchingMovie(
                                      controller.searchC.text,
                                      (controller.activePage.value += 1)
                                          .toString(),
                                    )
                                  : null;
                            },
                            backPage: () {
                              controller.activePage.value > 1
                                  ? movieC.getSearchingMovie(
                                      controller.searchC.text,
                                      (controller.activePage.value -= 1)
                                          .toString())
                                  : null;
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
