import 'package:flutter/material.dart';

class VeterinarianWidget extends StatelessWidget {
  const VeterinarianWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Veterinarios 💉',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}