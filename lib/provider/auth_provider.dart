import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  String get email => _email;
  String get password => _password;
  bool get isLoggedIn => _auth.currentUser != null;
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
    } on FirebaseAuthException catch (e) {
      _errorMessage = _firebaseErrorToMessage(e);
      notifyListeners();
      return false;
    }
  }

  void logout() async {
    await _auth.signOut();
    _email = '';
    _password = '';
    notifyListeners();
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