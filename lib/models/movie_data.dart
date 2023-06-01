class MovieData {
  late bool adult;
  late String backdropPath;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;

  MovieData({
    required this.adult,
    required this.backdropPath,
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

  static MovieData getObjectFromJson(Map<String,dynamic> jsonData) {
    return MovieData(
      adult: jsonData['adult'],
      backdropPath: jsonData['backdrop_path'],
      id: jsonData['id'], 
      originalLanguage: jsonData['original_language'], 
      originalTitle: jsonData['original_title'], 
      overview: jsonData['overview'], 
      popularity: double.parse(jsonData['popularity'].toString()), 
      posterPath: jsonData['poster_path'], 
      releaseDate: jsonData['release_date'], 
      title: jsonData['title'], 
      video: jsonData['video'], 
      voteAverage: double.parse(jsonData['vote_average'].toString()), 
      voteCount: int.parse(jsonData['vote_count'].toString()));
  }
}