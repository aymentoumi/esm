import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/models/item.dart';

class Fab extends Component<bool> {
  const Fab(super.state, {super.key});

  @override
  Widget render(BuildContext context) => Visibility(
      visible: state.value,
      child: FloatingActionButton.extended(
        onPressed: () => context.url = '/cart',
        label: Text('${Item.cart.length} cart'),
      ));
}
