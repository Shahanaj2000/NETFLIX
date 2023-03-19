import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 730,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(mainBackgroundImage),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomIconWidget(
                  icon: Icons.add,
                  title: 'My List',
                ),
                _playButton(),
                const CustomIconWidget(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//! Play Button
TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor)),
    icon: const Icon(
      Icons.play_arrow,
      size: 25,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Play',
        
        style: TextStyle(
          color: kBlackColor,
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
