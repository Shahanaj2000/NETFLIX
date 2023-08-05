part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idle,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  //! Initial case make it all are empty
  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idle: [],
        isLoading: false,
        isError: false,
      );
}
