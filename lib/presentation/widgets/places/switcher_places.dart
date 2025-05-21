import 'package:flutter/material.dart';

class SwitcherPlaces extends StatefulWidget {
  const SwitcherPlaces({super.key});

  @override
  State<SwitcherPlaces> createState() => _SwitcherPlacesState();
}

class _SwitcherPlacesState extends State<SwitcherPlaces> {
  int opcionSeleccionada = 0;

  final List<String> opciones = [
    "Fotos",
    "Lugar",
    "Comentarios",
  ];

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Botones en fila separados
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(opciones.length, (index) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        opcionSeleccionada = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: opcionSeleccionada == index
                          ? color
                          : Colors.grey[300],
                      foregroundColor: opcionSeleccionada == index
                          ? Colors.white
                          : Colors.black,
                    ),
                    child: Text(opciones[index]),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(thickness: 1),
        const SizedBox(height: 10),

        // Contenido según la opción
        if (opcionSeleccionada == 0)
          const Text("📸 Mostrando fotos...", textAlign: TextAlign.center)
        else if (opcionSeleccionada == 1)
          const Text("📍 Mostrando lugar...", textAlign: TextAlign.center)
        else if (opcionSeleccionada == 2)
          const Text("💬 Mostrando comentarios...", textAlign: TextAlign.center),
      ],
    );
  }
}