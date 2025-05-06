import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance; // Instancia de FirebaseAuth

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  String get email => _email;
  String get password => _password;
  bool get isLoggedIn =>_auth.currentUser != null; // Verifica si el usuario está autenticado
  String get errorMessage => _errorMessage;

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

    if (password.isEmpty) {
      _errorMessage = 'La contraseña no puede estar vacía';
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      _errorMessage = 'La contraseña debe tener al menos 6 caracteres';
      notifyListeners();
      return false;
    }

    try {
      // Intentar iniciar sesión con Firebase
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _email = email;
      _password = password;
      _errorMessage = '';
      notifyListeners();

      return true;

    } on FirebaseAuthException catch (e) { // Captura de excepciones de Firebase
      _errorMessage = _firebaseErrorToMessage(e);
      notifyListeners();
      return false;
    }
  }

  // Metodo para cerrar sesión
  void logout() async {
    try {
    await _auth.signOut();
    _email = '';
    _password = '';
    notifyListeners();
    } catch (e) {
      _errorMessage = 'Error al cerrar sesión: $e';
      notifyListeners();
    }
  }

  String _firebaseErrorToMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No existe una cuenta con ese email';
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'invalid-email':
        return 'Email no válido';
      default:
        return 'Error de autenticación: ${e.message}';
    }
  }
}
