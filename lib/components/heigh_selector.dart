import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeighSelector extends StatefulWidget {
  final double selectedHeight;
  final ValueChanged<double> onHeightChange;

  const HeighSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChange,
  });

  @override
  State<HeighSelector> createState() => _HeighSelectorState();
}

class _HeighSelectorState extends State<HeighSelector> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Escalas proporcionales al ancho de pantalla
    double titleFontSize = screenWidth * 0.05; // ~5% del ancho
    double valueFontSize = screenWidth * 0.09; // ~9% del ancho
    double horizontalPadding = screenWidth * 0.04;
    double verticalPadding = screenWidth * 0.04;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgrounComponents,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFB40196), width: 3),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Column(
            children: [
              Text(
                'Altura'.toUpperCase(),
                style: TextStyles.bodyTextBold.copyWith(
                  fontSize: titleFontSize,
                ),
              ),
              Text(
                '${widget.selectedHeight.toStringAsFixed(0)} cms',
                style: TextStyles.bodyTextBold.copyWith(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight:
                      screenWidth * 0.015, // grosor de la barra adaptativo
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius:
                        screenWidth * 0.025, // tamaño del control
                  ),
                ),
                child: Slider(
                  value: widget.selectedHeight,
                  onChanged: widget.onHeightChange,
                  min: 150,
                  max: 220,
                  divisions: 70,
                  label: '${widget.selectedHeight.toStringAsFixed(0)} cms',
                  activeColor: const Color(0xC5F36BF3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
