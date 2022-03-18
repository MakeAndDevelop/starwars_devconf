class Film {
  final String id;
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<String> starships;
  final List<String> characters;
  final List<String> planets;
  final List<String> vehicles;
  final List<String> species;

  Film({
    required this.id,
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.starships,
    required this.characters,
    required this.planets,
    required this.vehicles,
    required this.species,
  });
}
