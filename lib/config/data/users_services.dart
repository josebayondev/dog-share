import 'package:cloud_firestore/cloud_firestore.dart';

// Esta clase se encarga de interactuar con la base de datos de Firestore para obtener información sobre los usuarios.
class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance; // Variable 

  // Metodo asincrono Devuelve todos los usuarios registrados en la colección users de Firestore, excepto el usuario actual (filtrado por UID).
  Future<List<Map<String, dynamic>>> getAllUsersExcept(String currentUid) async {
    final snapshot = await _db
        .collection('users')
        .where('uid', isNotEqualTo: currentUid)
        .get(); // Usa .get() para hacer la consulta y obtener un QuerySnapshot con los resultados.

    return snapshot.docs.map((doc) => doc.data()).toList(); // Esto convierte cada documento en un objeto tipo mapa (JSON) y luego los agrupa en una lista con .toList().
  }
} 
