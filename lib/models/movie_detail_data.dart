import 'package:movie_app/models/prod_company_data.dart';
import 'package:movie_app/models/prod_country_data.dart';
import 'package:movie_app/models/spoken_language_data.dart';

class MovieDetailData {
  late bool adult;
  late String backdropPath;
  late String? belongsToCollection;
  late int budget;
  late List<Map<String,dynamic>> genres;
  late String homepage;
  late int id;
  late String imdbId;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late List<ProductionCompanyData> productionCompanies;
  late List<ProductionCountryData> productionCountries;
  late String releaseDate;
  late int revenue;
  late int runtime;
  late List<SpokenLanguageData> spokenLanguages;
  late String status;
  late String tagline;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;

  MovieDetailData({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  static MovieDetailData getObjectFromJson(Map<String,dynamic> jsonData) {
    List<ProductionCompanyData> productionCompanies = [];
    List<ProductionCountryData> productionCountries = [];
    List<SpokenLanguageData> spokenLanguages  = [];
    for(var spokenLanguage in jsonData['spoken_languages']) {
      spokenLanguages.add(SpokenLanguageData.getObjectFromJson(spokenLanguage));
    }
    for( var company in jsonData['production_companies']){
      productionCompanies.add(ProductionCompanyData.getObjectFromJson(company));
    }
    for( var country in jsonData['production_countries']){
      productionCountries.add(ProductionCountryData.getObjectFromJson(country));
    }
     return MovieDetailData(
      adult: jsonData['adult'],
      backdropPath: jsonData['backdrop_path'], 
      belongsToCollection: jsonData['belongs_to_collection'],
      budget: jsonData['budget'], 
      genres: List<Map<String,dynamic>>.from(jsonData['genres']), 
      homepage: jsonData['homepage'], 
      id: jsonData['id'],
      imdbId: jsonData['imdb_id'], 
      originalLanguage: jsonData['original_language'], 
      originalTitle: jsonData['original_title'], 
      overview: jsonData['overview'], 
      popularity: jsonData['popularity'], 
      posterPath: jsonData['poster_path'], 
      productionCompanies: productionCompanies, 
      productionCountries: productionCountries, 
      releaseDate: jsonData['release_date'], 
      revenue: jsonData['revenue'], 
      runtime: jsonData['runtime'], 
      spokenLanguages: spokenLanguages, 
      status: jsonData['status'], 
      tagline: jsonData['tagline'], 
      title: jsonData['title'], 
      video: jsonData['video'], 
      voteAverage: jsonData['vote_average'],
      voteCount: jsonData['vote_count']);
    

  }

}

