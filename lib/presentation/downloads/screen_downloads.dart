import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  //!
  final _widgetList = [
    kHeight,
    const _smartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) => _widgetList[index],
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 20,
        ),
        itemCount: _widgetList.length,
      ),
    );
  }
}

//! section2 -> Aim is to use spacing b/w both
class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    //! API calling
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
    // });
    BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImage());
    //! MediaQuery
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //!
        const Text(
          "Indroducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        kHeight,

        //! To show Poster
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          radius: size.width * 0.4,
                        ),
                        //! To Display images in stack CA
                        DownloadImageWidget(
                          margin: const EdgeInsets.only(left: 130, bottom: 50),
                          imageList:
                              '$imageAppendUrl${state.downloads[0].posterPath}',
                          angle: 20,
                          size: Size(size.width * 0.4, size.height * 0.58),
                        ),

                        DownloadImageWidget(
                          margin: const EdgeInsets.only(right: 130, bottom: 50),
                          imageList:
                              '$imageAppendUrl${state.downloads[1].posterPath}',
                          angle: -20,
                          size: Size(size.width * 0.4, size.height * 0.58),
                        ),

                        DownloadImageWidget(
                          margin: const EdgeInsets.only(bottom: 14),
                          imageList:
                              '$imageAppendUrl${state.downloads[2].posterPath}',
                          size: Size(size.width * 0.45, size.height * 0.65),
                          radius: 8,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

//! section3
class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Material Button
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
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
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(Icons.settings, color: kWhiteColor),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          // width: size.width * 0.4,
          // height: size.width * 0.58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
