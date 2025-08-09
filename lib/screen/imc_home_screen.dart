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
  int selectedWeight = 60;
  int selectedAge = 25;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF2B0124),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.02),
              GenderSelector(),
              SizedBox(height: size.height * 0.03),
              HeighSelector(
                selectedHeight: selectedHeight,
                onHeightChange: (newHeight) {
                  setState(() {
                    selectedHeight = newHeight;
                  });
                },
              ),
              SizedBox(height: size.height * 0.03),
              DatesSelector(
                onWeightChange: (newWeight) {
                  setState(() {
                    selectedWeight = newWeight;
                  });
                },
                onAgeChange: (newAge) {
                  setState(() {
                    selectedAge = newAge;
                  });
                },
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: isSmallScreen ? 60 : 80,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF91037B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(
                        color: Color(0xFFB40196),
                        width: 3,
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
