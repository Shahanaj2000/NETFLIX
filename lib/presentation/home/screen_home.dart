import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';

import 'package:netflix/presentation/home/widgets/main_title_card.dart';

import 'package:netflix/presentation/home/widgets/number_title_card.dart';

//! To check cond for scrollDir
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

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
                scrollNotifier.value == true
                    ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                        height: 90,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  "https://duet-cdn.vox-cdn.com/thumbor/0x0:3151x2048/640x427/filters:focal(1575x1024:1576x1025):format(webp)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                  width: 60,
                                  height: 60,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  color: kWhiteColor,
                                  size: 30,
                                ),
                                kWidth,
                                Container(
                                  color: Colors.blue,
                                  height: 30,
                                  width: 30,
                                ),
                                kWidth,
                              ],
                            ),
                            //!
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TV Shows", style: kHomeTitleText,),
                                Text("Movies", style: kHomeTitleText,),
                                Text("Categories", style: kHomeTitleText,)
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
