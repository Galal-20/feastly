import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/uaseCase.dart';
import 'SearchEvent.dart';
import 'SearchState.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    /*try {
      final response = await searchUseCase.search(event.query, event.filter);

      if (response.meals != null && response.meals!.isNotEmpty) {
        emit(SearchSuccess(response.meals!));
      } else {
        emit(SearchError("No meals found."));
      }
    } catch (e) {
      emit(SearchError("Something went wrong: $e"));
    }*/
    // Handles network errors separately
    try {
      final response = await searchUseCase.search(event.query, event.filter);
      if (response.meals != null && response.meals!.isNotEmpty) {
        emit(SearchSuccess(response.meals!));
      } else {
        emit(SearchError("No results found for '${event.query}'."));
      }
    } on DioException catch (e) {
      emit(SearchError("Network error: ${e.message}"));
    } catch (e) {
      emit(SearchError("Unexpected error occurred. Please try again."));
    }
  }

}
