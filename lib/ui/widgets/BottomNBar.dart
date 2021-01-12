import 'package:filmy/redux/actions/navigator_actions.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:filmy/redux/routes/routes.dart';
import 'package:filmy/utils/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BottomNBar extends StatelessWidget {
  const BottomNBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map<String, dynamic>>(converter: (store) {
      final Map<String, dynamic> args = {
        "route": store.state.routes,
        "navigate": (navTo) {
          store.dispatch(NavigatorReplaceAction(navTo));
        },
      };
      return args;
    }, builder: (context, args) {
      final Function navigate = args["navigate"];
      final List<String> route = args["route"];

      return BottomAppBar(
        elevation: 35,
        color: AppColors.primary,
        child: Container(
          height: 75,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    if (route.last != AppRoutes.home) navigate(AppRoutes.home);
                  },
                  child: Column(
                    children: [
                      Container(
                        child: route.last != AppRoutes.home
                            ? Icon(Icons.movie, color: Colors.white38)
                            : Icon(
                                Icons.movie_creation_outlined,
                                color: Colors.white,
                              ),
                      ),
                      Container(
                          child: route.last != AppRoutes.home
                              ? Text(
                                  'Now Playing',
                                  style: TextStyle(color: Colors.white38),
                                )
                              : Text(
                                  'Now Playing',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    if (route.last != AppRoutes.top) navigate(AppRoutes.top);
                  },
                  child: Column(
                    children: [
                      Container(
                        child: route.last != AppRoutes.top
                            ? Icon(Icons.star_border, color: Colors.white38)
                            : Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                      ),
                      Container(
                          child: route.last != AppRoutes.top
                              ? Text(
                                  'Top Rated',
                                  style: TextStyle(color: Colors.white38),
                                )
                              : Text(
                                  'Top Rated',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ))
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
