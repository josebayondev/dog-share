import 'package:flutter/material.dart';

class DogPlacesScreen extends StatelessWidget {

  static const String name = 'dog_places_screen';

  const DogPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Places'),
        titleTextStyle: TextStyle(
          color: Colors.white, 
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(child: Text('Hola, soy la pagina de Parques'),)
    );
  }
}