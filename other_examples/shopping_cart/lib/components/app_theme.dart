import 'package:esm/esm.dart';
import 'package:flutter/material.dart';

class AppTheme extends Component<ThemeData> {
  final Widget _child;

  const AppTheme(super.state, Widget child, {super.key}) : _child = child;

  @override
  Widget render(BuildContext context) =>
      Theme(data: state.value, child: _child);
}
