import 'package:flutter/material.dart';
import 'package:speedometer_chart/src/components/arc.dart';
import 'package:speedometer_chart/src/components/pointer.dart';
import 'package:speedometer_chart/src/utils/dimension.dart';

class SpeedometerChart extends StatefulWidget {
  /// The size of the speedometer chart
  final double dimension;

  /// The size of the speedometer chart
  final double minValue;

  /// The minimum value of the chart
  final double maxValue;

  /// The current value of the chart
  final double value;

  /// The Widget to display the minimum value
  final Widget? minWidget;

  /// The Widget to display the maximum value
  final Widget? maxWidget;

  /// A list of colors for the chart scale
  final List<Color> graphColor;

  /// The color of the pointer
  final Color pointerColor;

  /// The Widget to display the current value
  final Widget? valueWidget;

  /// The title of the chart
  final Text? title;

  /// The title margin of the chart
  final double titleMargin;

  /// The duration of the chart animation
  final int animationDuration;

  /// Define if the tick arc has white space
  final bool hasTickSpace;

  /// Define the image of the pointer
  final bool hasIconPointer;

  final bool _isShaderConstructor;

  const SpeedometerChart({
    super.key,
    this.dimension = graphDimension,
    this.minValue = minGraphValue,
    this.maxValue = maxGraphValue,
    this.value = 0,
    this.minWidget,
    this.maxWidget,
    this.graphColor = const [Colors.red, Colors.yellow, Colors.green],
    this.pointerColor = Colors.black,
    this.valueWidget,
    this.title,
    this.titleMargin = 10,
    this.animationDuration = 2000,
    this.hasIconPointer = true,
  })  : assert(value >= 0 && value <= maxValue),
        _isShaderConstructor = true,
        hasTickSpace = false;

  const SpeedometerChart.tick({
    super.key,
    this.dimension = graphDimension,
    this.minValue = minGraphValue,
    this.maxValue = maxGraphValue,
    this.value = 0,
    this.minWidget,
    this.maxWidget,
    this.pointerColor = Colors.black,
    this.valueWidget,
    this.title,
    this.titleMargin = 10,
    this.animationDuration = 2000,
    this.hasTickSpace = false,
    this.hasIconPointer = true,
  })  : assert(value >= 0 && value <= maxValue),
        graphColor = const [],
        _isShaderConstructor = false;

  @override
  State createState() => _SpeedometerChartState();
}

class _SpeedometerChartState extends State<SpeedometerChart> {
  late double constValue;

  double get _valueConverter => (((constValue * 2) * widget.value) / widget.maxValue) - constValue;

  @override
  void initState() {
    super.initState();
    constValue = widget.hasIconPointer ? 1.73 : 1.57;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: -constValue, end: _valueConverter),
      duration: Duration(milliseconds: widget.animationDuration),
      builder: (context, value, child) => SizedBox(
        width: widget.dimension,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null)
              Padding(
                padding: EdgeInsets.only(bottom: widget.titleMargin),
                child: widget.title,
              ),
            Stack(
              alignment: Alignment.center,
              children: [
                widget._isShaderConstructor
                    ? Arc(
                        dimension: widget.dimension,
                        shader: widget.graphColor,
                      )
                    : Arc.tick(
                        dimension: widget.dimension,
                        hasTickSpace: widget.hasTickSpace,
                      ),
                Positioned(
                  bottom: 0,
                  child: Transform.rotate(
                    angle: value,
                    origin: widget.hasIconPointer ? Offset(0, -(widget.dimension / 27.3)) : null,
                    alignment: Alignment.bottomCenter,
                    child: widget.hasIconPointer
                        ? Pointer(
                            dimension: widget.dimension / 4,
                            pointerColor: widget.pointerColor,
                          )
                        : Pointer.line(
                            dimension: widget.dimension / 4,
                            pointerColor: widget.pointerColor,
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: widget.minWidget != null,
                    child: SizedBox(
                      width: widget.dimension / 4.3,
                      child: Center(
                        child: widget.minWidget,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: widget.valueWidget != null,
                      replacement: Container(),
                      child: Center(
                        child: widget.valueWidget,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.maxWidget != null,
                    child: SizedBox(
                      width: widget.dimension / 4.3,
                      child: Center(child: widget.maxWidget),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
