import 'package:dog_share/presentation/widgets/auth_switcher.dart';
import 'package:dog_share/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget  {

  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Se obtiene el color primario del tema actual
    final Color color = Theme.of(context).colorScheme.primary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: _AppBarView(color: color, themeProvider: themeProvider),
      body: Column(
        children: [
      _ImageView(),
      AuthSwitcher(),
        ],
      ),
    );
  }
}

/// Widget que representa la barra de navegación superior
class _AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarView({
    required this.color,
    required this.themeProvider,
  });

  final Color color;
  final ThemeProvider themeProvider;

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
      actions: [
        IconButton(
          icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () => themeProvider.toggleTheme(),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Widget que representa la imagen de fondo
class _ImageView extends StatelessWidget {
  const _ImageView();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -60), // mueve hacia arriba 30px
      child: ClipRRect(
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
