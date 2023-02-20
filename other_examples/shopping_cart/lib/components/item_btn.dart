import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/cart_app.dart';
import 'package:shopping_cart/models/item.dart';

class ItemBtn extends Component<Item> {
  const ItemBtn(super.state, {super.key});

  Item get _item => state.value;

  @override
  Widget render(BuildContext context) => IconButton(
      icon: Icon(
        Item.cart.contains(_item) ? Icons.remove_circle : Icons.add_circle,
      ),
      onPressed: () {
        if (!Item.cart.contains(_item)) {
          Item.cart.add(_item);
        } else {
          Item.cart.remove(_item);
        }
        refresh();
        context.app<CartApp>().fabVisibility =
            Item.cart.isNotEmpty && context.url == '/';
      });
}
