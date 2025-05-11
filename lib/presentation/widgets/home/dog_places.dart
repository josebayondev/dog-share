import 'package:flutter/material.dart';

class DogPlaces extends StatelessWidget {
  const DogPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Mis lugares favoritos 📍',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}