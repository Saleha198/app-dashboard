import 'package:fl_chart/fl_chart.dart';

class LineData {
  final List<FlSpot> spots = [
    FlSpot(0.0, 15.0), // Jan
    FlSpot(1.0, 18.0), // Feb
    FlSpot(2.0, 20.0), // Mar
    FlSpot(3.0, 16.0), // Apr
    FlSpot(4.0, 22.0), // May
    FlSpot(5.0, 25.0), // Jun
    FlSpot(6.0, 23.0), // Jul
    FlSpot(7.0, 19.0), // Aug
    FlSpot(8.0, 17.0), // Sep
    FlSpot(9.0, 21.0), // Oct
    FlSpot(10.0, 23.0), // Nov
    FlSpot(11.0, 24.0), // Dec
  ];

  final Map<int, String> leftTitle = {
    0: '0k',
    5: '5k',
    10: '10k',
    15: '15k',
    20: '20k',
    25: '25k',
  };

  final Map<int, String> bottomTitle = {
    0: 'Jan',
    1: 'Feb',
    2: 'Mar',
    3: 'Apr',
    4: 'May',
    5: 'Jun',
    6: 'Jul',
    7: 'Aug',
    8: 'Sep',
    9: 'Oct',
    10: 'Nov',
    11: 'Dec',
  };
}
