import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(query: "", isChange: false));

  void search(String query) {
    state = state.copyWith(query: query);
  }

  void onChange(bool isChange) {
    state = state.copyWith(isChange: isChange);
  }
}

class SearchState {
  final String query;
  final bool isChange;

  SearchState({required this.query, required this.isChange});

  SearchState copyWith({String? query, bool? isChange}) {
    return SearchState(query: query ?? this.query, isChange: isChange ?? this.isChange);
  }
}
