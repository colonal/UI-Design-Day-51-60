import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ui_design_day_51_60/day56/data/data.dart';



class DigitalCurrencyChart extends StatefulWidget {
  final Tokens tokens;
  const DigitalCurrencyChart({required this.tokens, super.key});

  @override
  State<DigitalCurrencyChart> createState() => _DigitalCurrencyChartState();
}

class _DigitalCurrencyChartState extends State<DigitalCurrencyChart> {
  late  List<ChartSeries<CurrencyValue, DateTime>> series;

  @override
  void initState() {
    series = [
    SplineSeries<CurrencyValue, DateTime>(
      dataSource: widget.tokens.data,
      xValueMapper: (CurrencyValue value, _) => value.date,
      yValueMapper: (CurrencyValue value, _) => value.value,
      color: widget.tokens.state == TokensState.up
                          ? const Color(0xFF0AFF96)
                          : const Color(0xFFFF002E),
      width: 2,
      markerSettings:null,
    )
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderColor: Colors.transparent,
      plotAreaBorderColor: Colors.transparent,
      plotAreaBackgroundColor: Colors.transparent,
      primaryXAxis: DateTimeAxis(
        labelIntersectAction: AxisLabelIntersectAction.hide,
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        labelIntersectAction: AxisLabelIntersectAction.hide,
        isVisible: false,
      ),
      series: series,
    );
  }
}
