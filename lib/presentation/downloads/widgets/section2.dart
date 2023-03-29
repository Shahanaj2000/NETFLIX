//! section2 -> Aim is to use spacing b/w both
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/downloads/widgets/download_image_widget.dart';

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
              child: state.isLoading ? const Center( child: CircularProgressIndicator()) : Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    radius: size.width * 0.4,
                  ),
                  //! To Display images in stack CA
                  DownloadImageWidget(
                    margin: const EdgeInsets.only(left: 130, bottom: 50),
                    imageList: '$imageAppendUrl${state.downloads![0].posterPath}',
                    
                    angle: 20,
                    size: Size(size.width * 0.4, size.height * 0.58),
                  ),
                  

                  DownloadImageWidget(
                    margin: const EdgeInsets.only(right: 130, bottom: 50),
                    imageList: '$imageAppendUrl${state.downloads?[1].posterPath}',
                    angle: -20,
                    size: Size(size.width * 0.4, size.height * 0.58),
                  ),

                  DownloadImageWidget(
                    margin: const EdgeInsets.only(bottom: 14),
                    imageList: '$imageAppendUrl${state.downloads?[2].posterPath}',
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