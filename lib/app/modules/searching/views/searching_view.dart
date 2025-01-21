import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/data/theme/color.dart';

import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  const SearchingView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.hightlightDarkest,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: MyColor.hightlightDarkest),
                    cursorColor: MyColor.hightlightDarkest,
                    decoration: InputDecoration(
                      hintText: "Find Your Movie",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 2,
                          color: MyColor.hightlightDarkest,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 2,
                          color: MyColor.hightlightDarkest,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      suffixStyle: TextStyle(
                        color: MyColor.hightlightDarkest,
                        fontWeight: FontWeight.bold,
                      ),
                      suffixText: "Search",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: MyColor.hightlightDarkest,
                      ),
                    ),
                    onSubmitted: (value) {
                      controller.getSearchingMovie(value);
                    },
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        height: size.height * .4,
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                              width: size.width * .4,
                              height: 5,
                              decoration: BoxDecoration(
                                color: MyColor.hightlightDarkest,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Year",
                                      style: TextStyle(
                                          color: MyColor.hightlightDarkest,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(
                                      () => SizedBox(
                                        height: size.height * .25,
                                        width: size.width * .5,
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
                                    )
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
                                      width: size.width * .35,
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
                                        controller.movieLanguage.value = value;
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
                                    Obx(
                                      () => CupertinoSwitch(
                                        value: controller.filterStatus.value,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          controller.filterStatus.value = value;
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 40,
                  ),
                )
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,

                //     fixedSize: Size(65,65),
                //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(100))
                //   ),
                //   child: Icon(
                //     Icons.filter,
                //     color: MyColor.hightlightDarkest,
                //   ),
                // )
                // Container(
                //   padding: EdgeInsets.all(15),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(100)
                //   ),
                //   child: Icon(Icons.filter),
                // ),
              ],
            ),
            const Text(
              "Results : 902",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            Obx(
              () => Expanded(
                child: controller.searchingMovieList.value == null
                    ? const Center(
                        child: Text(
                          "No Results",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller
                                .searchingMovieList.value?.results?.length ??
                            0,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var data = controller
                              .searchingMovieList.value!.results![index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 120,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(10),
                                    shadowColor: Colors.black,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        "https://image.tmdb.org/t/p/w300/${data.posterPath}",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                data.title!,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              data.originalLanguage!,
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(height: ),
                                        Expanded(
                                          child: Text(
                                            data.overview!,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black38),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
