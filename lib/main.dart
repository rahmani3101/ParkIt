import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/profile_page.dart';
import 'screens/payment_gateway.dart';
import 'screens/booking_history_page.dart';
import 'screens/payment_history_page.dart';
import 'screens/help_support_page.dart';
import 'screens/settings_page.dart';

void main() {
  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ParkIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 137, 146),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade800,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 127, 179, 6),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade800,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/payment': (context) => const PaymentGatewayScreen(amount: 0),
        '/booking-history': (context) => const BookingHistoryPage(),
        '/payment-history': (context) => const PaymentHistoryPage(),
        '/help-support': (context) => const HelpSupportPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
