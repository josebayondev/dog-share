import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // Variables privadas para almacenar el estado de la autenticación
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  // Getters para acceder a los valores privados y poder hacerlos públicos pero sin permitir la modificación
  String get email => _email;
  String get password => _password;
  bool get isLoggedIn => _email.isNotEmpty && _password.isNotEmpty;
  String get errorMessage => _errorMessage;

  // Metodo para iniciar sesión
  Future<bool> login(String email, String password) async {
    if (email.isEmpty) {
      _errorMessage = 'El email no puede estar vacío';
      notifyListeners();
      return false;
    }

    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      _errorMessage = 'Formato de email no válido';
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      _errorMessage = 'La contraseña debe tener al menos 6 caracteres';
      notifyListeners();
      return false;
    }

    // Simulamos una petición de login
    await Future.delayed(const Duration(seconds: 2));
    _errorMessage = '';

    // En un caso real, aquí llamarías a una API o Firebase
    if (email == "test@email.com" && password == "123456") {
      _email = email;
      _password = password;
       notifyListeners();
      return true;
    }

    _errorMessage = 'Email o contraseña incorrectos';
    notifyListeners();
    return false;
  }
  
  void logout() {
    _email = '';
    _password = '';
    notifyListeners();
  }
}