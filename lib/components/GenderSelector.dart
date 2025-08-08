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

  Widget _buildGenderOption(
    String gender,
    String imageAsset,
    double iconSize,
    double fontSize,
  ) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: iconSize * 0.08, // padding proporcional
          vertical: iconSize * 0.16,
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = gender;
            });
          },
          child: StyledContainer(
            isSelected: selectedGender == gender,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset,
                  height: iconSize,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error_outline, size: iconSize),
                ),
                SizedBox(height: iconSize * 0.08),
                Text(
                  gender.toUpperCase(),
                  style: TextStyles.bodyTextBold.copyWith(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Tamaños adaptativos
    double iconSize = screenWidth * 0.22; // imágenes ~22% del ancho de pantalla
    double fontSize = screenWidth * 0.045; // texto ~4.5% del ancho

    return Row(
      children: [
        _buildGenderOption(
          'Hombre',
          'assets/images/male.png',
          iconSize,
          fontSize,
        ),
        _buildGenderOption(
          'Mujer',
          'assets/images/female.png',
          iconSize,
          fontSize,
        ),
      ],
    );
  }
}
