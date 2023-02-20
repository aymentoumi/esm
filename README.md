ESM (Easy State Management)
A Flutter package to simplify application state management using component.

## Features

Add this to your flutter app to:

1. Create widgets with mutable state.
2. Control widget through his state.
3. Handle app routing easily.

## Usage

A simple counter component. For full counter app you can refer to the example section.

```dart
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
            onPressed: () => state.value++,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
```
![image](https://raw.githubusercontent.com/aymentoumi/esm/master/example/capture.gif)

## Other examples

[**Shopping Cart**](https://github.com/aymentoumi/esm/tree/master/other_examples/shopping_cart)

![image](https://raw.githubusercontent.com/aymentoumi/esm/master/other_examples/shopping_cart/capture.gif)
