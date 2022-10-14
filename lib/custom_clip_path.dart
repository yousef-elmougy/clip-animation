import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper<Path> {
  final double value;

  const CustomClipPath(this.value);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
      Rect.fromCircle(center: const Offset(0, 0), radius: size.shortestSide * 2 * value) ,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
