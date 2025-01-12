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
                Container(
                  color: Colors.red,
                  
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
              options: CarouselOptions(
                  autoPlay: true,
                  height: size.height * .5,
                  pauseAutoPlayOnTouch: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  // autoPlayAnimationDuration: const Duration(seconds: 5),
                  animateToClosest: true,
                  enlargeCenterPage: true),
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
                      contentPadding: EdgeInsets.all(20),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
