import 'package:flutter/material.dart';
import 'package:dash_board/model/health_model.dart';

class CardViewItem extends StatelessWidget {
  final HealthModel healthModel;
  final double iconSize;
  final double textSize;
  final EdgeInsets padding;

  const CardViewItem({
    Key? key,
    required this.healthModel,
    required this.iconSize,
    required this.textSize,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    // Define responsive dimensions based on screen size
    final cardWidth = isMobile ? 150.0 : 200.0;
    final cardHeight = isMobile ? 120.0 : 130.0;
    final iconSize = isMobile ? 30.0 : 30.0;
    final textSize = isMobile ? 12.0 : 14.0;
    final padding = isMobile ? EdgeInsets.all(8.0) : EdgeInsets.all(12.0);

    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: EdgeInsets.symmetric(horizontal: isMobile ? 8.0 : 16.0),
      padding: padding,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 78, 202, 240), // Blue background color
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
            child: Image.asset(
              healthModel.icon,
              width: iconSize,
              height: iconSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Text(
              healthModel.value,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            healthModel.title,
            style: TextStyle(
              fontSize: textSize - 2,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
