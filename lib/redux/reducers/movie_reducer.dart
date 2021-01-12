import 'package:filmy/redux/actions/action.dart';
import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/models/movie.dart';
import 'package:redux/redux.dart';


final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, IsLoadedAction>(_isLoading),
]);

bool _isLoading(bool meds, IsLoadedAction action) {
  return !action.isloading;
}

final nowPlayingReducer = combineReducers<List<Movie>>([
  new TypedReducer<List<Movie>, RemoveNowMovieAction>(_removeNowMovie),
  new TypedReducer<List<Movie>, SaveNowPlayingMovieAction>(_saveNowPlaying),
]);

List<Movie> _saveNowPlaying(List<Movie> nowPlaying, SaveNowPlayingMovieAction action) {
  return action.movies;
}

List<Movie> _removeNowMovie(List<Movie> movies, RemoveNowMovieAction action) {
  movies.removeWhere((element) => element.id == action.movieId);
  // meds.addAll(action.quotes);
  return movies;
}

final selectedMovieReducer = combineReducers<Movie>([
  new TypedReducer<Movie, SelectedMovieAction>(_selectedMovie),
]);

Movie _selectedMovie(Movie meds, SelectedMovieAction action) {
  return action.movie;
}


final topRatedReducer = combineReducers<List<Movie>>([
  new TypedReducer<List<Movie>, SaveTopMovieAction>(_topMovie),
  new TypedReducer<List<Movie>, RemoveTopMovieAction>(_removeTopMovie),
  
]);

List<Movie> _topMovie(List<Movie> meds, SaveTopMovieAction action) {
  return action.movies;
}

List<Movie> _removeTopMovie(List<Movie> movies, RemoveTopMovieAction action) {
  movies.removeWhere((element) => element.id == action.movieId);
  // meds.addAll(action.quotes);
  return movies;
}


final searchReducer = combineReducers<String>([
  new TypedReducer<String, SearchAction>(_search),
]);

String _search(String meds, SearchAction action) {
  return action.search;
}