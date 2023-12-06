import 'package:flutter_test/flutter_test.dart';
import 'package:santa_challange_memodio/objects_child.dart';

void main() {
  group('ChildListBloc Tests', () {
    test('Toggle Child Status', () {
      final bloc = ChildListBloc();
      bloc.toggleChildStatus(0);
      expect(bloc.children[0].isNice, false);
    });

    test('Add Child', () {
      final bloc = ChildListBloc();
      final newChild = Child('Test Child', 'Test Country', true);
      bloc.addChild(newChild);
      expect(bloc.children.contains(newChild), true);
    });
  });
}