part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchMovies extends SearchEvent {
  final String query;

  const GetSearchMovies(this.query);

  @override
  List<Object> get props => [query];
}
