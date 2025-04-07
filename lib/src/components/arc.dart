import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Arc extends StatelessWidget {
  final double dimension;
  final List<Color> shader;
  final bool _isShaderConstructor;
  final bool hasTickSpace;

  const Arc({super.key, required this.dimension, required this.shader})
    : _isShaderConstructor = true,
      hasTickSpace = false;

  const Arc.tick({
    super.key,
    required this.dimension,
    required this.hasTickSpace,
  }) : shader = const [Colors.red, Colors.yellow, Colors.green],
       _isShaderConstructor = false;

  @override
  Widget build(BuildContext context) {
    return _isShaderConstructor
        ? ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback:
              (bounds) => LinearGradient(colors: shader).createShader(bounds),
          child: SvgPicture.asset(
            "assets/arc.svg",
            package: "speedometer_chart",
            width: dimension,
            height: dimension / 2,
          ),
        )
        : SvgPicture.asset(
          hasTickSpace
              ? "assets/arc_tick_4_custom.svg"
              : "assets/arc_tick_1.svg",
          package: "speedometer_chart",
          width: dimension,
          height: dimension / 2,
        );
  }
}
