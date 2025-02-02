import 'package:flutter/material.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking History')),
      body: ListView.builder(
        itemCount: 5, // Dummy data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Booking #${index + 1}'),
            subtitle: Text('₹200 | 2 hours | Completed'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to booking details
            },
          );
        },
      ),
    );
  }
}
