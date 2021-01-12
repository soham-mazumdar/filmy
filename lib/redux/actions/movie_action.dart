import 'package:filmy/redux/actions/action.dart';
import 'package:filmy/redux/models/movie.dart';

class SaveNowPlayingMovieAction extends AppAction{

  final List<Movie> movies;
  SaveNowPlayingMovieAction(this.movies);

  @override String toString() => "SaveNowPlayingMovieAction{$movies}";
}


class SaveTopMovieAction extends AppAction{

  final List<Movie> movies;
  SaveTopMovieAction(this.movies);

  @override String toString() => "SaveTopMovieAction{$movies}";
}

class SelectMovieAction extends AppAction {
  
  final int movieId;
  SelectMovieAction(this.movieId);

  @override String toString() => "SelectMovieAction{$movieId}";
}


class SelectedMovieAction extends AppAction {
  
  final Movie movie;
  SelectedMovieAction(this.movie);

  @override String toString() => "SelectedMovieAction{$movie}";
}

class SearchAction extends AppAction {
  
  final String search;
  SearchAction(this.search);

  @override String toString() => "SelectedMovieAction{$search}";
}

class RemoveNowMovieAction extends AppAction {
  final int movieId;
  RemoveNowMovieAction(this.movieId);

  @override String toString() => "RemoveNowMovieAction{$movieId}";
}


class RemoveTopMovieAction extends AppAction {
  final int movieId;
  RemoveTopMovieAction(this.movieId);

  @override String toString() => "RemoveTopMovieAction{$movieId}";
}

class RefreshNowMovieAction extends AppAction{}
class RefreshTopMovieAction extends AppAction{}

// class SaveNewQuotesAction extends AppAction{

//   final List<Quote> quotes;
//   SaveNewQuotesAction(this.quotes);

//   @override String toString() => "SaveNewQuotesAction{$quotes}";
// }

// class SaveQuotesAction extends AppAction{
//   final Quote quote;

//   SaveQuotesAction(this.quote);

//   @override String toString() => "SaveQuotesAction{$quote}";
// }

// class SaveLocalQuotesAction extends AppAction{
//   final List<Quote> quotes;
//   SaveLocalQuotesAction(this.quotes);

//   @override String toString() => "SaveLocalQuotesAction{$quotes}";
// }

// class DeleteQuotesAction extends AppAction{
//   final Quote quote;

//   DeleteQuotesAction(this.quote);

//   @override String toString() => "DeleteQuotesAction{$quote}";
// }
