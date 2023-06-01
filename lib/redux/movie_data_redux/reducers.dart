//* MOVIES REDUCER
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/redux/movie_data_redux/actions.dart';

//* UPCOMING MOVIES REDUCER
List<MovieData> upcomingMoviesReducer(List<MovieData> prevMovieData,dynamic action) {
  List<MovieData> newMovieData = prevMovieData;
  if(action is UpdateMovies) {
    newMovieData = action.payload;
  }

  return newMovieData;
}

//* MOVIES DETAIL REDUCER
MovieDetailData? movieDetailReducer(MovieDetailData? prevMovieDetailData,dynamic action) {
  MovieDetailData? newMovieDetailData = prevMovieDetailData;
  if(action is UpdateMovieDetail){
    newMovieDetailData = action.payload;
  }
  return newMovieDetailData;
} 