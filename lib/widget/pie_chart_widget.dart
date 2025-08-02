import 'package:dash_board/Data/pie_chart_data.dart';
import 'package:dash_board/const/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    // Chart data
    final chartData = ChartData();

    // Text styles
    final percentageTextStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: isMobile ? 12 : 15,
      height: 0.5,
    );

    final ofTotalTextStyle = TextStyle(
      color: const Color.fromARGB(228, 158, 158, 158),
      fontSize: isMobile ? 10 : 10,
    );

    // Adjust chart size based on the device type
    final chartSize = isMobile ? 100.0 : 50.0;
    final centerSpaceRadius = isMobile ? 35.0 : 22.0;

    return Center(
      child: SizedBox(
        width: chartSize,
        height: chartSize,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sections: chartData.pieChartSectionDatas,
                sectionsSpace: 0,
                centerSpaceRadius: centerSpaceRadius,
                startDegreeOffset: -90,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "70%",
                    style: percentageTextStyle,
                  ),
                  SizedBox(
                    height: isMobile ? 4.0 : 8.0,
                  ),
                  Text(
                    "of 100%",
                    style: ofTotalTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
