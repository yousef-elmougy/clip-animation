import 'package:flutter/cupertino.dart';

class CustomClipPath extends CustomClipper<Path> {
  final double value;
  final Alignment alignment;

  const CustomClipPath(this.value, this.alignment);

  @override
  Path getClip(Size size) {
    Path path = Path();

   if( alignment == Alignment.topLeft) ovalPath(path, size,   const Offset(0, 0));
   if( alignment == Alignment.topCenter) ovalPath(path, size,  Offset(size.width /2, 0));
   if( alignment == Alignment.topRight) ovalPath(path, size, Offset(size.width,0));
   if( alignment == Alignment.centerRight) ovalPath(path, size,  Offset(size.width, size.height /2));
   if( alignment == Alignment.centerLeft) ovalPath(path, size,  Offset(0, size.height /2));
   if( alignment == Alignment.bottomLeft) ovalPath(path, size,  Offset(0, size.height));
   if( alignment == Alignment.bottomCenter) ovalPath(path, size,  Offset(size.width /2, size.height));
   if( alignment == Alignment.bottomRight) ovalPath(path, size,  Offset(size.width, size.height));
    return path;
  }

  void ovalPath(Path path, Size size, Offset offset) =>
      path.addOval(
        Rect.fromCircle(center: offset, radius: size.shortestSide * 2 * value),
      );

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
