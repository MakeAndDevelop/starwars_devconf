import 'package:json_annotation/json_annotation.dart';

import 'film_dto.dart';

part 'film_response.g.dart';

@JsonSerializable()
class FilmResponse {
  final int count;
  final List<FilmDto> results;

  const FilmResponse({
    required this.count,
    required this.results,
  });

  factory FilmResponse.fromJson(Map<String, dynamic> json) => _$FilmResponseFromJson(json);
}
