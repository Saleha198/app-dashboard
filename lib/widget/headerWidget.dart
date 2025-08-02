import 'package:dash_board/const/constant.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white, // White background color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(isMobile ? 8.0 : 12.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(isMobile ? 8.0 : 12.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: isMobile ? 10 : 12),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.grey[600], // Hint text color
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue, // Icon color
                  size: isMobile ? 18 : 21,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
