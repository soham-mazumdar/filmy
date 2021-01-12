import 'package:filmy/redux/actions/action.dart';
import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/actions/navigator_actions.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:filmy/redux/routes/routes.dart';
import 'package:filmy/redux/services/api.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createInitMiddleware(
  ApiService apiService,
){
	return[
	  TypedMiddleware<AppState, InitAppAction>(_init(apiService)),
    TypedMiddleware<AppState, RefreshNowMovieAction>(_refreshNow(apiService)),
    TypedMiddleware<AppState, SelectMovieAction>(_selectMovie(apiService)),
    TypedMiddleware<AppState, RefreshTopMovieAction>(_refreshTop(apiService)),
  ];
}

void Function(Store<AppState> store, InitAppAction action, NextDispatcher next)
_init(ApiService apiService) {
  	return (store, action, next) {

      apiService.getNowPlaying().then((value){
        store.dispatch(new SaveNowPlayingMovieAction(value));
      });

      apiService.getTop().then((value){
        store.dispatch(new SaveTopMovieAction(value));
        
      });
      store.dispatch(new IsLoadedAction(true));
      
    	next(action);
	};
}


void Function(Store<AppState> store, SelectMovieAction action, NextDispatcher next)
_selectMovie(ApiService apiService) {
  	return (store, action, next) {

      store.dispatch(IsLoadedAction(false));
      apiService.getDetails(action.movieId).then((value){
        store.dispatch(new SelectedMovieAction(value));
        store.dispatch(NavigatorPushAction(AppRoutes.selected));
        store.dispatch(new IsLoadedAction(true));
      });

    	next(action);
	};
}


void Function(Store<AppState> store, RefreshNowMovieAction action, NextDispatcher next)
_refreshNow(ApiService apiService) {
  	return (store, action, next) {

      apiService.getNowPlaying().then((value){
        store.dispatch(new SaveNowPlayingMovieAction(value));
      });

      store.dispatch(new IsLoadedAction(true));
      
    	next(action);
	};
}


void Function(Store<AppState> store, RefreshTopMovieAction action, NextDispatcher next)
_refreshTop(ApiService apiService) {
  	return (store, action, next) {

      apiService.getTop().then((value){
        store.dispatch(new SaveTopMovieAction(value));
      });
      store.dispatch(new IsLoadedAction(true));
      
    	next(action);
	};
}