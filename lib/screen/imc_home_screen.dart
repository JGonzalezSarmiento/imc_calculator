import 'package:flutter/material.dart';
import 'package:imc_calculator/components/GenderSelector.dart';
import 'package:imc_calculator/components/dates_selector.dart';
import 'package:imc_calculator/components/heigh_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screen/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  double selectedHeight = 160;
  int selectedWeight = 25;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 600;

    return Scaffold(
      backgroundColor: AppColors.backgroundApp,
      body: SafeArea(
        child: SingleChildScrollView(
          // Scroll para evitar overflow
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),

              // Selector de género
              GenderSelector(),

              SizedBox(height: size.height * 0.03),

              // Selector de altura
              HeighSelector(
                selectedHeight: selectedHeight,
                onHeightChange: (newHeight) {
                  setState(() {
                    selectedHeight = newHeight;
                  });
                },
              ),

              SizedBox(height: size.height * 0.03),

              // Selector de edad/fechas
              DatesSelector(),

              SizedBox(height: size.height * 0.05),

              // Botón Calcular
              SizedBox(
                height: isSmallScreen ? 60 : 80,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgrounComponents,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(
                        color: Color(0xFFCAAFAF),
                        width: 5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImcResultScreen(
                          height: selectedHeight,
                          weight: selectedWeight,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyles.bodyTextBold.copyWith(
                      fontSize: isSmallScreen ? 18 : 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
