import 'package:flutter/material.dart';

import '../controller/color_picker_controller.dart';
import 'prev_color_button.dart';

class UniversalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UniversalAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerController.instance;
    return SafeArea(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) => const PrevColorButton(),
      ),
    );
  }
}
