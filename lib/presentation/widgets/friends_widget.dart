import 'package:flutter/material.dart';

class Friends extends StatelessWidget {
  
  final List<Map<String, String>> friends = [
    {
      'name': 'Filippo',
      'image': 'assets/images/1.png',
    },
    {
      'name': 'Milán',
      'image': 'assets/images/2.png',
    },
    {
      'name': 'Flippo y Milán',
      'image': 'assets/images/3.jpeg',
    },
    {
      'name': 'Boby',
      'image': 'assets/images/boby.jpg',
    },
    {
      'name': 'Boby',
      'image': 'assets/images/boby.jpg',
    },
    {
      'name': 'Boby',
      'image': 'assets/images/boby.jpg',
    },
    {
      'name': 'Boby',
      'image': 'assets/images/boby.jpg',
    },
    // Añade más si quieres
  ];

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: friends.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final friend = friends[index];
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(friend['image']!),
                ),
              ),
              SizedBox(height: 6),
              Text(
                friend['name']!,
                style: TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}