import 'package:flimrize/features/movies/domain/entities/trailer.dart';

class TrailerModel extends Trailer {
  const TrailerModel({
    required super.key,
  });

  factory TrailerModel.fromJson(Map<String, dynamic> json) {
    return TrailerModel(
      key: json['key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
    };
  }
}
