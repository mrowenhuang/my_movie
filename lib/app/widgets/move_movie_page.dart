import 'package:flutter/material.dart';

class MoveMoviePage extends StatelessWidget {
  const MoveMoviePage({
    super.key,
    required this.nextPage,
    required this.backPage,
  });

  final VoidCallback nextPage;
  final VoidCallback backPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: backPage,
          padding: EdgeInsets.zero,
          splashRadius: 25,
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          splashRadius: 25,
          onPressed: nextPage,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
