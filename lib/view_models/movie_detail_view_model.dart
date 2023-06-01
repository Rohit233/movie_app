import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/models/movie_video_data.dart';
import 'package:movie_app/redux/movie_data_redux/actions.dart';
import 'package:movie_app/redux/redux_store.dart';
import 'package:movie_app/services/movies_services.dart';

class MovieDetailViewModel {

//* GET MOVIE DETAIL FUNCTION
Future getMovieDetail(BuildContext context, int movieId,) async {
  MovieDetailData? movieDetailData = await MoviesServices.getMovieDetail(context, movieId);
  ReduxStore.movieDetailStore.dispatch(UpdateMovieDetail(movieDetailData));
}
  
//* GET MOVIE VIDEOS FUNCTION
Future getMovieVideos(BuildContext context,int movieId) async {
  List<MovieVideoData> movieVideos = await MoviesServices.getMovieVideos(context, movieId);
  ReduxStore.movieVideosStore.dispatch(UpdateMovieVideos(movieVideos));
} 

}