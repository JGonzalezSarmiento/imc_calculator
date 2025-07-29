import 'package:flutter/material.dart';
import 'package:imc_calculator/core/styled_container.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  Widget _buildGenderOption(String gender, String imageAsset) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = gender;
            });
          },
          child: StyledContainer(
            isSelected: selectedGender == gender,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error_outline, size: 100),
                ),
                const SizedBox(height: 8),
                Text(gender.toUpperCase(), style: TextStyles.bodyTextBold),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildGenderOption('Hombre', 'assets/images/male.png'),
        _buildGenderOption('Mujer', 'assets/images/female.png'),
      ],
    );
  }
}
