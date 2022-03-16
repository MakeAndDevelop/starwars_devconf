// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwapiFilmsDto _$SwapiFilmsDtoFromJson(Map<String, dynamic> json) => SwapiFilmsDto(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>).map((e) => FilmDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$SwapiFilmsDtoToJson(SwapiFilmsDto instance) => <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };
