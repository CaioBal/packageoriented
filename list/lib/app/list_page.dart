import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list/components/tile.dart';

class ListPage extends StatefulWidget {
  static String routeName = '/';
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List listItems = [];
  final alertController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de itens'),
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
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                            hintText: "Adicione um item a lista"),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                            onPressed: () => {
                                  setState(() {
                                    listItems.add(alertController.text);
                                  }),
                                  alertController.text = '',
                                  Navigator.of(context).pop()
                                },
                            child: const Text("Entrar")),
                      ],
                    );
                  }));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(listItems[index]),
      ),
    );
  }
}
