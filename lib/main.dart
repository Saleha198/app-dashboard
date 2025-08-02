import 'package:flutter/material.dart';
import 'package:dash_board/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAIF GROUP OF REAL ESTATE',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(background: Colors.white),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
