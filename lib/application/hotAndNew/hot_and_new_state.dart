part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotNewData> comingSoonList,
    required List<HotNewData> everyOnesWatchingList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        everyOnesWatchingList: [],
        isLoading: false,
        isError: false, 
      );
}
