import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_app.dart';

class Header extends Component<String> {
  const Header(super.state, {super.key});

  @override
  Widget render(BuildContext context) => AppBar(
        leading: context.url == '/cart'
            ? IconButton(
                onPressed: () => context.url = '/',
                icon: const Icon(Icons.home))
            : null,
        title: Text(state.value),
        centerTitle: true,
        actions: [
          Switch(
              value: context.app<CartApp>().theme.value == ThemeData.dark(),
              onChanged: ((value) {
                context.app<CartApp>().theme.value =
                    value ? ThemeData.dark() : ThemeData.light();
                refresh();
              }))
        ],
      );
}
