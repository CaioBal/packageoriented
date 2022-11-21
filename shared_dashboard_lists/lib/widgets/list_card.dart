import 'package:flutter/material.dart';
import 'package:core/app/core_services.dart';

class ListCard extends StatelessWidget {
  const ListCard(
      {super.key,
      required this.cardName,
      required this.cardPath,
      required this.listId,
      this.callback});

  final String cardName;
  final String cardPath;
  final Function? callback;
  final int listId;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () => cardPath == 'list'
              ? callback!(listId)
              : navigatorKey.currentState?.pushNamed('/$cardPath'),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Center(child: Text(cardName)),
            ),
          ),
        ));
  }
}
