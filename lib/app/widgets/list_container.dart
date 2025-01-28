import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key,
    required this.containerHeight,
    this.title = "",
    required this.posterPath,
    this.overView = "",
    this.customText = "",
    this.oriLanguage = "",
  });

  final double containerHeight;
  final String? title;
  final String? posterPath;
  final String? overView;
  final String? customText;
  final String? oriLanguage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: containerHeight,
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
                child: posterPath == null
                    ? Image.asset("assets/icons/404-error.png")
                    : Image.network(
                        "https://image.tmdb.org/t/p/w300/$posterPath",
                      ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        oriLanguage!,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Text(
                      overView!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.black38),
                    ),
                  ),
                  Text(customText!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
