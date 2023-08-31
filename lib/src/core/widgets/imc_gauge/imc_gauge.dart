import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'widgets/imc_gauge_range.dart';

class ImcGauge extends StatelessWidget {
  final double imc;

  const ImcGauge({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          showLabels: false,
          showTicks: false,
          showAxisLine: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            ImcGaugeRange(
              color: Colors.blue,
              startValue: 12.5,
              endValue: 18.5,
              label: 'MAGREZA',
            ),
            ImcGaugeRange(
              color: Colors.blue,
              startValue: 18.5,
              endValue: 24.5,
              label: 'NORMAL',
            ),
            ImcGaugeRange(
              color: Colors.yellow,
              startValue: 24.5,
              endValue: 29.9,
              label: 'SOBREPESO',
            ),
            ImcGaugeRange(
              color: Colors.red.shade500,
              startValue: 29.9,
              endValue: 39.9,
              label: 'OBESIDADE',
            ),
            ImcGaugeRange(
              color: Colors.red.shade900,
              startValue: 39.9,
              endValue: 47.9,
              label: 'OBESIDADE GRAVE',
            ),
          ],
          pointers: [
            NeedlePointer(
              value: imc,
              enableAnimation: true,
            ),
          ],
        )
      ],
    );
  }
}
