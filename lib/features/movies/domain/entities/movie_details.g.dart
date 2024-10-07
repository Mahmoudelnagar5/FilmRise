// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsAdapter extends TypeAdapter<MovieDetails> {
  @override
  final int typeId = 0;

  @override
  MovieDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetails(
      backdropPath: fields[0] as String,
      id: fields[1] as int,
      overview: fields[2] as String,
      posterPath: fields[3] as String,
      releaseDate: fields[4] as String,
      runtime: fields[5] as int,
      status: fields[6] as String,
      title: fields[7] as String,
      voteAverage: fields[8] as double,
      voteCount: fields[9] as int,
      genres: [],
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetails obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.runtime)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.title)
      ..writeByte(8)
      ..write(obj.voteAverage)
      ..writeByte(9)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
