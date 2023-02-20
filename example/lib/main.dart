import 'package:esm/esm.dart';
import 'package:flutter/material.dart';

void main() => runApp(~MyApp());

class MyApp extends Application {
  final _counter$ = 0.$;

  int get counter => _counter$.value;

  set counter(int v) => _counter$.value = v;

  @override
  Widget render(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Counter(_counter$),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counter++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}

class Counter extends Component<int> {
  const Counter(super.state, {super.key});

  int get _value => state.value;

  set _value(int v) => state.value = v;

  @override
  Widget render(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_value',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => _value = 0,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
