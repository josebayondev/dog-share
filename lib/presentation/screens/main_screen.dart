import 'package:dog_share/provider/auth_provider.dart' as custom_auth_provider;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens_export.dart';
import '../widgets/appbar/app_bar_main.dart';

class MainScreen extends StatefulWidget {
  static const String name = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Variable que almacena el índice de la pantalla actual
  int _currentIndex = 0;

  // Lista de pantallas que se muestran en la aplicación
  final List<Widget> _screens = [
    HomeScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  // Método que se ejecuta cuando se toca un elemento del BottomNavigationBar
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // El método initState() se usa dentro del State de un StatefulWidget y se ejecuta una sola vez, justo cuando se crea el widget.
  @override
  void initState() {
    super.initState();

    // Creo una función asincrónica para obtener el uid del usuario desde Firestore. Utiliza metodos de la librería de Firebase
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
    final color = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBarHome(alias: alias, color: color),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
      
      // Cambia la pantalla dependiendo del índice seleccionado
      child: _screens[_currentIndex]),
      // Se utiliza para navegar entre las diferentes pantallas de la aplicación
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: color,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Comunidad'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}