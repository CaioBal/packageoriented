import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:lists/app/lists_page.dart';

class ListsRouter implements AppContract {
  @override
  String get appName => 'lists_page';

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        '/lists': (context, args) => ListsPage(),
      };
}
