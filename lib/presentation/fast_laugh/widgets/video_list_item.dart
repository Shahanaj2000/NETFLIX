import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index; // To display seperate color
  const VideoListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        //! But
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    //color: Colors.black,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_sharp,
                    ),
                  ),
                ),

                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg'),
                        radius: 30,
                      ),
                    ),
                    VideoActionIcon(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionIcon(icon: Icons.add, title: 'My List'),
                    VideoActionIcon(icon: Icons.share, title: 'Share'),
                    VideoActionIcon(icon: Icons.play_arrow, title: 'Play'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//!  Icon Actions
class VideoActionIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionIcon({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: kWhiteColor, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
