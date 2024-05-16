// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
// import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

// class ScreenFastLaugh extends StatelessWidget {
//   const ScreenFastLaugh({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //!WidgetBinding
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
//     });
//     return Scaffold(
//       body: SafeArea(
//         child: BlocBuilder<FastLaughBloc, FastLaughState>(
//           builder: (context, state) {
//             //!Checking when we're calling APIs
//             if (state.isLoading) {
//               //!If Data is not fetching From APIs
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (state.isError) {
//               //print(state);
//               //! If the error comed
//               return const ScaffoldMessenger(
//                 child: SnackBar(
//                   content: Text('Internet Connection Filed!'),
//                 ),
//               );
//             } else if (state.videoList.isEmpty) {
//               //! If the videos are not there
//               return const ScaffoldMessenger(
//                 child: SnackBar(
//                   content: Text('Videos are not there!'),
//                 ),
//               );
//             } else {
//               //!Success Data
//               return PageView(
//                 scrollDirection: Axis.vertical,
//                 children: List.generate(
//                   state.videoList.length,
//                   (index) {
//                     return VideoListItemInheritedWidget(
//                         widget: VideoListItem(
//                             key: Key(index.toString()), index: index),
//                         movieData: state.videoList[index]);
//                   },
//                 ),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              // Displaying a snackbar for error messages
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Internet Connection Failed!'),
                  ),
                );
              });
              return const SizedBox.shrink(); // Return an empty widget temporarily
            } else if (state.videoList.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Videos are not available!'),
                  ),
                );
              });
              return const SizedBox.shrink(); // Return an empty widget temporarily
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) {
                    return VideoListItemInheritedWidget(
                      widget: VideoListItem(
                        key: Key(index.toString()),
                        index: index,
                      ),
                      movieData: state.videoList[index],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}


