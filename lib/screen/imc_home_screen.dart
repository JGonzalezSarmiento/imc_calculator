import 'package:flutter/material.dart';
import 'package:imc_calculator/components/GenderSelector.dart';
import 'package:imc_calculator/components/dates_selector.dart';
import 'package:imc_calculator/components/heigh_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_style.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  double selectedHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GenderSelector(),
          HeighSelector(
            selectedHeight: selectedHeight,
            onHeightChange: (newHeight) {
              setState(() {
                selectedHeight = newHeight;
              });
            },
          ),
          DatesSelector(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
              bottom: 32,
              right: 8,
            ),
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgrounComponents,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFFCAAFAF), width: 5),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Calcular',
                  style: TextStyles.bodyTextBold.copyWith(fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
