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

            if (index == 0) {
              context.push('/login');
            } else {
              context.push('/register');
            }
          },
          borderRadius: BorderRadius.circular(12),
          selectedColor: Colors.white,
          fillColor: color,
          color: color,
          constraints: const BoxConstraints(minHeight: 40, minWidth: 100),
          children: const [
            Text('Login'),
            Text('Register'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}