import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../models/parking_spot.dart';
import '../widgets/parking_spot_card.dart';
import '../widgets/booking_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;
  Position? currentPosition;
  List<ParkingSpot> nearbySpots = [];
  static const LatLng kolkataCenter = LatLng(22.5726, 88.3639);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadNearbyParkingSpots();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        currentPosition = position;
      });
      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
        );
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _loadNearbyParkingSpots() {
    setState(() {
      nearbySpots = [
        ParkingSpot(
          id: '1',
          name: 'Park Street Parking',
          location: const LatLng(22.5551, 88.3494),
          totalSpots: 50,
          availableSpots: 20,
          pricePerHour: 40,
        ),
        ParkingSpot(
          id: '2',
          name: 'Salt Lake Parking Zone',
          location: const LatLng(22.5697, 88.4001),
          totalSpots: 100,
          availableSpots: 45,
          pricePerHour: 30,
        ),
        ParkingSpot(
          id: '3',
          name: 'Techno India University (EM-4)',
          location: const LatLng(22.5712, 88.4321),
          totalSpots: 200,
          availableSpots: 150,
          pricePerHour: 25,
        ),
        ParkingSpot(
          id: '4',
          name: 'Sector V Metro Station',
          location: const LatLng(22.5734, 88.4298),
          totalSpots: 120,
          availableSpots: 80,
          pricePerHour: 35,
        ),
        ParkingSpot(
          id: '5',
          name: 'RDB Cinema Parking',
          location: const LatLng(22.5689, 88.4102),
          totalSpots: 80,
          availableSpots: 30,
          pricePerHour: 45,
        ),
        ParkingSpot(
          id: '6',
          name: 'City Center Mall Parking',
          location: const LatLng(22.5678, 88.4156),
          totalSpots: 150,
          availableSpots: 60,
          pricePerHour: 50,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('ParkIt'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.person_circle),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
      ),
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: kolkataCenter,
              zoom: 12,
            ),
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: Set.from(nearbySpots.map((spot) => Marker(
                  markerId: MarkerId(spot.id),
                  position: spot.location,
                  infoWindow: InfoWindow(
                    title: spot.name,
                    snippet:
                        '₹${spot.pricePerHour}/hour - ${spot.availableSpots} spots',
                  ),
                ))),
            myLocationEnabled: true,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.1,
            maxChildSize: 0.7,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: nearbySpots.length,
                  itemBuilder: (context, index) {
                    final spot = nearbySpots[index];
                    return ParkingSpotCard(
                      spot: spot,
                      onTap: () => _showBookingDialog(context, spot),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, ParkingSpot spot) {
    // Use Cupertino modal bottom sheet instead of showModalBottomSheet
    showCupertinoModalPopup(
      context: context,
      builder: (context) => BookingSheet(spot: spot),
    );
  }
}
