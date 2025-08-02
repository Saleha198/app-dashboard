import 'package:dash_board/Data/bar-graph-data.dart';

import 'package:dash_board/model/graphmodel.dart';
import 'package:dash_board/widget/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final barGraphData = BarGraphData();

    return GridView.builder(
      itemCount: barGraphData.data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, index) {
        final barGraphModel = barGraphData.data[index];

        return CustomCardWidget(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  barGraphModel.label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BarChart(
                  BarChartData(
                    barGroups:
                        _chartGroups(barGraphModel.graph, barGraphModel.color),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chartGroups(
      List<GraphModel> points, Color barColor) {
    return points.map((point) {
      return BarChartGroupData(
        x: point.x,
        barRods: [
          BarChartRodData(
            toY: point.y,
            color: barColor,
            width: 15,
          ),
        ],
      );
    }).toList();
  }
}
