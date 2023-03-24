import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //! MediaQuery
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          //color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              kGVCHeight,
              //!
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "The Ritual Killer",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  //Spacer(),
                  Row(
                    children: const [
                      CustomIconWidget(
                        icon: Icons.notifications_none,
                        title: 'Remind Me',
                        iconSize: 25,
                        iconText: 13,
                      ),
                      kWidth,
                      CustomIconWidget(
                        icon: Icons.info_outline,
                        title: 'Info',
                        iconSize: 25,
                        iconText: 13,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              const Text("Coming On Friday"),
              kHPHeight,
              const Text(
                "The Ritual Killer 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              const Text(
                "A detective on the verge of retirement teams with a professor of African Studies to track down a serial killer who is performing the ancient black magic practice of Muti.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: kGreyColor,
                ),
              ),
              kHeight,
              
            ],
          ),
        ),
      ],
    );
  }
}

