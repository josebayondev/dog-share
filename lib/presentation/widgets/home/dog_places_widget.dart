import 'package:dog_share/presentation/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:dog_share/config/data/places_data.dart';
import 'package:go_router/go_router.dart';

class DogPlaces extends StatelessWidget {
  const DogPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;

    return Column(
      children: [
        _SizedBoxPlaces(dogPlaces: placesData, color: color,),
        SizedBox(height: 10),
      ],
    );
  }
}

class _SizedBoxPlaces extends StatelessWidget {

  final List<Map<String, String>> dogPlaces;
  final Color color;

  const _SizedBoxPlaces({
    required this.dogPlaces,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: dogPlaces.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final place = dogPlaces[index];
          return GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalles del lugar
              context.pushNamed(DogPlacesScreen.name);
            },
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 230,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        place['image']!, // Por ejemplo: 'assets/images/parque1.jpg'
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      place['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      place['description'] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}