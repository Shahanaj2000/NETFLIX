part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
    required List<Downloads> videoList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  //! Initial State
  factory FastLaughState.initial() {
    return const  FastLaughState(
      videoList: [],
      isLoading: true,
      isError: false,
    );
  }
}
