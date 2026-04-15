import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hana Game Studio - Kaloritë',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Chalkboard', // Referenca te assets/fonts/chalkboard_se_bold.ttf
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}
