import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final String key;

  const Trailer({
    required this.key,
  });

  @override
  List<Object?> get props => [key];
}
