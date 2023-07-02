import 'package:flutter/material.dart';

class FormattingTool extends StatelessWidget {
  final IconData icon;
  const FormattingTool({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 30,
        ));
  }
}
