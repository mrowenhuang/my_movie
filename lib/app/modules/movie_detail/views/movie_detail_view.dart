import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/models/movie_model.dart';
import 'package:my_movie/app/data/theme/color.dart';

import '../controllers/movie_detail_controller.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final movieC = Get.find<MyMovieController>();
    final _bigScrollController = ScrollController();
    final _smallScrollController = ScrollController();
    final Movie detailData = movieC.findMovieDetail(Get.arguments);
    return Scaffold(
      backgroundColor: MyColor.hightlightDarkest,
      appBar: AppBar(
        title: const Text('Movie Detail'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constrain) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                // Text(detailData.title!),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: constrain.maxWidth * .8,
                    height: constrain.maxHeight * .8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: constrain.maxWidth * .3,
                          height: constrain.maxHeight * .28,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  detailData.originalLanguage!,
                                ),
                              ),
                              Text(
                                detailData.title!,
                                textAlign: TextAlign.end,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  detailData.releaseDate!,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Genre",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Expanded(
                                child: Scrollbar(
                                  controller: _smallScrollController,
                                  scrollbarOrientation:
                                      ScrollbarOrientation.left,
                                  thumbVisibility: true,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    controller: _smallScrollController,
                                    itemCount: detailData.genreIds!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        detailData.genreIds![index],
                                        textAlign: TextAlign.end,
                                        style: TextStyle(),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Movie Overview : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Scrollbar(
                            scrollbarOrientation: ScrollbarOrientation.left,
                            controller: _bigScrollController,
                            thumbVisibility: true,
                            child: ListView(
                              controller: _bigScrollController,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                Text(
                                  detailData.overview!,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Material(
                    elevation: 20,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: constrain.maxHeight * .42,
                            width: constrain.maxWidth * .53,
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w780/${detailData.posterPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                // Row(
                //   children: [
                //
                //   ],
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
