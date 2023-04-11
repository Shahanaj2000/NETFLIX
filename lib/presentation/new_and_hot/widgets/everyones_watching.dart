import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryonesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatching({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
           Text(
            movieName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
           Text(
            description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: kGreyColor,
            ),
          ),
          kNewHot,
             VideoWidget(url: posterPath,),
          kHPHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomIconWidget(
                icon: Icons.share,
                title: 'Share',
                iconSize: 25,
                iconText: 16,
              ),
              kWidth,
              CustomIconWidget(
                icon: Icons.add,
                title: 'My List',
                iconSize: 25,
                iconText: 16,
              ),
              kWidth,
              CustomIconWidget(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 25,
                iconText: 16,
              ),
              kWidth,
            ],
          ),
        ],
      ),
    );
  }
}
