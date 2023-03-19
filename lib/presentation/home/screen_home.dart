import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';

import 'package:netflix/presentation/home/widgets/main_title_card.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';

//! To check cond for scrollDir
ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, index, _) {
          return NotificationListener<UserScrollNotification>(
            // To detect thet ScrollDirection
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              print(direction);
              //!
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCard(),
                    kHeight,
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
                //! Hide part
                scrollNotifier.value == true ? Container(
                  height: 60,
                  color: Colors.red,
                ) : kHeight,
              ],
            ),
            
          );
        },
      ),
    );
  }
}
