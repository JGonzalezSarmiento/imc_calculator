import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/styled_container.dart';
import 'package:imc_calculator/core/circle_icon_button.dart';

class DatesSelector extends StatefulWidget {
  final ValueChanged<int> onWeightChange;
  final ValueChanged<int> onAgeChange;

  const DatesSelector({
    super.key,
    required this.onWeightChange,
    required this.onAgeChange,
  });

  @override
  State<DatesSelector> createState() => _DatesSelectorState();
}

class _DatesSelectorState extends State<DatesSelector> {
  int peso = 60;
  int edad = 25;

  // Validación de valores con límites realistas y comunicación al padre
  void _incrementPeso() {
    setState(() {
      if (peso < 200) peso++;
      widget.onWeightChange(peso);
    });
  }

  void _decrementPeso() {
    setState(() {
      if (peso > 30) peso--;
      widget.onWeightChange(peso);
    });
  }

  void _incrementEdad() {
    setState(() {
      if (edad < 120) edad++;
      widget.onAgeChange(edad);
    });
  }

  void _decrementEdad() {
    setState(() {
      if (edad > 1) edad--;
      widget.onAgeChange(edad);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Escalas dinámicas
    double titleFontSize = screenWidth * 0.04; // ~4% ancho
    double valueFontSize = screenWidth * 0.07; // ~7% ancho
    double spacing = screenWidth * 0.025;
    double iconSpacing = screenWidth * 0.05;

    Widget buildDataBox(
      String title,
      String value,
      VoidCallback onDecrement,
      VoidCallback onIncrement,
    ) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing / 2,
            vertical: spacing,
          ),
          child: StyledContainer(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyles.bodyTextBold.copyWith(
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: spacing),
                Text(
                  value,
                  style: TextStyles.bodyTextBold.copyWith(
                    fontSize: valueFontSize,
                  ),
                ),
                SizedBox(height: spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleIconButton(
                      onPressed: onDecrement,
                      icon: Icons.remove,
                      semanticLabel: 'Disminuir $title',
                    ),
                    SizedBox(width: iconSpacing),
                    CircleIconButton(
                      onPressed: onIncrement,
                      icon: Icons.add,
                      semanticLabel: 'Aumentar $title',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildDataBox('Peso', '$peso kg', _decrementPeso, _incrementPeso),
        SizedBox(width: spacing / 2),
        buildDataBox('Edad', '$edad años', _decrementEdad, _incrementEdad),
      ],
    );
  }
}
