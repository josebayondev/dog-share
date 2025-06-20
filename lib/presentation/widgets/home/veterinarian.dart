
import 'package:flutter/material.dart';

import '../../screens_export.dart';

class VeterinarianWidget extends StatelessWidget {
  const VeterinarianWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtengo el color primario del tema actual
    final color = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Veterinarios 💉',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 10),  
              VeterinarianMapWidget(),
            ],
          ),
        ),
      ],
    );
  }
}