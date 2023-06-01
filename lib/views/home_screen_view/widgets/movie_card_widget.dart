import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/utils/api_routes.dart';
import 'package:movie_app/utils/basic_util.dart';
import 'package:movie_app/views/movie_detail_view/movie_detail_screen.dart';

class MovieCardWidget extends StatefulWidget {
  final MovieData movieData;
  const MovieCardWidget({super.key, required this.movieData});

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BasicUtil.openBottomSheet(context, MovieDetailScreen(movieId: widget.movieData.id));
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  fit: BoxFit.fill,
                  ApiRoutes.baseUrlForImage+widget.movieData.posterPath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.movieData.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,),
                    Text(widget.movieData.releaseDate,style: Theme.of(context).textTheme.caption,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.thumb_up_alt,size: 14,color: Colors.blueAccent.shade400),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(widget.movieData.voteAverage.toString(),style: Theme.of(context).textTheme.bodySmall,),
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
                                child: Text(widget.movieData.originalLanguage,style: Theme.of(context).textTheme.bodySmall,),
                              )
                            ],
                          ),
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}