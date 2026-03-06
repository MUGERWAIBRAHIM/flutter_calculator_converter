import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isOperator;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isOperator = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isOperator
                  ? AppColors.accent
                  : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
