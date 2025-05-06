import 'package:flutter/material.dart';

// Archivo de configuracion de los temas

// Lista de colores para el tema
const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.amber,
];

// Clase que define el tema de la aplicacion
class AppTheme {

  // Indice del color seleccionado
  final int selectedColorIndex;

  // Constructor de la clase
  const AppTheme({
    this.selectedColorIndex = 0
    });

  // Metodo que devuelve el tema de la aplicacion
  ThemeData themeData() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColorIndex],
    brightness: Brightness.light,
  );
}