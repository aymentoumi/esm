import 'package:esm/esm.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/components/app_theme.dart';
import 'package:shopping_cart/components/fab.dart';
import 'package:shopping_cart/components/header.dart';
import 'package:shopping_cart/models/item.dart';
import 'package:shopping_cart/pages/cart_page.dart';
import 'package:shopping_cart/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class CartApp extends Application {
  final headerTitle = ''.state;
  final fabVisibility = false.state;
  final theme = ThemeData.dark().state;

  @override
  Widget render(BuildContext context) {
    Widget? body;

    switch (context.url) {
      case '/':
        headerTitle.value = 'HOME';
        body = const HomePage();
        break;
      case '/cart':
        headerTitle.value = 'CART (${Item.cart.length})';
        body = CartPage(Item.cart.state);
        break;
      default:
        headerTitle.value = '404';
        body = const Text('NOT FOUND!').centered();
    }

    fabVisibility.value = Item.cart.isNotEmpty && context.url == '/';

    return AppTheme(
        theme,
        Scaffold(
          appBar: (Header(headerTitle))
              .preferredSize(const Size.fromHeight(kToolbarHeight)),
          body: body,
          floatingActionButton: Fab(fabVisibility),
        ));
  }
}
