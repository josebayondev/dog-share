import 'package:go_router/go_router.dart';
import '../../presentation/screens_export.dart';


// Esta clase se encarga de definir las rutas de la aplicación
final appRouter = GoRouter(
  routes: [
    GoRoute(
      // La ruta inicial de la aplicación
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      // La ruta inicial de la aplicación
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      // La ruta inicial de la aplicación
      path: '/register',
      name: RegisterScreen.name,
      builder: (context, state) => RegisterScreen(),
    ),
      ],
);