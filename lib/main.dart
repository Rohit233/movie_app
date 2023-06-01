import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_app/models/movie_data.dart';
import 'package:movie_app/models/movie_detail_data.dart';
import 'package:movie_app/models/movie_video_data.dart';
import 'package:movie_app/redux/redux_store.dart';
import 'package:movie_app/views/home_screen_view/home_screen.dart';
void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ReduxStore.initialize(); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StoreProvider<List<MovieVideoData>>(
      store: ReduxStore.movieVideosStore,
      child: StoreProvider<MovieDetailData?>(
        store: ReduxStore.movieDetailStore,
        child: StoreProvider<List<MovieData>>(
          store: ReduxStore.moviesStore,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  fontSize: 17
                )
              ),
              appBarTheme: AppBarTheme(
                elevation: 0,
                color: Colors.white,
                titleTextStyle: Theme.of(context).textTheme.headline6
              )
            ),
            home: const HomeScreen(),
          ),
        ),
      ),
    );
  }
}
