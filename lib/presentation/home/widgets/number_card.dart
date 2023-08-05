import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
    required this.imageUrl,
  });
//! To display the numbers
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: kRadis10,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -20,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 10.0,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                decorationColor: Colors.black,
                fontSize: 140,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
