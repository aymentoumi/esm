import 'package:esm/esm.dart';
import 'package:flutter/material.dart';

class HeaderText extends Component<String> {
  const HeaderText(super.state, {super.key});

  @override
  Widget render(BuildContext context) => Text(state.value);
}
