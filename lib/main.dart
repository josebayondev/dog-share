import 'package:dog_share/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dog_share/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //El routerConfig es el objeto de la clase AppRouter que se encarga de gestionar las rutas de la aplicacion
    return MaterialApp.router(
      routerConfig: appRouter,
      // El tema apunta a la clase AppTheme y se selecciona el color con el indice 1 y se accede a la funcion themeData para que devuelva el tema
      theme: AppTheme(selectedColorIndex: 2).themeData(),
      );
  }
}
