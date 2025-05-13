import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommunityScreen extends StatelessWidget {
  static const String name = 'community_screen';
  const CommunityScreen({super.key});

  Future<List<Map<String, dynamic>>> getAllUsersExcept(String currentUid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: currentUid)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final Color color = Theme.of(context).colorScheme.primary;

    if (currentUser == null) {
      return const Center(child: Text("No has iniciado sesión"));
    }

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getAllUsersExcept(currentUser.uid),
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
      ),
    );
  }
}