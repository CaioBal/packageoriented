import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class DashboardRouter implements AppContract {
  @override
  String get appName => 'dashboard_page';

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        '/dashboard': (context, args) => DashboardPage(),
      };
}
