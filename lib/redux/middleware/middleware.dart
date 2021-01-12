import 'package:flutter/material.dart';
import 'package:filmy/redux/middleware/init_middleware.dart';
import 'package:filmy/redux/middleware/navigation_middleware.dart';
import 'package:filmy/redux/models/app_state.dart';
import 'package:filmy/redux/services/api.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  ApiService apiService,
)
{
  return [
    ...createInitMiddleware(apiService),
    ...createNavigationMiddleware(navigatorKey),
  ];
}