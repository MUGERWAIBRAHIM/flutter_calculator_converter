// filepath: c:\Users\IBRA\Desktop\MESOB_CALC\calc\lib\main.dart
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/shell/splash_screen.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
