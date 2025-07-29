import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeighSelector extends StatefulWidget {
  final double selectedHeight;
  final ValueChanged<double> onHeightChange; // Añade este parámetro

  const HeighSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChange, // Hazlo requerido
  });

  @override
  State<HeighSelector> createState() => _HeighSelectorState();
}

class _HeighSelectorState extends State<HeighSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgrounComponents,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFCAAFAF), width: 5),
        ),
        child: Column(
          children: [
            Text(
              'Altura'.toUpperCase(),
              style: TextStyles.bodyTextBold.copyWith(fontSize: 20),
            ),
            Text(
              '${widget.selectedHeight.toStringAsFixed(0)} cms',
              style: TextStyles.bodyTextBold.copyWith(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              value: widget.selectedHeight,
              onChanged: widget.onHeightChange,

              min: 150,
              max: 220,
              divisions: 70,
              label: '${widget.selectedHeight.toStringAsFixed(0)} cms',
              activeColor: const Color(0xC5F36BF3),
            ),
          ],
        ),
      ),
    );
  }
}
