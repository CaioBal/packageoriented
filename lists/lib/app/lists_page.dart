import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lists/widgets/add_list_widget.dart';
import 'package:lists/widgets/item_list_widget.dart';
import 'package:persistence/entities/lists.dart';
import 'package:persistence/persistence.dart';
import 'package:shared_dashboard_lists/shared_dashboard_lists.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({super.key});

  static String routeName = '/';

  @override
  State<ListsPage> createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  final alertController = TextEditingController();
  final obBox = Persistence();

  List<Widget> lists = [];
  List<int> listsCounter = [];
  List<ListsEntity> listsParams = [];
  int isOnList = 1;
  int listId = 0;

  @override
  void initState() {
    obBox.fetch().then((result) => {
          setState(() => {
                for (var listItem in result)
                  {
                    lists.add(ListCard(
                      cardName: listItem.listName,
                      cardPath: 'list',
                      callback: itemListCallback,
                      listId: listItem.id,
                    )),
                    listsCounter.isEmpty
                        ? listsCounter.add(0)
                        : listsCounter.add(listsCounter.last + 1),
                    listsParams.add(
                      ListsEntity(
                          id: listItem.id,
                          listName: listItem.listName,
                          listItems: listItem.listItems),
                    ),
                  }
              }),
        });

    super.initState();
  }

  addListCallback(
    Widget listsCallback,
    ListsEntity listsParamsCallback,
  ) {
    setState(() {
      lists.add(listsCallback);
      listsCounter.isEmpty
          ? listsCounter.add(0)
          : listsCounter.add(listsCounter.last + 1);
      listsParams.add(listsParamsCallback);
    });

    return 0;
  }

  itemListCallback(int listIdCallback) {
    listId = listIdCallback;
    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) => ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: ItemListWidget(listId: listId, obBox: obBox)));
  }

  @override
  void dispose() {
    obBox.closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas listas"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Adicionar Lista',
            onPressed: () {
              setState(() => showDialog(
                    context: context,
                    builder: (context) {
                      return AddListWidget(
                        obBox: obBox,
                        callback: addListCallback,
                        itemListCallback: itemListCallback,
                      );
                    },
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: lists,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (var i in listsCounter)
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 5,
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => {
                            obBox.delete(listsParams[i].id),
                            setState(
                              () => {
                                lists.remove(lists[i]),
                                listsCounter.removeLast(),
                                listsParams.remove(listsParams[i])
                              },
                            )
                          },
                        ),
                      ))
              ],
            ),
          ],
        )),
      ),
    );
  }
}
