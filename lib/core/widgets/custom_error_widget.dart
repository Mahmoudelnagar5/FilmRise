import 'package:flimrize/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: AppStyles.styleSemiBold16,
        textAlign: TextAlign.center,
      ),
    );
  }
}
