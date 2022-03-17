class Film {
  final String id;
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;

  Film({
    required this.id,
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });
}
