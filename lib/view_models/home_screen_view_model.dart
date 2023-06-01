import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/redux/movie_data_redux/actions.dart';
import 'package:movie_app/redux/redux_store.dart';
import 'package:movie_app/services/movies_services.dart';

class HomeScreenViewModel {
  
//* GET ALL UPCOMING MOVIES FUNCTION
Future getAllUpcomingMovies(BuildContext context) async {
   List<MovieData> upcomingMovies = await MoviesServices.getUpcommingMovies(context);
   ReduxStore.moviesStore.dispatch(UpdateMovies(upcomingMovies));
}


}