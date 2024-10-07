part of 'trailer_bloc.dart';

sealed class TrailerEvent extends Equatable {
  const TrailerEvent();

  @override
  List<Object> get props => [];
}

class GetTrailerEvent extends TrailerEvent {
  final int movieId;

  const GetTrailerEvent(this.movieId);
}
