import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie/app/routes/app_pages.dart';

class MovieBannerList extends StatelessWidget {
  const MovieBannerList({
    super.key,
    required this.cases,
    required this.index,
    required this.posterPath,
    required this.id,
    required this.doubleFavTap,
  });

  // final Size size;
  final int cases;
  final int index;
  final int id;
  final String? posterPath;
  final VoidCallback doubleFavTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: 10, bottom: 10),
      child: SizedBox(
        height: size.height * .4,
        width: 130,
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.MOVIE_DETAIL,
                arguments: {"id": id, "cases": cases});
          },
          onDoubleTap: doubleFavTap,
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            height: size.height * .4,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: posterPath == null
                    ? const AssetImage("assets/icons/404-error.png")
                    : NetworkImage(
                        'https://image.tmdb.org/t/p/w300${posterPath}',
                      ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topRight,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
