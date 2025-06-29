
class KeywordModel {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  KeywordModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  factory KeywordModel.fromJson(Map<String, dynamic> json) => KeywordModel(
    adult: json["adult"] ?? false,
    backdropPath: json["backdrop_path"] ?? '',
    genreIds: json["genre_ids"] != null
        ? List<int>.from(json["genre_ids"].map((x) => x))
        : [],
    id: json["id"] ?? 0,
    originalLanguage: json["original_language"] ?? '',
    originalTitle: json["original_title"] ?? '',
    overview: json["overview"] ?? '',
    popularity: (json["popularity"] ?? 0).toDouble(),
    posterPath: json["poster_path"] ?? '',
    releaseDate: json["release_date"] != null && json["release_date"] != ''
        ? DateTime.tryParse(json["release_date"]) ?? DateTime(1900)
        : DateTime(1900),
    title: json["title"] ?? '',
    video: json["video"] ?? false,
    voteAverage: (json["vote_average"] ?? 0).toDouble(),
    voteCount: json["vote_count"] ?? 0,
  );


  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}
