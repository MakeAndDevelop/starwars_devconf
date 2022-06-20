import '../../common/enums/star_wars_entity.dart';

class ImageUtility {
  static const _urlPrefix = 'https://starwars-visualguide.com/assets/img';

  static String film(String filmId) {
    return '$_urlPrefix/films/$filmId.jpg';
  }

  static String character(String characterId) {
    return '$_urlPrefix/characters/$characterId.jpg';
  }

  static String starship(String starshipId) {
    return '$_urlPrefix/starships/$starshipId.jpg';
  }

  static String planets(String planetId) {
    return '$_urlPrefix/planets/$planetId.jpg';
  }

  static String species(String speciesId) {
    return '$_urlPrefix/species/$speciesId.jpg';
  }

  static String vehicle(String speciesId) {
    return '$_urlPrefix/vehicle/$speciesId.jpg';
  }

  static String imageFor(String id, StarWarsType type) {
    switch (type) {
      case StarWarsType.film:
        return film(id);
      case StarWarsType.character:
        return character(id);
      case StarWarsType.starship:
        return starship(id);
      case StarWarsType.species:
        return species(id);
      case StarWarsType.planets:
        return planets(id);
      case StarWarsType.vehicle:
        return vehicle(id);
    }
  }
}
