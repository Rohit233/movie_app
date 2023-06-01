import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';

class UpdateMovies {
  final List<MovieData> payload;
  UpdateMovies(this.payload);
}

class UpdateMovieDetail {
  final MovieDetailData? payload;
  UpdateMovieDetail(this.payload);
}

