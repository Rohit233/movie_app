import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/models/movie_video_data.dart';
import 'package:movie_app/view_models/movie_detail_view_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieVideos extends StatefulWidget {
  final int movieId;
  const MovieVideos({super.key, required this.movieId});

  @override
  State<MovieVideos> createState() => _MovieVideosState();
}

class _MovieVideosState extends State<MovieVideos> {
  MovieDetailViewModel movieDetailViewModel = MovieDetailViewModel();
  final YoutubePlayerController _youtubePlayerController = YoutubePlayerController();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieDetailViewModel.getMovieVideos(context, widget.movieId),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return StoreConnector<List<MovieVideoData>,List<MovieVideoData>>(
          converter: (store) => store.state,
          builder: (context, List<MovieVideoData> movieVideos) {
            return Builder(
              builder: (context) {
                MovieVideoData? movieVideoData;
                try{
                  movieVideoData = movieVideos.firstWhere((video) => video.type == 'Teaser');
                }
                catch(error) {
                  if(movieVideos.isNotEmpty) {
                    movieVideoData = movieVideos.first;
                  }
                }
                
                return movieVideoData == null ? Center(
                  child: Text('Video not available',style: Theme.of(context).textTheme.labelLarge),
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Watch video',style: Theme.of(context).textTheme.titleLarge,),
                    ),
                     Builder(builder: (context) {
                       _youtubePlayerController.loadVideoById(videoId: movieVideoData!.key);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: YoutubePlayer(controller: _youtubePlayerController)),
                      );
                     })
                  ],
                );
              }
            );
          }
        );
      }
    );
  }
}