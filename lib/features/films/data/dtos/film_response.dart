import 'package:json_annotation/json_annotation.dart';

import 'film_dto.dart';

part 'film_response.g.dart';

@JsonSerializable()
abstract class SwapiFilmsDto {
  final int count;
  final List<FilmDto> results;

  const SwapiFilmsDto({
    required this.count,
    required this.results,
  });

  factory SwapiFilmsDto.fromJson(Map<String, dynamic> json) => _$SwapiFilmsDtoFromJson(json);
}
