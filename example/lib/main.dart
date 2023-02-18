import 'package:component/component.dart';
import 'package:flutter/material.dart';

void main() => runApp(~MyApp());

class MyApp extends Application {
  final counterState = 0.state;

  @override
  Widget render(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Counter(counterState),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counterState.value++,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}

class Counter extends Component<int> {
  const Counter(super.state, {super.key});

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
            '${state.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () => state.value = 0,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
