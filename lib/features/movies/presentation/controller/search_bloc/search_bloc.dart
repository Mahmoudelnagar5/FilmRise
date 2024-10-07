import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flimrize/features/movies/domain/usecases/get_search_movies_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMoviesUseCase getSearchMoviesUseCase;
  SearchBloc(this.getSearchMoviesUseCase) : super(SearchInitial()) {
    on<GetSearchMovies>(_getSearchMovies);
  }

  FutureOr<void> _getSearchMovies(
      GetSearchMovies event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await getSearchMoviesUseCase(
      event.query,
    );
    return emit(
      result.fold(
        (failure) => SearchError(
          errMessage: failure.errMessage,
        ),
        (movies) => SearchLoaded(
          movies: movies,
        ),
      ),
    );
  }
}
