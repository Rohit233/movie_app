import 'dart:core';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoutes {
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String tmdApiKey = dotenv.env['TMD_API_KEY'] ?? '';
  static String baseUrlForImage = 'https://image.tmdb.org/t/p/w500';
  static String getUpcommingMoviesRoute() {
    return '/movie/upcoming?api_key=$tmdApiKey';
  }

  static String getMovieDetailRoute(String movieId){
    return '/movie/$movieId?api_key=$tmdApiKey';
  }

}