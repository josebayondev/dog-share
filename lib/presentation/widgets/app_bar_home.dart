import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({
    super.key,
    required this.alias,
    required this.color,
  });

  final String? alias;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
    radius: 20,
    backgroundColor: Colors.white,
    backgroundImage: AssetImage('assets/images/3.jpeg'),
          ),  
          SizedBox(width: 15),
          Text(
    'Hola  🐾 ${alias != null ? '  $alias' : ''}',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: color,
      actions: [PopupMenuButton<String>(
    onSelected: (value) {
      if (value == 'logout') {
        FirebaseAuth.instance.signOut();
        context.go('/login_screen');
      } else if (value == 'perfil') {
        // Navega a perfil
      } else if (value == 'ajustes') {
        // Navega a ajustes
      }
    },
    icon: Icon(Icons.more_vert, color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    color: Colors.grey[100],
    itemBuilder:
        (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
        value: 'perfil',
        child: Row(
          children: [
            Icon(Icons.person, color: Colors.black54),
            SizedBox(width: 10),
            Text('Perfil'),
          ],
        ),
      ),
          PopupMenuItem<String>(
        value: 'ajustes',
        child: Row(
          children: [
            Icon(Icons.settings, color: Colors.black54),
            SizedBox(width: 10),
            Text('Ajustes'),
          ],
        ),
      ),
      PopupMenuDivider(),
          PopupMenuItem<String>(
        value: 'logout',
        child: Row(
          children: [
            Icon(Icons.logout_rounded, color: Colors.redAccent),
            SizedBox(width: 10),
            Text('Cerrar sesión'),
          ],
        ),
      ),
        ],
        ),
      ],
    );
  }
    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}