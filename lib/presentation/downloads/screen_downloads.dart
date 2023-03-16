import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/kuf6dutpsT0vSVehic3EZIqkOBt.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    //! MediaQuery
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              kWidth,
              Icon(Icons.settings, color: kWhiteColor),
              kWidth,
              Text("Smart Downloads")
            ],
          ),

          //!
          const Text("Indroducing Downloads for you"),
          const Text(
              "We will download a personalised selection of movies and shows for you, so there is always something to watch on your device."),

          //! To show Poster
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.38,
                ),
                //! To Display images in stack CA
                DownloadImageWidget(
                  margin: const EdgeInsets.only(left: 130, bottom: 50),
                  imageList: imageList[0],
                  angle: 20,
                  size: Size(size.width * 0.4, size.height * 0.58),
                ),

                DownloadImageWidget(
                  margin: const EdgeInsets.only(right: 130, bottom: 50),
                  imageList: imageList[1],
                  angle: -20,
                  size: Size(size.width * 0.4, size.height * 0.58),
                ),

                DownloadImageWidget(
                  margin: const EdgeInsets.only(bottom: 12),
                  imageList: imageList[2],
                  size: Size(size.width * 0.45, size.height * 0.65),
                  //radius: 30,
                ),
              ],
            ),
          ),
          //! Material Button
          MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),

          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            child: const Text(
              "See what you cann download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
    this.angle = 0,
    this.radius = 10,
    required this.margin,
    required this.size,
    required this.imageList,
  });

  //! To rotate images in CA
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        // width: size.width * 0.4,
        // height: size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
