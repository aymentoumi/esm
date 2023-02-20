import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/todo_item.dart';
import 'package:todo_list/models/todo.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoList extends Component<List<Todo>> {
  const TodoList(super.state, {super.key});

  List<Todo> get _todos => state.value;

  @override
  Widget render(BuildContext context) =>
      _todos.map<TodoItem>((e) => TodoItem(e.$)).toList().column();
}
