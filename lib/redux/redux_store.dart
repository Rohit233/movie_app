import 'dart:core';

import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/models/movie_video_data.dart';
import 'package:movie_app/redux/movie_data_redux/reducers.dart';
import 'package:redux/redux.dart';
class ReduxStore {
  static late Store<List<MovieData>> moviesStore;
  static late Store<MovieDetailData?> movieDetailStore;
  static late Store<List<MovieVideoData>> movieVideosStore;

  static initialize() {
     moviesStore = Store(upcomingMoviesReducer,initialState:[]);
     movieDetailStore = Store(movieDetailReducer,initialState:null);
     movieVideosStore = Store(movieVideoReducer,initialState: []);
  }
}