import 'package:flutter/material.dart';
import 'package:lists/widgets/tile.dart';
import 'package:persistence/persistence.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.listId, required this.obBox});

  final int listId;
  final Persistence obBox;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final alertController = TextEditingController();

  List<String> listItems = [];
  List<Widget> lists = [];
  String listName = '';

  @override
  void initState() {
    widget.obBox.get(widget.listId).then((result) => {
          print('result'),
          print(result),
          listItems = result.listItems,
          listName = result.listName
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Lista de itens'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.add),
      //       tooltip: 'Show Snackbar',
      //       onPressed: () {
      //         setState(() => showDialog(
      //             context: context,
      //             builder: (context) {
      //               return AlertDialog(
      //                 content: TextField(
      //                   controller: alertController,
      //                   decoration: const InputDecoration(
      //                       hintText: "Adicione um item a lista"),
      //                 ),
      //                 actions: <Widget>[
      //                   ElevatedButton(
      //                       onPressed: () => {
      //                             setState(() {
      //                               listItems.add(alertController.text);
      //                               widget.obBox.save(
      //                                   listName, listItems, widget.listId);
      //                             }),
      //                             alertController.text = '',
      //                             Navigator.of(context).pop()
      //                           },
      //                       child: const Text("Entrar")),
      //                 ],
      //               );
      //             }));
      //       },
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: listItems.length,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(listItems[index]),
      ),
    );
  }
}
