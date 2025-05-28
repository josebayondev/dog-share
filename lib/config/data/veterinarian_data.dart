import 'package:latlong2/latlong.dart';

class Veterinario {
  final String nombre;
  final String direccion;
  final LatLng ubicacion;

  Veterinario({
    required this.nombre,
    required this.direccion,
    required this.ubicacion,
  });
}

// Lista de veterinarios
final List<Veterinario> veterinariosMadridCentro = [
  Veterinario(
    nombre: 'Clínica Veterinaria Central',
    direccion: 'Calle Alcalá, 45, 28014 Madrid',
    ubicacion: LatLng(40.4190, -3.6945),
  ),
  Veterinario(
    nombre: 'Veterinarios Madrid Centro',
    direccion: 'Calle Gran Vía, 23, 28013 Madrid',
    ubicacion: LatLng(40.4201, -3.7038),
  ),
  Veterinario(
    nombre: 'Hospital Veterinario Plaza Mayor',
    direccion: 'Plaza Mayor, 5, 28012 Madrid',
    ubicacion: LatLng(40.4155, -3.7074),
  ),
  Veterinario(
    nombre: 'Centro Veterinario Sol',
    direccion: 'Puerta del Sol, 10, 28013 Madrid',
    ubicacion: LatLng(40.4169, -3.7033),
  ),
];