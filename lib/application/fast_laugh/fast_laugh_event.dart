part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  //!Like
  const factory FastLaughEvent.likeVideo({
    required int id,
  }) = LikeVideo;
  //!Unlike
  const factory FastLaughEvent.unlikeVideo({
    required int id,
  }) = UnlikeVideo;
}
