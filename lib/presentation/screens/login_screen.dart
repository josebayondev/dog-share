import 'package:dog_share/presentation/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import '../../provider/theme_provider.dart' show ThemeProvider;

class LoginScreen extends StatefulWidget {

  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Controladores para los campos de texto de email y contraseña
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Gracias al dispose() se liberan los recursos utilizados por los controladores
  // Esto es importante para evitar fugas de memoria
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  // Método para iniciar sesión 
  // Este método se llama cuando el usuario presiona el botón de inicio de sesión
  void login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Con esta variable, llamo al metodo login() del provider
    final loginProvider = await authProvider.login(email, password);

    if (loginProvider == true) {
        Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterScreen(),
          ),
        );
    } else {
      final errorMessage = authProvider.errorMessage;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBarView(color: color, themeProvider: themeProvider),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Screen'),
              _TextFormField(
                controller: _emailController,
                icon: Icons.email,
                labelText: 'Email',
                hintText: 'Enter your email',
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,),
          
              _TextFormField(
                controller: _passwordController,
                icon: Icons.lock,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,),
          
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
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
  this.keyboardType
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}