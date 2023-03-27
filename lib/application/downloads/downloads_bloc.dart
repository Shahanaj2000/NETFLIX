import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/Failures/main_failure.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';


@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadState> {
  //Obj for IDownloadRepo
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadState.inital()) {
    //! Event (_GetDownloadsImage)
    on<_GetDownloadsImage>((event, emit) async {
      //
      emit(
        state.copyWith(
          isLoading: true, // API Call Started
          downloadsFailuresOrSuccessOption: none(),
        ),
      );
      //API call (Future Calling)
      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadImages();

      print(downloadsOption.toString());   
      
      //Folding API Calls
      emit(
        downloadsOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadsFailuresOrSuccessOption: some(Left(failure),),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloads: success, //! Takes the poster_path value -> fetching data with looping
            downloadsFailuresOrSuccessOption: some(Right(success),),
          ),
        ),
      );
    });
  }
}
