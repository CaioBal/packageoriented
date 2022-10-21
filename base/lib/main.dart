import 'package:flutter/material.dart';

import 'package:core/app/app_contract.dart';
import 'package:core/app/base.dart';
import 'package:core/app/core_services.dart';

import 'package:list/list.dart';
import 'package:login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    super.registerRouters();

    return MaterialApp(
      title: 'Flutter TCC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  List<AppContract> get appContracts => [
        LoginRouter(),
        ListRouter(),
      ];

  @override
  Map<String, Widget Function(BuildContext context, Object? args)>
      get baseRoutes => {};
}
