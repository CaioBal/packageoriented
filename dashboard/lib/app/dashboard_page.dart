import 'dart:developer';

import 'package:core/app/core_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_dashboard_login/shared_dashboard_login.dart';
import 'package:shared_dashboard_lists/shared_dashboard_lists.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static String routeName = '/';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appText: "Dashboard"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: ListCard(
                  cardName: 'Calculadora',
                  cardPath: 'calculator',
                  listId: 0,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: ListCard(
                  cardName: 'Listas',
                  cardPath: 'lists',
                  listId: 0,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
