import 'package:flutter/material.dart';

class WaveWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var height = size.height;
    var width = size.width;
    var heightOffset = height * 0.2;
    path.lineTo(0, height - heightOffset);
    path.quadraticBezierTo(
        width * 0.25, height, width * 0.5, height - heightOffset);

    // path.lineTo(width, 0);
    path.quadraticBezierTo(width * 0.75, height - (heightOffset * 2), width,
        height - heightOffset);
    path.lineTo(width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
