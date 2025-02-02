import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Email: asadrahmani3101@gmail.com'),
            const SizedBox(height: 8),
            const Text('Phone: 9142145488'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Open email client
              },
              child: const Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
