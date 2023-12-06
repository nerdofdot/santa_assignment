import 'package:flutter/cupertino.dart';

//Object for a child
class Child {
  final String name;
  final String country;
  bool isNice;

  Child(this.name, this.country, this.isNice);
}

class ChildListBloc extends ChangeNotifier {

  final List<Child> _children = [
    Child('Amaan', 'India', true),
    Child('Anna', 'France', false),
    Child('Alex', 'Germany', true)

  ];

  List<Child> get children => _children;


  //Changes the status of the child

  void toggleChildStatus(int index)
  {
    _children[index].isNice = !_children[index].isNice;
    notifyListeners();
  }

  //adds a new child to the list

  void addChild(Child child)
  {
    _children.add(child);
    notifyListeners();
  }
}