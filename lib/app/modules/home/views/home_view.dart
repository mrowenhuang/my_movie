import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/controller/my_movie_controller.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_movie/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movieC = Get.find<MyMovieController>();
    return Scaffold(
      backgroundColor: MyColor.hightlightDarkest,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  controller.trendingMovieList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CarouselSlider(
                          items: List.generate(
                            5,
                            (index) {
                              return Image.network(
                                // ignore: invalid_use_of_protected_member
                                'https://image.tmdb.org/t/p/w780${controller.trendingMovieList.value[index].posterPath}',
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
                        itemCount: controller.trendingMovieList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Container(
                              padding: EdgeInsets.only(right: 20),
                              height: size.height * .4,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w300${controller.trendingMovieList[index].posterPath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              alignment: Alignment.bottomRight,
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
                            const Text(
                              'Country / Year',
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
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
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
                        itemCount: controller.topRatedMovieList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10, bottom: 10),
                            child: SizedBox(
                              height: size.height * .4,
                              width: 130,
                              child: Container(
                                padding: EdgeInsets.only(right: 20),
                                height: size.height * .4,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w300${controller.topRatedMovieList[index].posterPath}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                alignment: Alignment.topRight,
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
