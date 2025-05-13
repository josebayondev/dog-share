import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommunityScreen extends StatelessWidget {
  static const String name = 'community_screen';

  const CommunityScreen({super.key});

  // Método para obtener el stream de todos los usuarios excepto el actual
  // Stream para obtener todos los usuarios de Firestore recargando los datos cada vez que hay un cambio en la base de datos
  Stream<List<Map<String, dynamic>>> getAllUsersStreamExcept(String currentUid) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: currentUid)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  @override
  Widget build(BuildContext context) {
    // Obtengo el usuario actual de Firebase (el que ha iniciado sesión)
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Center(child: Text("No has iniciado sesión"));
      }

    return StreamBuilder<List<Map<String, dynamic>>>(
        stream: getAllUsersStreamExcept(currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return const Center(child: Text("No hay otros usuarios aún 🐾"));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final alias = user['alias'] ?? 'Sin nombre';
              final imageUrl = user['imageUrl'];

              return ListTile(
                onTap: () => print('Pulsaste el perfil de [$alias]'),
                leading: imageUrl != null
                    ? CircleAvatar(backgroundImage: NetworkImage(imageUrl))
                    : const CircleAvatar(child: Icon(Icons.pets)),
                title: Text(alias),
                subtitle: Text(user['email'] ?? ''),
              );
            },
          );
        },
      );    
  }
}