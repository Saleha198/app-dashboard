import 'package:dash_board/widget/custom_card_Widget.dart';
import 'package:flutter/material.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    // Responsive values
    final textStyleKey = TextStyle(
      fontSize: isMobile ? 5 : 7, // Smaller font size for mobile
      color: Color.fromARGB(255, 69, 68, 68),
    );

    final textStyleValue = TextStyle(
      fontSize: isMobile ? 5 : 7, // Smaller font size for mobile
      color: Colors.white,
    );

    final padding = EdgeInsets.symmetric(
      horizontal: isMobile ? 4.0 : 8.0, // Smaller horizontal padding for mobile
    );

    return Container(
      constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : 700,
          maxHeight: isMobile ? 41 : 44 // Maximum width constraint
          ),
      child: CustomCardWidget(
        color: Color.fromARGB(255, 64, 199, 240),
        borderRadius: null,
        borderColor: null,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildDetails('PROJECTS', '12', textStyleKey, textStyleValue),
              buildDetails('UNITS', '10', textStyleKey, textStyleValue),
              buildDetails('AVAILABLE', '7', textStyleKey, textStyleValue),
              buildDetails('SOLD', '5', textStyleKey, textStyleValue),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetails(
      String key, String value, TextStyle keyStyle, TextStyle valueStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          key,
          style: keyStyle,
        ),
        Text(
          value,
          style: valueStyle,
        ),
      ],
    );
  }
}
