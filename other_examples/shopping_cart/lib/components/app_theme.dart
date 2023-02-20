import 'package:esm/esm.dart';
import 'package:flutter/material.dart';

class AppTheme extends Component<ThemeData> {
  final Widget _child;

  const AppTheme(super.state, Widget child, {super.key}) : _child = child;

  ThemeData get _theme => state.value;

  @override
  Widget render(BuildContext context) => Theme(data: _theme, child: _child);
}
