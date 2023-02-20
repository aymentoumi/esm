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
  final _headerTitle$ = ''.$;
  final _fabVisibility$ = false.$;
  final _theme$ = ThemeData.dark().$;

  set headerTitle(String title) => _headerTitle$.value = title;

  set fabVisibility(bool visible) => _fabVisibility$.value = visible;

  set theme(ThemeData data) => _theme$.value = data;
  ThemeData get theme => _theme$.value;

  @override
  Widget render(BuildContext context) {
    Widget? body;

    switch (context.url) {
      case '/':
        headerTitle = 'HOME';
        body = const HomePage();
        break;
      case '/cart':
        headerTitle = 'CART (${Item.cart.length})';
        body = CartPage(Item.cart.$);
        break;
      default:
        headerTitle = '404';
        body = const Text('NOT FOUND!').centered();
    }

    fabVisibility = Item.cart.isNotEmpty && context.url == '/';

    return AppTheme(
        _theme$,
        Scaffold(
          appBar: (Header(_headerTitle$))
              .preferredSize(const Size.fromHeight(kToolbarHeight)),
          body: body,
          floatingActionButton: Fab(_fabVisibility$),
        ));
  }
}
