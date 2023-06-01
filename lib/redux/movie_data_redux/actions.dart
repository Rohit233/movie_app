import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/models/movie_video_data.dart';

//* UPDATE MOVIES 
class UpdateMovies {
  final List<MovieData> payload;
  UpdateMovies(this.payload);
}
//* UPDATE MOVIE DETAIL 
class UpdateMovieDetail {
  final MovieDetailData? payload;
  UpdateMovieDetail(this.payload);
}

//* UPDATE MOVIE VIDEOS
class UpdateMovieVideos {
  final List<MovieVideoData> payload;
  UpdateMovieVideos(this.payload);
} 

