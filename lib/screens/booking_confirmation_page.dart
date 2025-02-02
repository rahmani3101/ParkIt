import 'package:flutter/material.dart';
import '../models/parking_spot.dart';

class BookingConfirmationPage extends StatelessWidget {
  final ParkingSpot spot;
  final int hours;
  final String parkingNumber;

  const BookingConfirmationPage({
    Key? key,
    required this.spot,
    required this.hours,
    required this.parkingNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Confirmed')),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            ListTile(
              leading: const Icon(Icons.local_parking),
              title: Text(spot.name),
              subtitle: Text('Parking Spot #$parkingNumber'),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: Text('$hours hour${hours > 1 ? 's' : ''}'),
              subtitle: Text('₹${spot.pricePerHour}/hour'),
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Total Amount Paid'),
              subtitle:
                  Text('₹${(spot.pricePerHour * hours).toStringAsFixed(2)}'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Go Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
