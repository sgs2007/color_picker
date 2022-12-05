import 'package:flutter/material.dart';

import '../controller/color_picker_controller.dart';
import 'universal_app_bar.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = ColorPickerController.instance;
    return Scaffold(
      appBar: const UniversalAppBar(),
      body: AnimatedBuilder(animation: controller, builder: (context, _){
        return GestureDetector(
          onTap: controller.getNextColor,
          child: Container(decoration: BoxDecoration(color: controller.currentColor,),),
        );
      }),
    );
  }
}