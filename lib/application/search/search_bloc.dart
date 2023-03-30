import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
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

  SearchBloc(this._downloadsSevices, this._serchServices,) : super(SearchState.initial()) {
    //IDLE Search state
    on<SearchEvent>((event, emit) {
     //! get trending
      _downloadsSevices.getDownloadImages();
     //! show to UI
    });

    //Movie Search state
    on<SearchEvent>((event, emit) {
     //! call search movie api
      _serchServices.searchMovies(movieQuery: movieQuery);
     //! show to UI
    });
  }
}
