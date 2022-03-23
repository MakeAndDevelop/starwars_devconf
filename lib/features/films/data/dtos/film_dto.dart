class FilmDto {
  const FilmDto({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });

  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory FilmDto.fromJson(Map<String, dynamic> json) => FilmDto(
        title: json['title'] as String,
        episodeId: json['episode_id'] as int,
        openingCrawl: json['opening_crawl'] as String,
        director: json['director'] as String,
        producer: json['producer'] as String,
        releaseDate: DateTime.parse(json['release_date'] as String),
        characters: (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
        planets: (json['planets'] as List<dynamic>).map((e) => e as String).toList(),
        starships: (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
        vehicles: (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
        species: (json['species'] as List<dynamic>).map((e) => e as String).toList(),
        created: DateTime.parse(json['created'] as String),
        edited: DateTime.parse(json['edited'] as String),
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'episode_id': episodeId,
        'opening_crawl': openingCrawl,
        'director': director,
        'producer': producer,
        'release_date': releaseDate.toIso8601String(),
        'characters': characters,
        'planets': planets,
        'starships': starships,
        'vehicles': vehicles,
        'species': species,
        'created': created.toIso8601String(),
        'edited': edited.toIso8601String(),
        'url': url,
      };
}
