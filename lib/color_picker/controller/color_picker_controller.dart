import 'dart:math';

import 'package:flutter/material.dart';

class ColorPickerController with ChangeNotifier {
  ColorPickerController._()
      : _currentColor = Colors.primaries[0],
        _prevColors = [];

  static ColorPickerController? _instance;
  static ColorPickerController get instance =>
      _instance ??= ColorPickerController._();

  Color _currentColor;
  final List<Color> _prevColors;

  Color get currentColor => _currentColor;
  List<Color> get prevColors => _prevColors;

  void getNextColor() {
    final newColor = _getRandomColor();
    _prevColors.add(_currentColor);
    _currentColor = newColor;
    notifyListeners();
  }

  void setPrevColor(int index) {
    if (_prevColors.isEmpty) return;
    _currentColor = _prevColors[index];
    _prevColors.removeAt(index);
    notifyListeners();
  }

  Color _getRandomColor() {
    final newColorIndex = Random().nextInt(Colors.primaries.length);
    return Colors.primaries[newColorIndex];
  }
}
