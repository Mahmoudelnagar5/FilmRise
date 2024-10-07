import 'package:flutter/material.dart';

class MovieDetailsBar extends StatelessWidget {
  const MovieDetailsBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 28,
        weight: 800,
      ),
    );
  }
}
