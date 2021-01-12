import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/models/movie.dart';
import 'package:filmy/ui/widgets/BottomNBar.dart';
import 'package:filmy/ui/widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "isLoading": store.state.isLoading,
          "search": store.state.search,
          "topRated": store.state.topRated,
          "selectMovie": (int movieId) {
            store.dispatch(SelectMovieAction(movieId));
          },
          "remove": (int movieId) {
            store.dispatch(RemoveTopMovieAction(movieId));
          },
          "refresh": (){
            store.dispatch(RefreshTopMovieAction());
          }
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final List<Movie> topRated = args['topRated'];
        final Function selectMovie = args["selectMovie"];
        final Function remove = args["remove"];
        final Function refresh = args["refresh"];
        final String search = args["search"];
        List<Movie> movies = [];

        // print(search);
        topRated.forEach((element) {
          String _title = element.title.toLowerCase();
          String _search = search.toLowerCase();
          if(_title.contains(_search)){
            movies.add(element);
          }
            
        });
        
        return Scaffold(
          appBar: MyAppBar(),
          body: isLoading ? 
          Container(child: Center(child: CircularProgressIndicator(),),) : 
          RefreshIndicator(
            onRefresh: () async {
                  print('object');
                  refresh();
                },
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
                    // new IconSlideAction(
                    //   caption: 'Share',
                    //   color: Colors.indigo,
                    //   icon: Icons.share,
                    //   // onTap: () => _showSnackBar('Share'),
                    // ),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: BottomNBar()
        );
      },
    );
  }
}

