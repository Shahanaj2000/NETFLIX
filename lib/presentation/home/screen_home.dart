import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/home/widgets/main_title_card.dart';
import 'package:netflix/presentation/home/widgets/number_card.dart';
import 'package:netflix/presentation/home/widgets/number_title_card.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: const [
                 MainTitleCard(
                  title: 'Release in the past year',
                ),
                kHPHeight,
                 MainTitleCard(
                  title: 'Trending Now',
                ),
                kHPHeight,

                NumberTitleCard(),
                kHPHeight,

                 MainTitleCard(
                  title: 'Tense Drams',
                ),
                kHPHeight,
                 MainTitleCard(
                  title: 'South Indian Cinema',
                ),
                kHPHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}


