import 'package:flutter/material.dart';
import 'package:notes_app/src/widgets/formatting_tool.dart';

class FormattingToolBar extends StatelessWidget {
  const FormattingToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        FormattingTool(
          icon: Icons.format_align_left,
        ),
        FormattingTool(
          icon: Icons.format_align_center,
        ),
        FormattingTool(
          icon: Icons.format_align_right,
        ),
        FormattingTool(
          icon: Icons.format_bold,
        ),
        FormattingTool(
          icon: Icons.format_italic,
        ),
        FormattingTool(
          icon: Icons.format_underline,
        ),
        FormattingTool(
          icon: Icons.format_paint,
        ),
        FormattingTool(
          icon: Icons.format_list_bulleted,
        ),
      ],
    );
  }
}
