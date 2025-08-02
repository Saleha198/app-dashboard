import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final List<PieChartSectionData> pieChartSectionDatas = [
    PieChartSectionData(
      color: Colors.blue,
      value: 30,
      title: '30',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 50,
      title: '50',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 70,
      title: '70',
      radius: 50,
      titleStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  ];
}
