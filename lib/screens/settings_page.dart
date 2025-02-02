import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: false,
            onChanged: (value) {
              // Toggle dark mode
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            onTap: () {
              // Manage notifications
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () {
              // Show privacy policy
            },
          ),
          ListTile(
            title: const Text('Terms & Conditions'),
            onTap: () {
              // Show terms & conditions
            },
          ),
        ],
      ),
    );
  }
}
