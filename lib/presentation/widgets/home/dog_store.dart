import 'package:flutter/material.dart';

class DogStore extends StatelessWidget {
  const DogStore({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Tiendas cercanas 🐾',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}