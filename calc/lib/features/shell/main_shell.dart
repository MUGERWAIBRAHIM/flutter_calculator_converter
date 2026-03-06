import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../calculator/presentation/calculator_screen.dart';
import '../converter/presentation/converter_home.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0; // 0 = Converter, 1 = Calculator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null, // Removed back button
        title: const Text(""),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildToggle(),
          Expanded(
            child: selectedIndex == 0
                ? const ConverterHome()
                : const CalculatorScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _toggleButton("Converter", 0),
          _toggleButton("Calculator", 1),
        ],
      ),
    );
  }

  Widget _toggleButton(String title, int index) {
    final bool active = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: active
                    ? Colors.black
                    : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}