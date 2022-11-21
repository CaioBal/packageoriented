import 'package:flutter/material.dart';
import 'package:persistence/entities/lists.dart';
import 'package:persistence/persistence.dart';
import 'package:shared_dashboard_lists/shared_dashboard_lists.dart';

class AddListWidget extends StatefulWidget {
  const AddListWidget(
      {super.key,
      required this.obBox,
      required this.callback,
      required this.itemListCallback});
  final Persistence obBox;
  final Function callback;
  final Function itemListCallback;

  @override
  State<AddListWidget> createState() => _AddListWidgetState();
}

class _AddListWidgetState extends State<AddListWidget> {
  final alertController = TextEditingController();

  int listsCounter = 0;
  int listsParamsId = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: alertController,
        decoration: const InputDecoration(hintText: "Adicione uma lista"),
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () async => {
                  alertController.text.isEmpty
                      ? null
                      : {
                          listsParamsId = await widget.obBox
                              .save(alertController.text, [], null),
                          widget.callback(
                            ListCard(
                              cardName: alertController.text,
                              cardPath: 'list',
                              callback: widget.itemListCallback,
                              listId: listsParamsId,
                            ),
                            ListsEntity(
                                id: listsParamsId,
                                listName: alertController.text,
                                listItems: []),
                          ),
                          alertController.text = '',
                          Navigator.of(context).pop()
                        }
                },
            child: const Text("Entrar")),
      ],
    );
  }
}
