import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final String? semanticLabel; // Añadimos este parámetro

  const CircleIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size = 40,
    this.backgroundColor = const Color(0xFF83016F),
    this.iconColor = Colors.white,
    this.semanticLabel, // Hacemos el parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel, // Usamos Semantics para accesibilidad
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: size,
          color: iconColor,
        ),
      ),
    );
  }
}
