import 'package:dog_share/presentation/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import '../../provider/theme_provider.dart' show ThemeProvider;
import '../../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {

  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final success = await authProvider.login(email, password);

    if (success) {
      Navigator.pushReplacementNamed(context, HomeScreen.name);
    } else {
      final errorMessage = authProvider.errorMessage ?? 'Login failed';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBarView(color: color, themeProvider: themeProvider),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            _TextFormField(
              controller: _emailController,
              icon: Icons.email,
              labelText: 'Email',
              hintText: 'Enter your email',
              obscureText: false,),
            _TextFormField(
              controller: _passwordController,
              icon: Icons.lock,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,),

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
    );
  }
}

class _TextFormField extends StatelessWidget {

  final TextEditingController controller;
  final IconData? icon;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;

  const _TextFormField({ 
  required this.controller,
  this.icon,
  this.labelText,
  this.hintText,
  this.obscureText
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: icon != null ? Icon(icon) : null,
      ),
    );
  }
}