import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingSpot {
  final String id;
  final String name;
  final LatLng location;
  final int totalSpots;
  final int availableSpots;
  final double pricePerHour;

  ParkingSpot({
    required this.id,
    required this.name,
    required this.location,
    required this.totalSpots,
    required this.availableSpots,
    required this.pricePerHour,
  });
}
