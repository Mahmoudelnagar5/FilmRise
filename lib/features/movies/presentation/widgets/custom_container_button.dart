import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    this.onPressed,
  });
  final IconData icon;
  final String text;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: color,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
        label: Text(
          text,
          style: AppStyles.styleMedium14.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
