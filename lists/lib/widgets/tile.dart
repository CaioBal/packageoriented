import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget {
  final String itemNo;

  const ItemTile(
    this.itemNo,
  );

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool isChecked = false;

  @override
  void initState() {
    print('oaijwdoaiwjdoi');
    print(widget.itemNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
        title: Text(
          widget.itemNo,
        ),
        onTap: () => setState(() {
          isChecked = !isChecked;
        }),
      ),
    );
  }
}
