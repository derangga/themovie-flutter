import '../../core/base/api_state.dart';

class SearchSuggestionState {
  final List<String> suggestSearchName;
  final ApiState apiState;

  SearchSuggestionState({
    this.suggestSearchName = const [],
    this.apiState = ApiState.LOADING,
  });

  SearchSuggestionState copyWith(
      {List<String>? suggestSearchName, ApiState? apiState}) {
    return SearchSuggestionState(
      suggestSearchName: suggestSearchName ?? this.suggestSearchName,
      apiState: apiState ?? this.apiState,
    );
  }
}
