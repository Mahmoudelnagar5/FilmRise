import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name;
  final String character;
  final String? profilePath;

  const Cast({
    required this.name,
    required this.character,
    this.profilePath,
  });

  @override
  List<Object?> get props => [name, character, profilePath];
}
