import 'package:injectable/injectable.dart';

import '../../../../common/constants/endpoints.dart';
import '../../../../common/mappers/mapper.dart';
import '../../models/character.dart';
import '../dtos/character_dto.dart';

@Injectable(as: Mapper<CharacterDto, Character>)
class CharacterMapper implements Mapper<CharacterDto, Character> {
  @override
  Character mapToDestination(CharacterDto source) {
    return Character(
        id: source.url.replaceAll(Endpoints.characters, '').replaceAll('/', ''),
        name: source.name,
        height: source.height,
        mass: source.mass,
        hairColor: source.hairColor,
        skinColor: source.skinColor,
        eyeColor: source.eyeColor,
        birthYear: source.birthYear,
        gender: source.gender,
        homeworld: source.homeworld,
        films: _mapToIds(source.films, Endpoints.films),
        species: _mapToIds(source.species, Endpoints.species),
        vehicles: _mapToIds(source.vehicles, Endpoints.vehicles),
        starships: _mapToIds(source.starships, Endpoints.starships),
        created: source.created,
        edited: source.edited);
  }

  @override
  CharacterDto mapToSource(Character destination) {
    throw UnimplementedError();
  }

  List<String> _mapToIds(List<String> source, String prefix) {
    return source.map((c) => c.replaceAll(prefix, '').replaceAll('/', '')).toList();
  }
}
