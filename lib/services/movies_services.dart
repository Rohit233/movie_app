import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/models/movie_video_data.dart';
import 'package:movie_app/utils/api_routes.dart';
import 'package:movie_app/utils/service_helper.dart';

class MoviesServices {

//* GET UPCOMMING MOVIES SERVICE
  static Future<List<MovieData>> getUpcommingMovies(BuildContext context) async {
    List<MovieData> upcommingMovies = [];
    String url = ApiRoutes.baseUrl + ApiRoutes.getUpcommingMoviesRoute();
    Map<String,dynamic> res = await ServiceHelper.sendHttpGetRequest(url, context);
    for(Map<String,dynamic> movies in res['results']) {
      upcommingMovies.add(MovieData.getObjectFromJson(movies));
    }

    return upcommingMovies;
  }

//* GET MOVIE DETAILS SERVICE
  static Future<MovieDetailData?> getMovieDetail(BuildContext context,int movieId) async {
    String url = ApiRoutes.baseUrl + ApiRoutes.getMovieDetailRoute(movieId.toString());
    Map<String, dynamic>? res = await ServiceHelper.sendHttpGetRequest(url, context);
    if(res != null) {
      return MovieDetailData.getObjectFromJson(res);
    }
    return null;
  }

//* GET MOVIE VIDEO SERVICE
  static Future<List<MovieVideoData>> getMovieVideos(BuildContext context,int movieId) async {
    List<MovieVideoData> movieVideos = [];
    String url = ApiRoutes.baseUrl + ApiRoutes.getMovieVideosRoute(movieId.toString());
    Map<String,dynamic>? res = await ServiceHelper.sendHttpGetRequest(url, context);
    if(res != null) {
      for(Map<String,dynamic> videos in res['results']) {
        movieVideos.add(MovieVideoData.getObjectFromJson(videos));
      }
    }
    return movieVideos;
  }

}