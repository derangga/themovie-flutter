import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';

import '../../data/remote/source/search_remote_source.dart';
import 'search_suggestion_state.dart';

class SearchSuggestionBloc extends Cubit<SearchSuggestionState> {
  final SearchRemoteSource _searchRemoteSource;

  SearchSuggestionBloc(this._searchRemoteSource)
      : super(SearchSuggestionState());

  Future<void> fetchSuggestionSearchMovie(String query) async {
    final result = await _searchRemoteSource.searchMovie(query, 1);
    result.fold((failed) {
      emit(state.copyWith(apiState: ApiState.FAILED));
    }, (suggestionResponse) {
      final suggestNames = suggestionResponse.map((e) => e.title).toList();
      emit(state.copyWith(suggestSearchName: suggestNames));
    });
  }

  Future<void> fetchSuggestionSearchTvShow(String query) async {
    final result = await _searchRemoteSource.searchTvShow(query, 1);
    result.fold((failed) {
      emit(state.copyWith(apiState: ApiState.FAILED));
    }, (suggestionResponse) {
      final suggestNames = suggestionResponse
          .map(
            (e) => e.originalName,
          )
          .toList();
      emit(state.copyWith(suggestSearchName: suggestNames));
    });
  }

  void clearSearch() {
    emit(state.copyWith(suggestSearchName: []));
  }
}
