part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotNewData> pastYearMovieList,
    required List<HotNewData> trendingMovieList,
    required List<HotNewData> tenseDramasMovieList,
    required List<HotNewData> southIndianMovieList,
    required List<HotNewData> trendingTvList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
    stateId: '0',
        pastYearMovieList: [],
        trendingMovieList: [],
        tenseDramasMovieList: [],
        southIndianMovieList: [],
        trendingTvList: [],
        isLoading: false,
        isError: false,
      );
}
