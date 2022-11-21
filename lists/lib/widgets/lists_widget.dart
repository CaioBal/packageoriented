import 'package:flutter/material.dart';
import 'package:persistence/entities/lists.dart';
import 'package:persistence/persistence.dart';
import 'package:shared_dashboard_lists/shared_dashboard_lists.dart';

class ListsWidget extends StatefulWidget {
  ListsWidget(
      {super.key,
      required lists,
      required listsCounter,
      required listsParams,
      required this.itemListCallback});
  final List<Widget> lists = [];
  final List<int> listsCounter = [];
  final List<ListsEntity> listsParams = [];
  final Function itemListCallback;
  @override
  State<ListsWidget> createState() => _ListsWidgetState();
}

class _ListsWidgetState extends State<ListsWidget> {
  final alertController = TextEditingController();
  final obBox = Persistence(ObjectBox());

  List<Widget> lists = [];
  List<int> listsCounter = [];
  List<ListsEntity> listsParams = [];

  @override
  void initState() {
    obBox.fetch().then((result) => {
          setState(() => {
                for (var listItem in result)
                  {
                    lists.add(ListCard(
                      cardName: listItem.listName,
                      cardPath: 'list',
                      callback: widget.itemListCallback,
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

  @override
  void dispose() {
    obBox.closeBox();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
