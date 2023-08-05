import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/hotnew/hot_and_new_services.dart';
import 'package:netflix/domain/hotnew/model/hot.new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices _homeServices;
  HomeBloc(this._homeServices) : super(HomeState.initial()) {
    /* 
    on event getHomeScreenData 
    */
    on<GetHomeScreenData>((event, emit) async {
      //send Loading to UI

      emit(state.copyWith(isLoading: true, isError: false));

      //get Data
      final _movieResult = await _homeServices.getHotAndNewMovieData();
      final _tvResult = await _homeServices.getHotAndNewTvData();

      //transform Data
      final _state1 = _movieResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramasMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            isError: false,
          );
        },
      );
      // send to UI
      emit(_state1);

     final _state2 =  _tvResult.fold(
        (MainFailure failure) {
          return  HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList ,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            isError: false,
          );
        },
      );

      //send to UI
      emit(_state2);

    });
  }
}
