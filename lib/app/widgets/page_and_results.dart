import 'package:flutter/material.dart';

class PageAndResults extends StatelessWidget {
  const PageAndResults({
    super.key,
    required this.movieC,
    required this.activePage,
  });

  final dynamic movieC;
  final int activePage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        movieC == null ||
                movieC!.results!.isEmpty
            ? const SizedBox()
            : Text(
                "Page : $activePage / ${movieC?.totalPages}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
        Text(
          "Results : ${movieC?.totalResults ?? 0}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
