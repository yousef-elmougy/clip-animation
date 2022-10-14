import 'package:flutter/material.dart';

class ColorModel {
  final Color color;

  const ColorModel(this.color);
}

List<ColorModel> colors = const [
  ColorModel(
    Color(0xffA232B8),
    // Alignment.topLeft,
  ),
  ColorModel(
    Color(0xffDBDBDB),
    // Alignment.topCenter,
  ),
  ColorModel(
    Color(0xffA8E0FF),
    // Alignment.topRight,
  ),
  ColorModel(
    Color(0xffB08EA2),
    // Alignment.centerRight,
  ),
  ColorModel(
    Color(0xffFA9DE7),
    // Alignment.centerLeft,
  ),
  ColorModel(
    Color(0xffF0C0B6),
    // Alignment.bottomLeft,
  ),
  ColorModel(
    Color(0xffC8B8E3),
    // Alignment.bottomCenter,
  ),
  ColorModel(
    Color(0xffB6F0EB),
    // Alignment.bottomRight,
  ),
];
