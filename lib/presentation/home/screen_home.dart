import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.isError) {
                      return const Center(
                        child: Text(
                          "Error while getting data",
                          style: TextStyle(color: kWhiteColor),
                        ),
                      );
                    } else {
                      //releasePastYear
                      final  _releasePastYear =
                          state.pastYearMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _releasePastYear.shuffle();

                      //trending
                      final _trending = state.trendingMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _trending.shuffle();

                      //tenseDramas
                      
                      final _tenseDramas = state.tenseDramasMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _tenseDramas.shuffle();


                      //southIndian
                      
                      final _southIndian = state.southIndianMovieList.map((m) {
                        return '$imageAppendUrl${m.posterPath}';
                      }).toList();
                      _southIndian.shuffle();


                      return ListView(
                        children: [
                          const BackgroundCard(),
                          kHeight,
                          MainTitleCard(
                            title: 'Release in the past year',
                            posterList: _releasePastYear.sublist(0, 10),
                            
                          ),
                          kHPHeight,
                          MainTitleCard(
                            title: 'Trending Now',
                            posterList: _trending.sublist(0, 10),
                          ),
                          kHPHeight,
                          NumberTitleCard(),
                          kHPHeight,
                          MainTitleCard(
                            title: 'Tense Drams',
                            posterList: _tenseDramas.sublist(0,10),
                          ),
                          kHPHeight,
                          MainTitleCard(
                            title: 'South Indian Cinema',
                            posterList: _southIndian.sublist(0,10),
                          ),
                          kHPHeight,
                        ],
                      );
                    }
                  },
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
                                Text(
                                  "TV Shows",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Movies",
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  "Categories",
                                  style: kHomeTitleText,
                                )
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
