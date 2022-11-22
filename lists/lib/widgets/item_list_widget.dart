import 'package:flutter/material.dart';
import 'package:lists/widgets/tile.dart';
import 'package:persistence/persistence.dart';

class ItemListWidget extends StatefulWidget {
  const ItemListWidget({super.key, required this.listId, required this.obBox});

  final int listId;
  final Persistence obBox;

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  final alertController = TextEditingController();

  List<String> listItems = [];
  List<Widget> lists = [];
  String listName = '';
  bool isChecked = false;

  @override
  void initState() {
    widget.obBox.get(widget.listId).then(
          (result) => {
            setState(() {
              listItems = result.listItems;
              listName = result.listName;
            }),
          },
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista ' + listName),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Show Snackbar',
              onPressed: () {
                setState(() => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: TextField(
                          controller: alertController,
                          decoration: const InputDecoration(
                              hintText: "Adicione um item a lista"),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => {
                                    alertController.text.isEmpty
                                        ? null
                                        : {
                                            setState(() {
                                              listItems
                                                  .add(alertController.text);
                                              widget.obBox.save(listName,
                                                  listItems, widget.listId);
                                            }),
                                            alertController.text = '',
                                            Navigator.of(context).pop()
                                          },
                                  },
                              child: const Text("Entrar")),
                        ],
                      );
                    }));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            for (var item in listItems)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.orange.withOpacity(.32);
                      }
                      return Colors.blue;
                    }),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        listItems.remove(item);
                        widget.obBox.save(listName, listItems, widget.listId);
                      });
                    },
                  ),
                  title: Text(
                    item,
                  ),
                  onTap: () => setState(() {
                    isChecked = !isChecked;
                  }),
                ),
              ),
          ]),
        ));
  }
}
