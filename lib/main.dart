import 'package:filmy/redux/services/api.dart';
import 'package:filmy/ui/DetailPage.dart';
import 'package:filmy/ui/TopPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:filmy/redux/actions/action.dart';
import 'package:filmy/redux/middleware/middleware.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:filmy/redux/reducers/base_reducer.dart';
import 'package:filmy/redux/routes/routes.dart';
import 'package:filmy/ui/HomePage.dart';
import 'package:filmy/utils/ui_constants.dart';
import 'package:redux/redux.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // final SharedPreferences preferences = await SharedPreferences.getInstance();
  
  final Store<AppState> store = Store<AppState>(
    baseReducer,
    initialState: AppState.initial(),

    middleware: createMiddleWare(
      navigatorKey,
      ApiService(),
    )
  );
  store.dispatch(InitAppAction());
  return runApp(Quotes(store));
}

class Quotes extends StatelessWidget {
  
  final Store<AppState> store;

  Quotes(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, Map<String, dynamic>>(
        converter: (store)
        {
          final Map<String, dynamic> args = {
            
          };
          return args;
        },
        builder: (context, args){
          return MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner : false,
            navigatorKey:navigatorKey,
            navigatorObservers: [routeObserver],
            // theme: getThemeData(),
            theme: ThemeData(
              primaryColor: AppColors.primary,
              brightness: Brightness.light,
              /* light theme settings */
            ),
            darkTheme: ThemeData(
              primaryColor: AppColors.primary,
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            // themeMode: ThemeMode.dark, 
            onGenerateRoute: (RouteSettings settings) => _resolveRoute(settings),
          );
        }
      )
      
      
    );
  }

  PageRoute _resolveRoute(RouteSettings settings)
	{
    
		switch(settings.name)
		{
			case AppRoutes.home:
          return MainRoute(HomePage(), settings: settings);
      case AppRoutes.selected:
          return FabRoute(DetailPage(), settings: settings,direction: 'right');
      case AppRoutes.top:
          return MainRoute(TopPage(), settings: settings);
      default :
        return MainRoute(HomePage(), settings : settings);
        
		}
	}

}