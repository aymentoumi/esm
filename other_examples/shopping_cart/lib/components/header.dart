import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_app.dart';

class Header extends Component<String> {
  const Header(super.state, {super.key});

  String get _title => state.value;

  @override
  Widget render(BuildContext context) => AppBar(
        leading: context.url == '/cart'
            ? IconButton(
                onPressed: () => context.url = '/',
                icon: const Icon(Icons.home))
            : null,
        title: Text(_title),
        centerTitle: true,
        actions: [
          Switch(
            value: context.app<CartApp>().theme == ThemeData.dark(),
            onChanged: ((value) {
              context.app<CartApp>().theme =
                  value ? ThemeData.dark() : ThemeData.light();
              refresh();
            }),
          )
        ],
      );
}
