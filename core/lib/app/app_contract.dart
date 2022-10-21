import 'package:flutter/widgets.dart';

abstract class AppContract {
  String get appName;

  Map<String, Widget Function(BuildContext context, Object? args)> get routes;
}
