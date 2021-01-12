import 'package:filmy/redux/actions/movie_action.dart';
import 'package:filmy/redux/actions/navigator_actions.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MyAppBar extends StatefulWidget with  PreferredSizeWidget {
  @override
  final Size preferredSize;

  MyAppBar({Key key})
      : 
      preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  TextEditingController nameController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(
      converter: (store) {
        final Map<String, dynamic> args = {
          "route": store.state.routes,
          "search_Str": store.state.search,
          "search": (search) {
            store.dispatch(SearchAction(search));
          },
          "navigate": (navTo) {
            store.dispatch(NavigatorReplaceAction(navTo));
          },
        };
        return args;
      },
      builder: (context, args) {

        final Function search = args["search"];
        final String search_Str = args["search_Str"];
        
        
        nameController.addListener(() {
          search(nameController.text);
        });
        
        
        return AppBar(
          title: Container(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            controller: nameController,
            textAlign: TextAlign.center,
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: search_Str.length > 0 ? IconButton(
                icon: Icon(Icons.close), 
                onPressed: () => nameController.clear(),
              ) : null,
              contentPadding: EdgeInsets.fromLTRB(20, 7, 7, 20),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(color: Colors.grey[800]),
              hintText: "Search",
              fillColor: Colors.white,
            ),
          ),
        ));
      }
    );
  }
}

