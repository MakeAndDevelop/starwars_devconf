import 'package:dio/dio.dart';

import '../../../common/utils/network_utilities.dart';
import '../films.dart';
import 'dtos/film_response.dart';

class FilmDataSource {
  Future<List<Film>> getFilms() async {
    final response = await Dio().get<Map<String, dynamic>>('https://swapi.dev/api/films');

    if (response.success && response.data != null) {
      final filmResponse = SwapiFilmsDto.fromJson(response.data!);
      return filmResponse.results;
    }
  }
}
