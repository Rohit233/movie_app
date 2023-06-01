import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/utils/api_routes.dart';
import 'package:movie_app/view_models/movie_detail_view_model.dart';
import 'package:movie_app/views/movie_detail_view/widgets/movie_videos_widget.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  const MovieDetailScreen({super.key,required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  MovieDetailViewModel movieDetailViewModel = MovieDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.95,
        child: FutureBuilder(
          future: movieDetailViewModel.getMovieDetail(context, widget.movieId),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return StoreConnector<MovieDetailData?,MovieDetailData?>(
              converter: (store) => store.state,
              builder: (context, MovieDetailData? movieDetailData) {
                return movieDetailData == null ? Center(
                  child: Text('Movie detail not available',style: Theme.of(context).textTheme.labelLarge),
                )
                 : SingleChildScrollView(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(onPressed: () {
                              Navigator.pop(context);
                          }, icon: const Icon(Icons.close)),
                        )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(movieDetailData.title,style: Theme.of(context).textTheme.titleLarge,),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.thumb_up_alt,size: 14,color: Colors.blueAccent.shade400),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Text(movieDetailData.voteAverage.toString(),style: Theme.of(context).textTheme.bodySmall,),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.language_rounded,size: 14,color: Colors.blueAccent.shade400),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: Text(movieDetailData.originalLanguage,style: Theme.of(context).textTheme.bodySmall,),
                                        )
                                      ],
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            fit: BoxFit.fill,
                            ApiRoutes.baseUrlForImage+movieDetailData.backdropPath),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(movieDetailData.overview,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyMedium,),
                      ),
                      MovieVideos(movieId: movieDetailData.id)
                    ],
                  ),
                 );
              }
            );
          }
        ),
      ),
    );
  }
}