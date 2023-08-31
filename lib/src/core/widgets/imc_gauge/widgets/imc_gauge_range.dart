import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {
  ImcGaugeRange({required Color color, required double startValue, required double endValue, required String label, super.key})
      : super(
          startValue: startValue,
          endValue: endValue,
          color: color,
          label: label,
          sizeUnit: GaugeSizeUnit.factor,
          labelStyle: const GaugeTextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Times'),
          startWidth: 0.65,
          endWidth: 0.65,
        );
}
