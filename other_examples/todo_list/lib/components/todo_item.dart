import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/todo_app.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoItem extends Component<Todo> {
  const TodoItem(super.state, {super.key});

  Todo get _item => state.value;

  @override
  Widget render(BuildContext context) => <Widget>[
        state.value.content.text.make().px4().expand(),
        IconButton(
          onPressed: () {
            _item.completed = !_item.completed;
            refresh();
            context.app<TodoApp>().updateTitle();
          },
          icon: Icon(
            Icons.verified,
            color: _item.completed ? Colors.amber : Colors.green,
          ),
        ),
        IconButton(
            onPressed: () => context.app<TodoApp>().removeTodo(_item),
            icon: const Icon(Icons.delete, color: Colors.red))
      ].row().color(_item.completed ? Colors.lightGreen : Colors.white).p4();
}
