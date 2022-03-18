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
      starships: _mapToIds(source.starships, Endpoints.starships),
      characters: _mapToIds(source.characters, Endpoints.characters),
      planets: _mapToIds(source.planets, Endpoints.planets),
      vehicles: _mapToIds(source.vehicles, Endpoints.vehicles),
      species: _mapToIds(source.species, Endpoints.species),
    );
  }

  @override
  FilmDto mapToSource(Film destination) {
    throw UnimplementedError();
  }

  List<String> _mapToIds(List<String> source, String prefix) {
    return source.map((c) => c.replaceAll(prefix, '').replaceAll('/', '')).toList();
  }
}
