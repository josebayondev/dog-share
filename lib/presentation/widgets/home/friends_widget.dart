import 'package:dog_share/config/data/friends_data.dart';
import 'package:flutter/material.dart'; 


// ignore: use_key_in_widget_constructors
class Friends extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Color color = Theme.of(context).colorScheme.primary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _TextFriends(color: color),
        const SizedBox(height: 16),
        _SizedBoxListFriends(friends: friendsData, color: color),
      ],
    );
  }
}

class _TextFriends extends StatelessWidget {

  final Color color;

  const _TextFriends({
    required this.color,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Amigos 🐶',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}

class _SizedBoxListFriends extends StatelessWidget {

  final List<Map<String, String>> friends;
  final Color color;

  const _SizedBoxListFriends({
    required this.friends,
    required this.color,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: friends.length,
        separatorBuilder: (_, __) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final friend = friends[index];
          return GestureDetector(
            onTap: () {
              print('Navegando a la pantalla del perfil de ${friend['name']}');
            },
            child: Column(
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
            ),
          );
        },
      ),
    );
  }
}