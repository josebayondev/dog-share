import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dog 🐶 Share',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            shadows: [
              // Sombra para hacer que el texto resalte más
              Shadow(blurRadius: 25.0, color: color, offset: Offset(5.0, 5.0)),
            ],
          ),
        ),
      ),
      body: Transform.translate(
        offset: const Offset(0, -60), // mueve hacia arriba 30px
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ), // opcional, para bordes redondeados
          child: Image.asset(
            'assets/images/2.png',
            width: 600,
            height: 550,
            fit:
                BoxFit
                    .cover, // Ajusta la imagen recortando los bordes si es necesario
          ),
        ),
      ),
    );
  }
}
