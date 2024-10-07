import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../utils/app_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.onChanged,
  });
  final void Function(String query)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: AppStyles.styleRegular16,
      decoration: InputDecoration(
        border: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        label: Text(
          "Search",
          style: AppStyles.styleRegular16,
        ),
      ),
    );
  }

  GradientOutlineInputBorder outlineInputBorder() {
    return const GradientOutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
        colors: [
          Colors.redAccent,
          Colors.grey,
        ],
      ),
      width: 2,
    );
  }
}
