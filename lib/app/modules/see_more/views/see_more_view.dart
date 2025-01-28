import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:my_movie/app/routes/app_pages.dart';
import 'package:my_movie/app/widgets/list_container.dart';
import 'package:my_movie/app/widgets/move_movie_page.dart';
import 'package:my_movie/app/widgets/page_and_results.dart';

import '../controllers/see_more_controller.dart';

class SeeMoreView extends GetView<SeeMoreController> {
  const SeeMoreView({super.key});
  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MyMovieController>();
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Obx(
            () => Text("${movieC.movieLanguage.value} / ${movieC.movieYear}"),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Obx(
              () => Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Obx(
                                  () => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: const Text(
                                      "Choose Date",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    content: SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: YearPicker(
                                        dragStartBehavior:
                                            DragStartBehavior.down,
                                        currentDate:
                                            DateTime(movieC.movieYear.value!),
                                        firstDate: DateTime(1970),
                                        lastDate: DateTime(DateTime.now().year),
                                        selectedDate:
                                            DateTime(movieC.movieYear.value!),
                                        onChanged: (value) {
                                          movieC.movieYear.value = value.year;
                                          controller.activePage.value = 1;
                                          movieC.getTargettinglanguageMovie(
                                              language:
                                                  movieC.movieLanguageId.value,
                                              year: value.year.toString());
                                          movieC.saveIdAndLanguageToLocal();
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: Colors,
                            fixedSize: Size(constraints.maxWidth * .4, 60),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          label: Text(
                            movieC.movieYear.value.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.date_range_rounded,
                            color: Colors.white,
                          ),
                        ),
                        DropdownMenu(
                          width: constraints.maxWidth * .4,
                          inputDecorationTheme: InputDecorationTheme(
                              fillColor: Colors.transparent,
                              filled: true,
                              suffixIconColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintStyle: TextStyle(color: Colors.white)),
                          leadingIcon: const Icon(
                            Icons.translate_rounded,
                            color: Colors.white,
                          ),
                          hintText: "Movie Language",
                          textStyle: TextStyle(color: Colors.white),
                          menuStyle: MenuStyle(
                            elevation: const WidgetStatePropertyAll(10),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: "zh", label: "China"),
                            DropdownMenuEntry(value: "id", label: "Indonesia"),
                            DropdownMenuEntry(value: "en", label: "English/Us"),
                            DropdownMenuEntry(value: "th", label: "Thailand"),
                            DropdownMenuEntry(value: "ja", label: "Japan"),
                          ],
                          initialSelection: movieC.movieLanguageId.value,
                          onSelected: (value) async {
                            movieC.movieLanguageId.value = value;
                            movieC.switchId(value);
                            controller.activePage.value = 1;
                            await movieC.getTargettinglanguageMovie(
                              language: value,
                              year: movieC.movieYear.value.toString(),
                            );
                            movieC.saveIdAndLanguageToLocal();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    PageAndResults(
                        movieC: movieC.languageMovieList.value,
                        activePage: controller.activePage.value),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ListView.builder(
                          itemCount:
                              movieC.languageMovieList.value?.results?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            var data =
                                movieC.languageMovieList.value?.results?[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.MOVIE_DETAIL,
                                    arguments: {"id": data.id, "cases": 2});
                              },
                              onLongPress: () {
                                print("text");
                              },
                              child: ListContainer(
                                containerHeight: 130,
                                posterPath: data!.posterPath,
                                oriLanguage: data.originalLanguage,
                                title: data.title,
                                overView: data.overview,
                                customText: "Rating : ${data.voteAverage}",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    movieC.languageMovieList.value?.totalPages != null &&
                            movieC.languageMovieList.value!.totalPages! > 1
                        ? MoveMoviePage(
                            nextPage: () {
                              controller.activePage.value <
                                      movieC
                                          .languageMovieList.value!.totalPages!
                                  ? movieC.getTargettinglanguageMovie(
                                      language: movieC.movieLanguageId.value,
                                      year: movieC.movieYear.value.toString(),
                                      page: (controller.activePage.value += 1)
                                          .toString())
                                  : null;
                            },
                            backPage: () {
                              controller.activePage.value > 1
                                  ? movieC.getTargettinglanguageMovie(
                                      language: movieC.movieLanguageId.value,
                                      year: movieC.movieYear.value.toString(),
                                      page: (controller.activePage.value -= 1)
                                          .toString())
                                  : null;
                            },
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
