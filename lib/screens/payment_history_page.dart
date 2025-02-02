import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment History')),
      body: ListView.builder(
        itemCount: 5, // Dummy data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Payment #${index + 1}'),
            subtitle: Text('₹${(index + 1) * 100} | Successful'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to payment details
            },
          );
        },
      ),
    );
  }
}
