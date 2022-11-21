import 'calculator_page.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class CalculatorRouter implements AppContract {
  @override
  String get appName => 'calculator_page';

  @override
  Map<String, Widget Function(BuildContext context, Object? args)> get routes =>
      {
        '/calculator': (context, args) => CalculatorPage(),
      };
}
