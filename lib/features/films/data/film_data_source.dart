import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../common/constants/endpoints.dart';
import '../../../common/mappers/mapper.dart';
import '../../../common/network/dio_extensions.dart';
import '../../../common/utils/network_utilities.dart';
import '../films.dart';

@Injectable()
class FilmDataSource {
  final Mapper<FilmDto, Film> _mapper;
  final Dio _httpClient;

  FilmDataSource(this._mapper, this._httpClient);

  Future<List<Film>?> getFilms() async {
    final response = await _httpClient.get<Map<String, dynamic>>(Endpoints.films);

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
