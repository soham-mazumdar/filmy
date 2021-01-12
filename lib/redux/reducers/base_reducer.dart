
import 'package:filmy/redux/models/app_state.dart';
import 'package:filmy/redux/reducers/navigation_reducer.dart';
import 'package:filmy/redux/reducers/movie_reducer.dart';

AppState baseReducer(AppState oldState, dynamic action)
{
  return oldState.copyWith(
    newRoutes: navigationReducer(oldState.routes, action),
    newIsLoading: loadingReducer(oldState.isLoading, action),
    newNowPlaying: nowPlayingReducer(oldState.nowPlaying, action),
    newSelectedMovie : selectedMovieReducer(oldState.selectedMovie, action),
    newTopRated: topRatedReducer(oldState.topRated, action),
    newSearch: searchReducer(oldState.search, action)
    // newQuotes: quoteReducer(oldState.quotes, action),
    // newSavedQuotes: saveLocalReducer(oldState.savedQuotes, action),
  );
}