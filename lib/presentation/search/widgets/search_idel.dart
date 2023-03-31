import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../../core/colors.dart';



class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kLVSHeight,
        //const TopSearcheItemTile(),

        //! takes max size
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if(state.isLoading) {
                return const Center(child: CircularProgressIndicator(),);
              }
              else if(state.isError) {
                return const Center(child: Text("Error while getting data"),);
              }
              else if(state.idle.isEmpty) {
                return const Center(child: Text("List is empty"),);
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final movie = state.idle[index];
                  return TopSearcheItemTile(title: movie.title??'Not title provider', imageUrl: '$imageAppendUrl${movie.posterPath}');
                },
                separatorBuilder: (ctx, index) => kLVSHeight,
                itemCount: state.idle.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearcheItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearcheItemTile({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 68,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kLVSWidth,
        //!
         Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: kWhiteColor),
          ),
        ),

        //! Play Button or Icon
        //const Icon(Icons.play_circle_filled, color: kWhiteColor, size: 50,) white -> black we want black white
        InkWell(
          onTap: () {},
          child: const CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 27,
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 25,
              child: Icon(
                Icons.play_circle_fill,
                color: kWhiteColor,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
