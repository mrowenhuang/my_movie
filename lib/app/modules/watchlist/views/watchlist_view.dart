import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:my_movie/app/widgets/list_container.dart';

import '../controllers/watchlist_controller.dart';

class WatchlistView extends GetView<WatchlistController> {
  const WatchlistView({super.key});
  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MyMovieController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            MyColor.hightlightLight.withOpacity(.7),
            MyColor.hightlightDarkest
          ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("Watchlist"),
            ),
            body: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: movieC.watchList.length,
                      padding: EdgeInsets.all(20),
                      itemBuilder: (context, index) {
                        var data = movieC.watchList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Dismissible(
                            key: Key(data!.id.toString()),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              // print(direction);
                              movieC.removefromWatchList(data);
                            },
                            child: GestureDetector(
                              onTap: () {},
                              child: ListContainer(
                                containerHeight: 130,
                                posterPath: data.posterPath!,
                                title: data.title,
                                overView: data.overview,
                                customText: "Schedule : ${data.description}",
                                // customText: data.description,
                              ),
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
        );
      },
    );
  }
}
