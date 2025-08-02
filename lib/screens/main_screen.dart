import 'package:dash_board/paycard.dart';
import 'package:flutter/material.dart';
import 'package:dash_board/widget/Activitydetailedcard.dart';
import 'package:dash_board/widget/DashboardWidget.dart';
import 'package:dash_board/widget/side_menu_widget.dart';
import 'package:dash_board/widget/summary_widget.dart';
// Ensure you have this import

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!isMobile)
              Text(
                'SAIF GROUP OF REAL ESTATE',
                style: TextStyle(color: Colors.white),
              ),
            if (!isMobile) // Add an empty space to balance the Row for desktop
              SizedBox(width: 48),
            if (isMobile)
              Text(
                'SAIF GROUP OF REAL ESTATE',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ), // Width of the IconButton for alignment
          ],
        ),
        backgroundColor: Color.fromARGB(255, 78, 202, 240),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/real1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Welcome, User',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SideMenuWidget(),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: isMobile
            ? Column(
                children: [
                  Expanded(
                    flex: 3, // Larger flex for DashboardWidget
                    child: Dashboardwidget(),
                  ),
                  SizedBox(
                    height: 4.0, // Reduced height to bring widgets closer
                  ),
                  Paycard(), // Place Paycard widget
                  SizedBox(
                    height: 4.0, // Reduced height to bring widgets closer
                  ),
                  Expanded(
                    flex: 4, // Smaller flex for SummaryWidget
                    child: SummaryWidget(),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    flex: 2, // Flex for ActivityDetailedCard
                    child:
                        ActivityDetailedCard(), // Ensure this widget is defined
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Paycard(), //
                  // Place Paycard widget
                  SizedBox(
                    height: 24,
                  ),
                  Expanded(
                    flex: 3, // Flex for SummaryWidget
                    child: SummaryWidget(),
                  ),
                ],
              ),
      ),
    );
  }
}
