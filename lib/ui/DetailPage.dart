import 'package:filmy/redux/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:filmy/redux/actions/navigator_actions.dart';
import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/models/app_state.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "isLoading": store.state.isLoading,
          "selectedMovie": store.state.selectedMovie,
        };
        return args;
      },
      builder: (context, args) {
        final bool isLoading = args["isLoading"];
        final Movie selectedMovie = args['selectedMovie'];
        
        DateTime date = DateTime.parse(selectedMovie.releaseDate);
        final DateFormat formatter = DateFormat('yMMMMd');
        final String formatted = formatter.format(date);
        

        return Scaffold(
          appBar: AppBar(
              title: Text(selectedMovie.title)
          ),
          body: PageView(
            children: [
              isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://image.tmdb.org/t/p/original' + selectedMovie.backdropPath)
                  )
                ),
                child: ListView(
                  reverse: true,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    child: Column(
                      children: [
                        Text(selectedMovie.title,style: TextStyle(color: Colors.white),),
                        SizedBox(height: 10,),
                        Text(formatted,style: TextStyle(color: Colors.white),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedMovie.voteAverage.toString(),style: TextStyle(color: Colors.white),),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.white),
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.access_alarm, size: 16,color: Colors.white,),
                                  ),
                                  TextSpan(
                                    text: ' '+selectedMovie.runtime.toString(),

                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(selectedMovie.overview,style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
