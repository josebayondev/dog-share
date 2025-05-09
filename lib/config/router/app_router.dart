import 'package:go_router/go_router.dart';
import '../../presentation/screens_export.dart';


// Esta clase se encarga de definir las rutas de la aplicación
final appRouter = GoRouter(
  routes: [
    GoRoute(
      // La ruta inicial de la aplicación
      path: '/',
      name: WelcomeScreen.name,
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      // Ruta para la pantalla de inicio de sesión
      path: '/login_screen',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      // Ruta para la pantalla de registro
      path: '/register_screen',
      name: RegisterScreen.name,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      // Ruta para la pantalla de inicio
      path: '/home_screen',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
      ],
);