import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  static const String name = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Text('Perfil'),
      ),
    );
  }
}