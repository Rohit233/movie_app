import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/view_models/home_screen_view_model.dart';
import 'package:movie_app/views/home_screen_view/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcomming movies'),
      ),
      body: FutureBuilder(
        future: homeScreenViewModel.getAllUpcomingMovies(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
             return const Center(
              child: CircularProgressIndicator(),
             );
          }
          return StoreConnector<List<MovieData>,List<MovieData>>(
            converter: (store) => store.state,
            builder: (context, List<MovieData> upcommingMovies) {
              return upcommingMovies.isEmpty ? Center(
                child: Text('No upcomming movies yet',style: Theme.of(context).textTheme.labelLarge),
              ) 
              : ListView.separated(
                itemCount: upcommingMovies.length,
                itemBuilder: (context, index) {
                  return  MovieCardWidget(movieData: upcommingMovies[index]);
              }, separatorBuilder: (BuildContext context, int index) {  
                  return  Divider(color: Colors.grey.shade200,thickness: .5,);
              },);
            }
          );
        }
      ),
    );
  }
}