A Flutter component package that simplify application state management.

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

## Other examples

[**Shopping Cart**](https://github.com/aymentoumi/component/tree/master/other_examples/shopping_cart)

![image](https://raw.githubusercontent.com/aymentoumi/component/master/other_examples/shopping_cart/capture.gif)
