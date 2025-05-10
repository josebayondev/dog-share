import 'package:dog_share/presentation/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:dog_share/provider/auth_provider.dart' as custom_auth_provider;


class HomeScreen extends StatefulWidget {
  // Nombre de la ruta para la pantalla de inicio que se utiliza en el router
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // El método initState() se usa dentro del State de un StatefulWidget y se ejecuta una sola vez, justo cuando se crea el widget.
  @override
  void initState() {
    super.initState();

    // Creo una función asincrónica para obtener el uid del usuario desde Firestore. Utiliza metodos de la librería de Firebase
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final authProvider = Provider.of<custom_auth_provider.AuthProvider>(context,listen: false,);
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
      appBar: AppBarHome(alias: alias, color: color),
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





