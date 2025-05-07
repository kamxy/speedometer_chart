import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedometer_chart/src/utils/dimension.dart';

class Pointer extends StatelessWidget {
  final double dimension;
  final Color pointerColor;
  final bool hasIconPointer;

  const Pointer({
    super.key,
    required this.dimension,
    required this.pointerColor,
  }) : hasIconPointer = true;

  const Pointer.line({
    super.key,
    required this.dimension,
    required this.pointerColor,
  }) : hasIconPointer = false;

  @override
  Widget build(BuildContext context) {
    return hasIconPointer
        ? SvgPicture.asset(
          "assets/pointer.svg",
          package: "speedometer_chart",
          height: dimension,
          colorFilter: ColorFilter.mode(pointerColor, BlendMode.srcIn),
        )
        : CustomPaint(
          size: Size(dimension, dimension * 2),
          painter: DrawTriangle(pointerColor),
        );
  }
}

class DrawTriangle extends CustomPainter {
  final Color pointerColor;

  DrawTriangle(this.pointerColor);

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width / 2 + size.width / pointerWidth, 0);
    path.lineTo(size.width / 2 - size.width / pointerWidth, 0);
    path.lineTo(size.width / 2, size.height);
    canvas.drawPath(path, Paint()..color = pointerColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
