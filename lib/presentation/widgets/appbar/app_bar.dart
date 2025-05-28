import 'package:flutter/material.dart';

/// Widget que representa la barra de navegación superior
class AppBarView extends StatelessWidget implements PreferredSizeWidget {

  final Color color;// Para poder cambiar el tema de la aplicación de claro a oscuro

  const AppBarView({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Altura de la barra de navegación. Si no se especifica, no puedo dar parametros a la barra de navegación
}