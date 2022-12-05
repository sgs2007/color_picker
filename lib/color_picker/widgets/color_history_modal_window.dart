import 'package:flutter/material.dart';

import '../controller/color_picker_controller.dart';

const _defaultHeight = 0.8;
const _minHeight = 0.8;
const _standartBorderRadius = 16.0;
const _defaultPadding = 16.0;

class ColorHistoryModalWindow extends StatelessWidget {
  const ColorHistoryModalWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorController = ColorPickerController.instance;
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: _defaultHeight,
      minChildSize: _minHeight,
      initialChildSize: _defaultHeight,
      builder: (_, currentScrollController) => Material(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            _standartBorderRadius,
          ),
          topRight: Radius.circular(
            _standartBorderRadius,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: _defaultPadding,
            horizontal: _defaultPadding,
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Color History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: _defaultPadding,
            ),
            const Divider(),
            const SizedBox(
              height: _defaultPadding,
            ),
            AnimatedBuilder(
              animation: colorController,
              builder: (context, _) => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: colorController.prevColors.length,
                  itemBuilder: (context, index) =>
                      colorController.prevColors.isNotEmpty
                          ? Padding(
                              key: Key(
                                  '$index-${colorController.prevColors[index].value}'),
                              padding: const EdgeInsets.only(
                                bottom: _defaultPadding,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  colorController.setPrevColor(index);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: colorController.prevColors[index]),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
              ),
            ),
            const SizedBox(
              height: _defaultPadding,
            ),
          ]),
        ),
      ),
    );
  }
}
