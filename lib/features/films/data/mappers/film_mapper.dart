import 'package:injectable/injectable.dart';

import '../../../../common/constants/endpoints.dart';
import '../../../../common/mappers/mapper.dart';
import '../../films.dart';

@Injectable(as: Mapper<FilmDto, Film>)
class FilmMapper implements Mapper<FilmDto, Film> {
  @override
  Film mapToDestination(FilmDto source) {
    return Film(
      id: source.url.replaceAll(Endpoints.films, '').replaceAll('/', ''),
      openingCrawl: source.openingCrawl,
      director: source.director,
      releaseDate: source.releaseDate,
      producer: source.producer,
      episodeId: source.episodeId,
      title: source.title,
      characters: source.characters
          .map(
            (c) => c.replaceAll(Endpoints.people, '').replaceAll('/', ''),
          )
          .toList(),
    );
  }

  @override
  FilmDto mapToSource(Film destination) {
    throw UnimplementedError();
  }
}
