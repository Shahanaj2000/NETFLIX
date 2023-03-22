import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class CustomIconWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double iconText;
  
  const CustomIconWidget({
    super.key,
    required this.icon, 
    required this.title,
    this.iconSize = 30,
    this.iconText = 18,
    
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(fontSize: iconText, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}