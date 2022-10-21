import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class LoginRouter implements AppContract {
  @override
  String get appName => 'login_page';

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        '/login': (context, args) => LoginPage(),
      };
}
