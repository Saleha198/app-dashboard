import 'package:dash_board/widget/Activitydetailedcard.dart';
import 'package:dash_board/widget/Line_Chart_Card.dart';
import 'package:dash_board/widget/headerWidget.dart';
import 'package:flutter/material.dart';

class Dashboardwidget extends StatelessWidget {
  const Dashboardwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    // Responsive values
    final headerPadding = isMobile
        ? EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0) // Reduced vertical padding for mobile
        : EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0);

    final cardPadding = isMobile
        ? EdgeInsets.symmetric(
            horizontal: 4.0, vertical: 4.0) // Adjusted padding for mobile
        : EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

    final lineChartSpacing =
        isMobile ? 4.0 : 16.0; // Reduced spacing for mobile

    return CustomScrollView(
      slivers: [
        // HeaderWidget Section
        SliverPadding(
          padding: headerPadding,
          sliver: SliverToBoxAdapter(
            child: HeaderWidget(),
          ),
        ),

        // ActivityDetailedCard Section
        SliverPadding(
          padding: cardPadding.copyWith(
              top: isMobile ? 4.0 : 16.0), // Adjust top padding for mobile
          sliver: SliverToBoxAdapter(
            child: ActivityDetailedCard(),
          ),
        ),

        // Spacer to adjust space before LineChartCard
        // SliverPadding(
        //   padding: EdgeInsets.symmetric(vertical: lineChartSpacing),
        //   sliver: SliverToBoxAdapter(
        //     child: const LineChartCard(),
        //   ),
        // ),
      ],
    );
  }
}
