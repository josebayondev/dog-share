import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dog_share/config/data/veterinarian_data.dart';

class VeterinarianMapWidget extends StatelessWidget {
  const VeterinarianMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(40.4168, -3.7038),
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: veterinariosMadridCentro.map((vet) {
              return Marker(
                point: vet.ubicacion,
                width: 40,
                height: 40,
                builder: (ctx) => Tooltip(
                  message: '${vet.nombre}\n${vet.direccion}',
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}