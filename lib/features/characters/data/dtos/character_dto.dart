import 'package:json_annotation/json_annotation.dart';

part 'character_dto.g.dart';

@JsonSerializable()
class CharacterDto {
  CharacterDto({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.films,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String name;
  final String height;
  final String mass;
  @JsonKey(name: 'hair_color')
  final String hairColor;
  @JsonKey(name: 'skin_color')
  final String skinColor;
  @JsonKey(name: 'eye_color')
  final String eyeColor;
  @JsonKey(name: 'birth_year')
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory CharacterDto.fromJson(Map<String, dynamic> json) => _$CharacterDtoFromJson(json);
}
