import '../../domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({
    required super.name,
    required super.character,
    super.profilePath,
  });
  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        name: json['name'],
        character: json['character'],
        profilePath: json['profile_path'] ?? '/tEXsLuN0w1aaosb4kzf5DwT7rok.jpg',
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'character': character,
        'profile_path': profilePath,
      };
}
