import 'package:dash_board/Data/Line_Chart_Data.dart';
import 'package:dash_board/const/constant.dart';
import 'package:dash_board/widget/custom_card_Widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    final titleSize = isMobile ? 14.0 : 16.0;
    final aspectRatio = isMobile ? 16 / 8 : 17 / 4.3;
    final cardPadding = isMobile ? EdgeInsets.all(12.0) : EdgeInsets.all(12.0);
    final borderColor = Colors.blue.shade700; // Blue border color

    final data = LineData();

    return CustomCardWidget(
      color: Colors.transparent, // Card background color
      padding: cardPadding,
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      borderColor: Colors.transparent, // Blue border color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Project Overview",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade700, // Blue text color
            ),
          ),
          const SizedBox(height: 4), // Reduced space between title and chart
          AspectRatio(
            aspectRatio: aspectRatio,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  horizontalInterval: 5, // Interval for horizontal dotted lines
                  verticalInterval: 1, // Interval for vertical dotted lines
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(
                          0.6), // Darker color for horizontal lines
                      strokeWidth: 1,
                      dashArray: [4, 4], // Dotted line style
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey
                          .withOpacity(0.6), // Darker color for vertical lines
                      strokeWidth: 1,
                      dashArray: [4, 4], // Dotted line style
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.bottomTitle[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  data.bottomTitle[value.toInt()].toString(),
                                  style: TextStyle(
                                    fontSize: isMobile ? 10 : 14,
                                    color: Colors.grey[900], // Title text color
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.leftTitle[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  data.leftTitle[value.toInt()].toString(),
                                  style: TextStyle(
                                    fontSize: isMobile ? 10 : 14,
                                    color: Colors.grey[900], // Title text color
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                      interval: 5,
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                      color: borderColor, width: 1.5), // Blue border color
                ),
                lineBarsData: [
                  LineChartBarData(
                    color: Colors.blue.shade700, // Line color
                    barWidth: 2.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade700.withOpacity(0.3),
                          Colors.transparent,
                        ],
                      ),
                      show: true,
                    ),
                    dotData: FlDotData(show: false),
                    spots: data.spots,
                  ),
                ],
                minX: 0,
                maxX: 11,
                maxY: 30,
                minY: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
