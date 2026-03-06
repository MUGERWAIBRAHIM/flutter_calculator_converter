// filepath: c:\Users\IBRA\Desktop\MESOB_CALC\calc\lib\features\converter\presentation\converter_home.dart
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import 'converter_screen.dart';

class ConverterHome extends StatelessWidget {
  const ConverterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CategorySection(
          title: "Basic",
          items: [
            "Area",
            "Length",
            "Volume",
            "Temperature",
            "Time",
          ],
        ),
        CategorySection(
          title: "Science",
          items: [
            "Pressure",
            "Force",
            "Density",
            "Energy",
            "Heat Capacity",
            "Frequency",
            "Surface Tension",
            "Dynamic Viscosity",
            "Torque",
            "Inertia",
            "Magnet",
          ],
        ),
        CategorySection(
          title: "Electricity",
          items: [
            "Current",
            "Inductance",
            "Power",
            "Resistance",
            "Capacitance",
            "Conductance",
            "Charge",
          ],
        ),
        CategorySection(
          title: "Environment",
          items: [
            "Light Illumination",
            "Radiation",
          ],
        ),
        CategorySection(
          title: "Mobility",
          items: [
            "Speed",
            "Fuel Consumption",
          ],
        ),
        CategorySection(
          title: "Other",
          items: [
            "Data Storage",
            "Cooking",
          ],
        ),
      ],
    );
  }
}

// ...existing code...

class CategorySection extends StatelessWidget {
  final String title;
  final List<String> items;

  const CategorySection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to converter screen for all types
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConverterScreen(type: items[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}