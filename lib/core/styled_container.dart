import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class StyledContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool isSelected; // Añade este parámetro

  const StyledContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.margin = EdgeInsets.zero,
    this.isSelected = false, // Valor por defecto
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.backgroundComponentsSelected
            : AppColors.backgrounComponents,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? Colors
                    .white // Borde más visible cuando está seleccionado
              : const Color(0xFFCAAFAF),
          width: 5,
        ),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
