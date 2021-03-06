import 'package:filmy/redux/models/movie.dart';
import 'package:filmy/ui/widgets/BottomNBar.dart';
import 'package:filmy/ui/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:filmy/redux/actions/navigator_actions.dart';
import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "isLoading": store.state.isLoading,
          "nowPlaying": store.state.nowPlaying,
          "routes": store.state.routes,
          "search": store.state.search,
          "selectMovie": (int movieId) {store.dispatch(SelectMovieAction(movieId));},
          "navigate": (navTo) {return store.dispatch(NavigatorReplaceAction(navTo));},
          "remove": (int movieId) {store.dispatch(RemoveNowMovieAction(movieId));},
          "refresh" : (){store.dispatch(RefreshNowMovieAction());}
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final List<Movie> nowPlaying = args['nowPlaying'];
        final Function selectMovie = args["selectMovie"];
        final Function remove = args["remove"];
        final String search = args["search"];
        final Function refresh = args["refresh"];
        List<Movie> movies = [];

        nowPlaying.forEach((element) {
          String _title = element.title.toLowerCase();
          String _search = search.toLowerCase();
          if(_title.contains(_search))
            movies.add(element);    
        });
        
        

        return Scaffold(
          appBar: MyAppBar(),
          body: PageView(
            children: [
              isLoading ? 
              Container(child: Center(child: CircularProgressIndicator(),),) : 
              RefreshIndicator(
                onRefresh: () async {refresh();},
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index){
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      child: ListTile(
                        onTap: (){
                          selectMovie(movies[index].id);
                        },
                        leading: Image(image: NetworkImage('https://image.tmdb.org/t/p/w342'+ movies[index].posterPath),),
                        title: Text( movies[index].title),
                        subtitle: Text(movies[index].overview.length > 200 ? movies[index].overview.substring(0, 200) : movies[index].overview),
                      ), 
                      secondaryActions: <Widget>[
                        new IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: (){
                            remove(movies[index].id);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNBar()
        );
      },
    );
  }
}
