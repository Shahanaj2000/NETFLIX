import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/hotAndNew/hot_and_new_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';
import 'package:intl/intl.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(93),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 10, top: 7),
              isScrollable: true,
              labelColor: kBlackColor,
              unselectedLabelColor: kWhiteColor,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator:
                  BoxDecoration(color: kWhiteColor, borderRadius: kRadis30),
              tabs: const [
                Tab(
                  text: 'Comming Soon',
                ),
                Tab(
                  text: "Everyone's Watching",
                ),
              ],
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            const  ComingSoonList(key: Key('coming_soon'),),
            
             _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  //! ComingSoon Widget
  // Widget _buildComingSoon() {
  //   return ListView.separated(
  //     itemBuilder: (BuildContext context, index) {
  //       // return const ComingSoonWidget();
  //     },
  //     separatorBuilder: (BuildContext context, int index) {
  //       return kHeight;
  //     },
  //     itemCount: 10,
  //   );
  // }

  //! Everyone's Watching
  Widget _buildEveryonesWatching() {
    return ListView.separated(
      itemBuilder: (context, index) {
        //return const EveryonesWatching();
      },
      separatorBuilder: (context, index) {
        return kHeight;
      },
      itemCount: 10,
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    },);
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Error while loading comingSoon list'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('comingSoon list is empty'),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];

              if (movie.id == null) {
                return const SizedBox();
              }
              print(movie.releaseDate.toString());
              String month = '';
              String date  = '';
              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formatedDate =  DateFormat.yMMMMd('en_US').format(_date!);
                print(formatedDate.toString());
                month = formatedDate.split(' ').first.substring(0, 3).toUpperCase();
                date = movie.releaseDate!.split('-')[1];
              } catch (_) {
                month = ''; 
                date = '';
              }
              
              
              
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: month,
                day: date,
                posterPath: '$imageAppendUrl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'No title',
                description: movie.overview ?? 'No description',
              );
            },
            separatorBuilder: (context, index) {
              return kHeight;
            },
            itemCount: state.comingSoonList.length,
          );
        }
      },
    );
  }
}
