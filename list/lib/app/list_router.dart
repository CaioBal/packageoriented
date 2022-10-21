import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'list_page.dart';

class ListRouter implements AppContract {
  @override
  String get appName => "list_page";

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        '/list': (context, args) => ListPage(),
      };
}
