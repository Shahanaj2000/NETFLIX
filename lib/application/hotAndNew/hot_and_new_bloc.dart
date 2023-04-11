import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/hotnew/hot_and_new_services.dart';
import 'package:netflix/domain/hotnew/model/hot.new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices _hotAndNewServices;
  HotAndNewBloc(this._hotAndNewServices) : super(HotAndNewState.initial()) {
    //GET HOT&NEW MOVIE DATA
    on<LoadDataInComingSoon>((event, emit) async {
      // TODO: implement event handler
      // Send loading to UI
      emit(const HotAndNewState(
        comingSoonList: [],
        everyOnesWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //Get Data From Remote
      final _result = await _hotAndNewServices.getHotAndNewMovieData();

      //Data To State
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: resp.results,
            everyOnesWatchingList: state.everyOnesWatchingList,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
      
    });

    //GET HOT&NEW TV  DATA
    on<LoadDataInEveryOnesWayching>((event, emit) async{
      // TODO: implement event handler
      // Send loading to UI
      emit(const HotAndNewState(
        comingSoonList: [],
        everyOnesWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //Get Data From Remote
      final _result = await _hotAndNewServices.getHotAndNewTvData();

      //Data To State
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            comingSoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            comingSoonList: state.comingSoonList,
            everyOnesWatchingList: resp.results,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
