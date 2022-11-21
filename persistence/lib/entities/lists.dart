import 'package:objectbox/objectbox.dart';

@Entity()
class ListsEntity {
  int id;
  String listName;
  List<String> listItems;

  ListsEntity({this.id = 0, required this.listName, required this.listItems});
}
