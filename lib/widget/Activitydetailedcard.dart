import 'package:dash_board/Data/health_detail.dart';
import 'package:dash_board/card.dart';
import 'package:flutter/material.dart';
import 'package:dash_board/model/health_model.dart';
// Adjust the import path accordingly

class ActivityDetailedCard extends StatefulWidget {
  const ActivityDetailedCard({super.key});

  @override
  _ActivityDetailedCardState createState() => _ActivityDetailedCardState();
}

class _ActivityDetailedCardState extends State<ActivityDetailedCard> {
  HealthDetail healthDetail = HealthDetail();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // await healthDetail.fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    // Dimensions
    final cardWidth = isMobile ? 150.0 : 200.0;
    final cardHeight = isMobile ? 120.0 : 140.0;
    final iconSize = isMobile ? 40.0 : 40.0;
    final textSize = isMobile ? 14.0 : 14.0;
    final margin = isMobile ? 8.0 : 16.0;

    return Container(
      height: cardHeight + 40, // Adjusted height to include padding
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: healthDetail.healthData.map((healthModel) {
            return Container(
              width: cardWidth,
              height: cardHeight,
              margin: EdgeInsets.symmetric(horizontal: margin),
              child: CardViewItem(
                healthModel: healthModel,
                iconSize: iconSize,
                textSize: textSize,
                padding: EdgeInsets.all(8.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
