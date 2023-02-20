import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/header_text.dart';
import 'package:todo_list/components/todo_list.dart';
import 'package:todo_list/models/todo.dart';
import 'package:velocity_x/velocity_x.dart';

class TodoApp extends Application {
  final _tfCtrl = TextEditingController();
  final _todos$ = <Todo>[].$;
  final _title$ = 'Todo List (0/0)'.$;

  void updateTitle() {
    int nDone = _todos$.value.count((todo) => todo.completed);
    int nAll = _todos$.value.length;
    _title$.value = 'Todo List ($nDone/$nAll)';
  }

  void addTodo(Todo todo) {
    _todos$.update(() => _todos$.value.add(todo));
    updateTitle();
  }

  void removeTodo(Todo todo) {
    _todos$.update(() => _todos$.value.remove(todo));
    updateTitle();
  }

  @override
  Widget render(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: HeaderText(_title$),
          centerTitle: true,
        ),
        body: <Widget>[
          'New Task:'.text.xl2.extraBlack.make(),
          TextField(
              controller: _tfCtrl,
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                hoverColor: Colors.white,
              ),
              onSubmitted: (text) {
                addTodo(Todo(text));
                _tfCtrl.clear();
              }),
          TodoList(_todos$),
        ]
            .column(crossAlignment: CrossAxisAlignment.start)
            .p32()
            .card
            .gray200
            .make()
            .p8(),
      );
}
