import 'package:dog_share/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens_export.dart';

class HomeScreen extends StatelessWidget  {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Se obtiene el color primario del tema actual
    final Color color = Theme.of(context).colorScheme.primary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBarView(color: color, themeProvider: themeProvider),
      body: Column(
        children: [
      _ImageView(),
      AuthSwitcher(),
        ],
      ),
    );
  }
}

/// Widget que representa la imagen de fondo
class _ImageView extends StatelessWidget {
  const _ImageView();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -60), // mueve hacia arriba 30px
      child: ClipRRect( // Recorta la imagen para que tenga bordes redondeados
        borderRadius: BorderRadius.circular(20,), // opcional, para bordes redondeados
        child: Image.asset(
          'assets/images/2.png',
          width: 600,
          height: 550,
          fit:BoxFit.cover, // Ajusta la imagen recortando los bordes si es necesario
        ),
      ),
    );
  }
}
