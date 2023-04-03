import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

//!videos
final videoUrl = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    //!DownloadsServices
    IDownloadsRepo _downloadsServices,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //! sending loading to UI
      emit(
        const FastLaughState(
            videoList: [],
            isLoading: true,
            isError: false,
          )
      );
      //!  get trending movies
      final _result = await _downloadsServices.getDownloadImages();
      final _state = _result.fold(
        (l) {
          return const FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          );
        },
        (resp) {
          return FastLaughState(
            videoList: resp,
            isLoading: false,
            isError: false,
          );
        },
      );

      //! Show to UI
      emit(_state);
    });
  }
}
