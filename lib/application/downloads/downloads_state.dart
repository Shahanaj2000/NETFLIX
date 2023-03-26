part of 'downloads_bloc.dart';

@freezed
class DownloadState with _$DownloadState {
  const factory DownloadState({
    required bool isLoading,
    List<Downloads>? downloads,
    required Option<Either<MainFailure, List<Downloads>>>
        downloadsFailuresOrSuccessOption,
  }) = _DownloadState;

  //!Inital State
  factory DownloadState.inital() {
    return const DownloadState(
      isLoading: false,
      downloadsFailuresOrSuccessOption: None(),
    );
  }
}
