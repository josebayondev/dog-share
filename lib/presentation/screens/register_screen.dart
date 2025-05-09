import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../presentation/screens_export.dart';

class RegisterScreen extends StatefulWidget {
  // Nombre de la ruta para la pantalla de inicio de sesión
  static const String name = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controladores para los campos de texto de email y contraseña
  final _aliasController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Gracias al dispose() se liberan los recursos utilizados por los controladores
  // Esto es importante para evitar fugas de memoria
  @override
  void dispose() {
    _aliasController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Método para iniciar sesión
  // Este método se llama cuando el usuario presiona el botón de registrar 
  void register() async {
    
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final alias = _aliasController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Con esta variable, llamo al metodo login() del provider
    final registerProvider = await authProvider.register(email, password, alias);

    if (registerProvider == true) {
      if(mounted) {
      context.go('/login');
      }
    } else {
      //Error
      final errorMessage = authProvider.errorMessage;
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBarView(color: color, themeProvider: themeProvider),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/2.png',
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 260, 24, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Regístrate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _TextFormField(
                      controller: _aliasController,
                      icon: Icons.person,
                      labelText: 'Alias',
                      hintText: 'Introduce tu alias',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    _TextFormField(
                      controller: _emailController,
                      icon: Icons.email,
                      labelText: 'Correo electrónico',
                      hintText: 'Introduce tu correo electrónico',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    _TextFormField(
                      controller: _passwordController,
                      icon: Icons.lock,
                      labelText: 'Password',
                      hintText: 'Introduce tu password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 200,
                      child: FilledButton(
                        onPressed: register,
                        style: FilledButton.styleFrom(
                          backgroundColor: color, // mismo color que los toggle
                          foregroundColor: Colors.white, // color del texto
                          minimumSize: const Size(100, 40), // tamaño mínimo
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        context.go('/login');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Ya tienes cuenta? Inica sesión'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextFormField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const _TextFormField({
    required this.controller,
    this.icon,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.textInputAction,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 16, color: theme.colorScheme.onSurface),
        decoration: InputDecoration(
          prefixIcon:
              icon != null ? Icon(icon, color: theme.primaryColor) : null,
          labelText: labelText,
          hintText: hintText,
          filled: true,
          fillColor:
              isDark
                  ? Colors.grey.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.05),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          labelStyle: TextStyle(
            color: isDark ? Colors.grey[300] : Colors.grey[600],
          ),
          hintStyle: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[500],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.dividerColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
