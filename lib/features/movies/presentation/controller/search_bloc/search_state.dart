part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;

  const SearchLoaded({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class SearchError extends SearchState {
  final String errMessage;

  const SearchError({
    required this.errMessage,
  });

  @override
  List<Object> get props => [errMessage];
}
