import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class gauge extends StatefulWidget {
  double value;
  String title;
  String unit;
  Color color1;
  Color color2;
  Color color3;
  double startValue;
  double endValue;
  double value1;
  double value2;
  double checkValue;

  gauge({
    super.key,
    required this.value,
    required this.title,
    required this.unit,
    this.color1 = Colors.green,
    this.color2 = Colors.orange,
    this.color3 = Colors.red,
    this.startValue = 0,
    this.endValue = 100,
    this.value1 = 33,
    this.value2 = 66,
    this.checkValue = 0,
  });

  @override
  State<gauge> createState() => _gaugeState();
}

class _gaugeState extends State<gauge> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        title: GaugeTitle(
            text: widget.title,
            textStyle: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
            alignment: GaugeAlignment.center),
        axes: <RadialAxis>[
          RadialAxis(
              minimum: widget.startValue,
              maximum: widget.endValue,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: widget.startValue,
                    endValue: widget.value1,
                    color: widget.color1,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: widget.value1,
                    endValue: widget.value2,
                    color: widget.color2,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: widget.value2,
                    endValue: widget.endValue,
                    color: widget.color3,
                    startWidth: 10,
                    endWidth: 10)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: widget.value ?? 0)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: widget.checkValue > 0 &&
                            widget.value > widget.checkValue
                        ? Text(widget.value.toString() + widget.unit,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                        : Text(widget.value.toString() + widget.unit,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 1)
              ])
        ]);
  }
}
