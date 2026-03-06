// filepath: c:\Users\IBRA\Desktop\MESOB_CALC\calc\lib\features\calculator\presentation\calculator_screen.dart
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'calculator_button.dart';
import 'calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic _logic = CalculatorLogic();

  void _onTap(String value) {
    setState(() {
      switch (value) {
        case "C":
          _logic.clear();
          break;
        case "=":
          _logic.evaluate();
          break;
        case "±":
          _logic.toggleSign();
          break;
        case "%":
          _logic.percentage();
          break;
        default:
          _logic.input(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _display(),
        _keypad(),
      ],
    );
  }

  Widget _display() {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.all(16), // Reduced padding for more space
        alignment: Alignment.bottomRight,
        child: SingleChildScrollView( // Allow scroll only if absolutely necessary, but aim to fit
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _logic.expression,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 20, // Slightly smaller font for better fit
                ),
                textAlign: TextAlign.right,
                softWrap: true,
              ),
              const SizedBox(height: 8),
              Text(
                _logic.result,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 32, // Slightly smaller font for better fit
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _keypad() {
    final buttons = [
      "C", "±", "%", "÷",
      "7", "8", "9", "×",
      "4", "5", "6", "−",
      "1", "2", "3", "+",
      "0", ".", "=",
    ];

    return Expanded(
      flex: 3, // Reduced flex to allocate more space to display and ensure keypad fits
      child: Padding(
        padding: const EdgeInsets.all(8), // Reduced padding
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(), // Prevent scrolling to ensure it fits
          shrinkWrap: true, // Allow GridView to size itself to content
          itemCount: buttons.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6, // Reduced spacing
            mainAxisSpacing: 6, // Reduced spacing
            childAspectRatio: 1.6, // Adjusted for smaller buttons
          ),
          itemBuilder: (context, index) {
            final text = buttons[index];
            final isOperator = "÷×−+=".contains(text);

            // Special handling for last row to prevent overflow
            if (index >= 16) { // Last row: 0, ., =
              return CalculatorButton(
                text: text,
                isOperator: isOperator,
                onTap: () => _onTap(text),
              );
            }
            return CalculatorButton(
              text: text,
              isOperator: isOperator,
              onTap: () => _onTap(text),
            );
          },
        ),
      ),
    );
  }
}