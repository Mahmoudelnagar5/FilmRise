import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/trailer.dart';
import '../../../domain/usecases/get_trailer_use_case.dart';

part 'trailer_event.dart';
part 'trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState> {
  final GetTrailerUseCase getTrailerUseCase;
  TrailerBloc(this.getTrailerUseCase) : super(TrailerInitial()) {
    on<GetTrailerEvent>(_getTrailer);
  }

  FutureOr<void> _getTrailer(
      GetTrailerEvent event, Emitter<TrailerState> emit) async {
    emit(TrailerLoading());
    final result = await getTrailerUseCase(event.movieId);
    return emit(
      result.fold(
        (failure) => TrailerError(
          failure.errMessage,
        ),
        (trailer) => TrailerLoaded(
          trailer,
        ),
      ),
    );
  }
}
