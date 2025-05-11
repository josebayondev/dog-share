import 'package:flutter/material.dart';
import '../screens_export.dart';

class HomeScreen extends StatefulWidget {
  // Nombre de la ruta para la pantalla de inicio que se utiliza en el router
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Muestro el widget de amigos
        Friends(),
        Divider(),
        DogPlaces(),
        Divider(),
        DogStore(),
        Divider(),
        VeterinarianWidget(),
      ],
    );
  }
}
