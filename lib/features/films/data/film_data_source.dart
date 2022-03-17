import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/constants/endpoints.dart';
import '../../../common/mappers/mapper.dart';
import '../../../common/utils/network_utilities.dart';
import '../films.dart';
import 'dtos/film_response.dart';

@Injectable()
class FilmDataSource {
  final Mapper<FilmDto, Film> _mapper;

  FilmDataSource(this._mapper);

  Future<List<Film>?> getFilms() async {
    final response = await Dio().get<Map<String, dynamic>>(Endpoints.films);

    if (response.success && response.data != null) {
      final filmResponse = FilmResponse.fromJson(response.data!);
      return filmResponse.results
          .map(
            (source) => _mapper.mapToDestination(source),
          )
          .toList();
    }

    return null;
  }
}
