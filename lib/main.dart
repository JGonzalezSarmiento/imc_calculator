import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/screen/imc_home_screen.dart';
import 'package:imc_calculator/components/GenderSelector.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: const Text(
            'IMC Calculator',
            style: TextStyle(color: AppColors.primaryText),
          ),
        ),
        backgroundColor: AppColors.backgroundApp,
        body: ImcHomeScreen(),
      ),
    );
  }
}
