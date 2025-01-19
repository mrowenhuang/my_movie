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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            width: 100,
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
              onChanged: (value) {
                print(value);
              },
            ),
          ),
          Container(
            
            decoration: BoxDecoration(color: Colors.white),
            child: Icon(Icons.filter),
          ),
        ],
      ),
    );
  }
}
