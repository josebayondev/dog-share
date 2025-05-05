import 'package:go_router/go_router.dart';
import '../../presentation/screens_export.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      // La ruta inicial de la aplicación
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
    ),
      ],
);