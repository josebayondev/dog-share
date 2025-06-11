import 'package:dog_share/provider/auth_provider.dart' as custom_auth_provider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';
  final String? alias;
  const ProfileScreen({super.key, this.alias});

  @override
  Widget build(BuildContext context) {
    final alias = context.watch<custom_auth_provider.AuthProvider>().alias;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Hola ${alias ?? ''}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
