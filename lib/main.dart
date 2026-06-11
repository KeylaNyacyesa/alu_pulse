import 'package:flutter/material.dart';
import 'pages/main_navigation.dart';

void main() {
  runApp(const ALUPulseApp());
}

/// Root widget for the ALU Pulse application.
/// This replaces the default Flutter counter app.
class ALUPulseApp extends StatelessWidget {
  const ALUPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALU Pulse',

      /// Removes the debug banner from the top-right corner.
      debugShowCheckedModeBanner: false,

      /// Dark theme based on the Figma color palette:
      /// deep navy blue background with yellow accent color.
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF071222),
        primaryColor: const Color(0xFFFFBE22),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),

      home: const MainNavigation(),
    );
  }
}
