import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class CustomIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomIconWidget({
    super.key,
    required this.icon, 
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}