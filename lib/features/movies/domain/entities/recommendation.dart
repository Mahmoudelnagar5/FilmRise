import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? posterPath;
  final int id;

  const Recommendation({
    this.posterPath,
    required this.id,
  });

  @override
  List<Object?> get props => [posterPath, id];
}
