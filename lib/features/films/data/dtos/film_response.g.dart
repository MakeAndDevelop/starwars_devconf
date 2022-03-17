// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmResponse _$FilmResponseFromJson(Map<String, dynamic> json) => FilmResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>).map((e) => FilmDto.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$FilmResponseToJson(FilmResponse instance) => <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
