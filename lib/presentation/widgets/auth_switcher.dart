import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthSwitcher extends StatefulWidget {
  const AuthSwitcher({super.key});

  @override
  State<AuthSwitcher> createState() => AuthSwitcherState();
}

class AuthSwitcherState extends State<AuthSwitcher> {

  int selectedIndex = 0; // 0 = Login, 1 = Register

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        ToggleButtons(
          isSelected: [selectedIndex == 0, selectedIndex == 1],
          onPressed: (index) {
            setState(() {
              selectedIndex = index;
            });
            // Navegar a la pantalla de login o registro dependiendo del índice seleccionado
            if (index == 0) {
              context.go('/login'); // Con .go no permite volver a la pantalla anterior
            } else {
              context.go('/register');
            }
          },
          borderRadius: BorderRadius.circular(12),
          selectedColor: Colors.white,
          fillColor: color,
          color: color,
          constraints: const BoxConstraints(minHeight: 40, minWidth: 100), //Establece el tamaño mínimo de los botones
          children: const [
            Text('Login', style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold)),
            Text('Register', style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}