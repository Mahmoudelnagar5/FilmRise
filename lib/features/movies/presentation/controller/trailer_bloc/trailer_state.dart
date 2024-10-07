part of 'trailer_bloc.dart';

sealed class TrailerState extends Equatable {
  const TrailerState();

  @override
  List<Object> get props => [];
}

final class TrailerInitial extends TrailerState {}

final class TrailerLoading extends TrailerState {}

final class TrailerLoaded extends TrailerState {
  final Trailer trailer;

  const TrailerLoaded(this.trailer);

  @override
  List<Object> get props => [trailer];
}

final class TrailerError extends TrailerState {
  final String errMessage;

  const TrailerError(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
