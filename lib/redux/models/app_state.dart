import 'package:filmy/redux/models/movie.dart';
import 'package:filmy/redux/routes/routes.dart';

class AppState {
  final bool isLoading;
  final List<String> routes;
  final List<Movie> nowPlaying;
  final List<Movie> topRated;
  final Movie selectedMovie;
  final String search;
  

  AppState({
    this.isLoading,
    this.routes,
    this.nowPlaying,
    this.topRated,
    this.selectedMovie,
    this.search
  });

  factory AppState.initial(){
    return AppState(
      isLoading: true,
      routes: [AppRoutes.home],
      nowPlaying: [],
      topRated: [],
      search: ''
    );
  }

  AppState copyWith({
    bool newIsLoading,
    List<String> newRoutes,
    List<Movie> newNowPlaying,
    List<Movie> newTopRated,
    Movie newSelectedMovie,
    String newSearch
    // String newSelectedPage,
    // List<Quote> newQuotes,
    // List<Quote> newSavedQuotes
  })
  {
    return AppState(
      isLoading: newIsLoading ?? this.isLoading,
      routes: newRoutes ?? this.routes,
      nowPlaying: newNowPlaying ?? this.nowPlaying,
      topRated: newTopRated ?? this.topRated,
      selectedMovie: newSelectedMovie ?? this.selectedMovie,
      search: newSearch ?? this.search
      // selectedPage: newSelectedPage ?? this.selectedPage,
      // quotes: newQuotes ?? this.quotes,
      // savedQuotes: newSavedQuotes ?? this.savedQuotes
    );
  }
}