import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ButtStyles extends StatelessWidget {
  final Widget content;
  final bool isSelected;
  final VoidCallback? onTap;

  const ButtStyles({
    super.key,
    required this.content,
    this.isSelected = false, // ✅ Solo una vez
    this.onTap,
    required Text child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.backgroundComponentsSelected
                  : AppColors.backgrounComponents,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFCAAFAF), width: 5),
            ),
            child: Padding(padding: const EdgeInsets.all(12), child: content),
          ),
        ),
      ),
    );
  }
}
