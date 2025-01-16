import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_movie/app/data/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.hightlightLight,
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
              ],
              options: CarouselOptions(
                autoPlay: true,
                height: size.height * .5,
                pauseAutoPlayOnTouch: true,
                autoPlayInterval: const Duration(seconds: 5),
                // autoPlayAnimationDuration: const Duration(seconds: 5),
                viewportFraction: .8,
                animateToClosest: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
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
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Movie >>',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: MyColor.hightlightDarkest,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .3,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: size.height * .4,
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
