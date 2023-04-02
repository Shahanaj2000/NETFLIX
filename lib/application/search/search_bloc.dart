import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix/domain/search/search_service.dart';




part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  //! Access the obj
  final IDownloadsRepo _downloadsSevices;
  final SerchServices _serchServices;
  
  //var moieQuery;

  SearchBloc(
    this._downloadsSevices,
    this._serchServices,
  ) : super(SearchState.initial()) {
    //IDLE Search state
    on<Initialize>((event, emit) async {
      if (state.idle.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idle: state.idle,
          isLoading: false,
          isError: false,
        ));
        return;
      }

      //!
      emit(
        const SearchState(
          searchResultList: [],
          idle: [],
          isLoading: true,
          isError: false,
        ),
      );

      //! get trending
      final _result = await _downloadsSevices.getDownloadImages();

      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idle: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idle: list,
            isLoading: false,
            isError: false,
          );
        },
      );

      //! show to UI
      emit(_state);
    });

    //Movie Search state
    on<SearchMovie>((event, emit) async {
      //! call search movie api
      emit(
        const SearchState(
          searchResultList: [],
          idle: [],
          isLoading: true,
          isError: false,
        ),
      );
      // ignore: no_leading_underscores_for_local_identifiers
      final _result = await _serchServices.searchMovies(movieQuery: moveQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idle: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp s) {
          return SearchState(
            searchResultList: s.results,
            idle: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      //! show to UI
      emit(_state);
    });
    
  }

  //get moveQuery => null;
}
