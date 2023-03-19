import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
  });
//! To display the numbers
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              height: 250,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: kRadis15,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/wjqzKd664dRoOSZUFn12wzUuVNO.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 13,
            bottom: 0,
            child: BorderedText(
              strokeColor: Colors.black,
              strokeWidth: 10.0,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  decorationColor: Colors.black,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),),
      ],
    );
  }
}
