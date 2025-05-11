import 'package:dog_share/presentation/widgets/friends_widget.dart';
import 'package:flutter/material.dart';

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

    final Color color = Theme.of(context).colorScheme.primary;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Amigos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          SizedBox(height: 16),
          //Muestro el widget de amigos
          Friends(),
        ],
      );
  }
}

