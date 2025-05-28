import 'package:dog_share/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dog_share/config/theme/app_theme.dart';
import 'package:dog_share/config/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // Esto es necesario para que Firebase funcione correctamente en Flutter
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // MultiProvider es un widget que permite proporcionar varios proveedores a la aplicación
    MultiProvider(
      providers: [
        // ChangeNotifierProvider es un widget que permite proporcionar un ChangeNotifier a la aplicación
        ChangeNotifierProvider(create: (_) => AuthProvider(),),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme(selectedColorIndex:2).themeData();

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: ThemeData.dark(),
    );
  }
}