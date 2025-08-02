import 'package:dash_board/widget/pie_chart_widget.dart'; // Import your Pie Chart widget here
import 'package:flutter/material.dart';
import 'package:dash_board/widget/summary_details.dart';

class SummaryWidget extends StatelessWidget {
  SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile =
        mediaQuery.size.width < 600; // Example breakpoint for mobile

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Conditionally layout for mobile vs desktop
          isMobile
              ? Column(
                  children: [
                    Container(
                      height: 150,
                      padding: const EdgeInsets.only(right: 8),
                      child: Chart(), // Your Pie Chart widget
                    ),
                    SizedBox(height: 4), // Reduced spacing
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          SummaryDetails(), // SummaryDetails displayed below the chart
                    ),
                  ],
                )
              : Column(
                  children: [
                    Chart(), // Your Pie Chart widget
                    SizedBox(height: 45), // Adjust spacing for desktop
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          SummaryDetails(), // SummaryDetails displayed below the chart
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
