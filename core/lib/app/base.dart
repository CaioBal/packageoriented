import 'package:flutter/material.dart';

import 'app_contract.dart';

abstract class Base {
  List<AppContract> get appContracts;

  Map<String, Widget Function(BuildContext context, Object? args)>
      get baseRoutes;

  final Map<String, Widget Function(BuildContext context, Object? args)>
      routes = {};

  void registerRouters() {
    if (baseRoutes?.isNotEmpty ?? false) routes.addAll(baseRoutes);
    if (appContracts?.isNotEmpty ?? false) {
      for (AppContract appContract in appContracts) {
        routes.addAll(appContract.routes);
      }
    }
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
