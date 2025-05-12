import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Instancia de FirebaseAuth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Instancia de FirebaseAuth

  String _email = '';
  String _errorMessage = '';
  String? _alias;

  static const String _emailRegex = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const String _passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$';





  String get email => _email;
  bool get isLoggedIn =>_auth.currentUser != null; // Verifica si el usuario está autenticado
  String get errorMessage => _errorMessage;
  User? get currentUser => _auth.currentUser;
  String? get alias => _alias;


  // Método para autenticar al usuario
  Future<bool> login(String email, String password) async {

    _errorMessage = ''; // Reinicia el mensaje de error

    if (email.isEmpty) {
      _errorMessage = 'El email no puede estar vacío';
      notifyListeners();
      return false;
    }

    if (!RegExp(_emailRegex).hasMatch(email)) {
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
      _errorMessage = '';
      notifyListeners();

      return true;
    } on FirebaseAuthException catch (e) {
      // Captura de excepciones de Firebase
      _errorMessage = _firebaseErrorToMessage(e);
      notifyListeners();
      return false;
    }
  }

  // Metodo para cerrar sesión
  Future<void> logout() async {
    try {
      await _auth.signOut();
      _email = '';
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error al cerrar sesión: $e';
      notifyListeners();
    }
  }

  // Método para obtener el mensaje de error de Firebase
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

  // Método para registrar un nuevo usuario
  Future<bool> register(String email, String password, String alias) async {
    
    _errorMessage = ''; // Reinicia el mensaje de error

    if (alias.isEmpty) {
      _errorMessage = 'El alias no puede estar vacío';
      notifyListeners();
      return false;
    }

    if (email.isEmpty) {
      _errorMessage = 'El email no puede estar vacío';
      notifyListeners();
      return false;
    }

    if (!RegExp(_emailRegex).hasMatch(email)) {
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

    if (!RegExp(_passwordRegex).hasMatch(password)) {
      _errorMessage =
          'La contraseña debe tener al menos 8 caracteres, incluir mayúsculas, minúsculas, un número y un símbolo';
      notifyListeners();
      return false;
    }

    final aliasExists =
        await _firestore
            .collection('users')
            .where('alias', isEqualTo: alias)
            .limit(1)
            .get();

    if (aliasExists.docs.isNotEmpty) {
      _errorMessage = 'Ese alias ya está en uso';
      notifyListeners();
      return false;
    }

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = credential.user!.uid;

      // Guardar en Firestore
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'uid': userId,
        'alias': alias,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      _email = email; // Guardar el email en el provider
      notifyListeners();

      return true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _firebaseErrorToMessage(e);
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = 'Ocurrió un error inesperado';
      notifyListeners();
      return false;
           }
  }

  // Metodo para obtener el alias
  Future<void> fetchAliasFromFirestore(String uid) async {
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      _alias = doc.data()?['alias'];
      notifyListeners();
    } catch (e) {
      print('Error al obtener alias: $e');
    }
  }
  
}
