import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/core/styled_container.dart';
import 'package:imc_calculator/core/circle_icon_button.dart';

class DatesSelector extends StatefulWidget {
  const DatesSelector({super.key});

  @override
  State<DatesSelector> createState() => _DatesSelectorState();
}

class _DatesSelectorState extends State<DatesSelector> {
  int peso = 60;
  int edad = 25;

  // Validación de valores con límites realistas
  void _incrementPeso() => setState(() => peso = peso < 200 ? peso + 1 : peso);
  void _decrementPeso() => setState(() => peso = peso > 30 ? peso - 1 : peso);
  void _incrementEdad() => setState(() => edad = edad < 120 ? edad + 1 : edad);
  void _decrementEdad() => setState(() => edad = edad > 1 ? edad - 1 : edad);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // PESO
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 16,
              right: 4,
              bottom: 8,
            ),
            child: StyledContainer(
              child: Column(
                children: [
                  Text(
                    'Peso'.toUpperCase(),
                    style: TextStyles.bodyTextBold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$peso kg',
                    style: TextStyles.bodyTextBold.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleIconButton(
                        onPressed: _decrementPeso,
                        icon: Icons.remove,
                        semanticLabel: 'Disminuir peso',
                      ),
                      const SizedBox(width: 20),
                      CircleIconButton(
                        onPressed: _incrementPeso,
                        icon: Icons.add,
                        semanticLabel: 'Aumentar peso',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 5),

        // EDAD
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4,
              top: 16,
              bottom: 8,
              right: 8,
            ),
            child: StyledContainer(
              child: Column(
                children: [
                  Text(
                    'Edad'.toUpperCase(),
                    style: TextStyles.bodyTextBold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$edad años',
                    style: TextStyles.bodyTextBold.copyWith(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleIconButton(
                        onPressed: _decrementEdad,
                        icon: Icons.remove,
                        semanticLabel: 'Disminuir edad',
                      ),
                      const SizedBox(width: 20),
                      CircleIconButton(
                        onPressed: _incrementEdad,
                        icon: Icons.add,
                        semanticLabel: 'Aumentar edad',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
