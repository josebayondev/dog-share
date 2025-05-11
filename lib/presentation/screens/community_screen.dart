import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  static const String name = 'community_screen';

  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunidad'),
      ),
      body: Center(
        child: Text('Comunidad'),
      ),
    );
  }
}