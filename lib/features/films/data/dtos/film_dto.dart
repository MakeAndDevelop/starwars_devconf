import 'package:json_annotation/json_annotation.dart';

part 'film_dto.g.dart';

@JsonSerializable()
class FilmDto {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final DateTime created;
  final DateTime edited;
  final String url;

  const FilmDto({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory FilmDto.fromJson(Map<String, dynamic> json) => _$FilmDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FilmDtoToJson(this);
}
