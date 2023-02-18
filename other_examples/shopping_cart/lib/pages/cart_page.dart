import 'package:component/component.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_app.dart';

import '../models/item.dart';

class CartPage extends Component<List<Item>> {
  const CartPage(super.state, {super.key});

  List<Item> get _cart => state.value;

  @override
  Widget render(BuildContext context) => ListView(
        children: _cart.map((e) {
          return ListTile(
            title: Text(e.name ?? ''),
            subtitle: Text(e.price ?? ''),
            trailing: IconButton(
                icon: const Icon(Icons.remove_circle),
                onPressed: () {
                  _cart.remove(e);
                  refresh();
                  context.app<CartApp>().headerTitle.value =
                      'CART (${Item.cart.length})';
                }),
          );
        }).toList(),
      );
}
