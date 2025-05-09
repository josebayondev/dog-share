import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:dog_share/provider/auth_provider.dart' as custom_auth_provider;
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<custom_auth_provider.AuthProvider>(
        context,
        listen: false,
      );
      final uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid != null) {
        await authProvider.fetchAliasFromFirestore(uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final alias = context.watch<custom_auth_provider.AuthProvider>().alias;
    final Color color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
  title: Row(
    children: [
      _ImageCircleAvatar(),
      SizedBox(width: 15),
      _TextAlias(alias: alias, color: color),
    ],
  ),
  backgroundColor: color,
  actions: [
    _PopUpMenuAppBar(),
  ],
),
      body: Center(
        child: Text(
          '¡Disfruta de DogShare!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _PopUpMenuAppBar extends StatelessWidget {
  const _PopUpMenuAppBar();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 'logout') {
          FirebaseAuth.instance.signOut();
          context.go('/login_screen');
        } else if (value == 'profile') {
          // Navega a perfil
        } else if (value == 'settings') {
          // Navega a ajustes
        }
      },
      icon: Icon(Icons.more_vert, color: Colors.white),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'profile',
          child: Text('Perfil'),
        ),
        PopupMenuItem<String>(
          value: 'settings',
          child: Text('Ajustes'),
        ),
        PopupMenuItem<String>(
          value: 'logout',
          child: Text('Cerrar sesión'),
        ),
      ],
    );
  }
}

class _TextAlias extends StatelessWidget {
  const _TextAlias({
    required this.alias,
    required this.color,
  });

  final String? alias;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hola  🐾 ${alias != null ? '  $alias' : ''}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    );
  }
}

class _ImageCircleAvatar extends StatelessWidget {
  const _ImageCircleAvatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage('assets/images/3.jpeg'),
    );
  }
}
