import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/parking_spot.dart';

class BookingSheet extends StatefulWidget {
  final ParkingSpot spot;

  const BookingSheet({super.key, required this.spot});

  @override
  _BookingSheetState createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  int hours = 1;

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemGreen,
        scaffoldBackgroundColor: CupertinoColors.black,
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            widget.spot.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white,
            ),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(CupertinoIcons.check_mark_circled,
                color: CupertinoColors.systemGreen),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/payment',
                arguments: {
                  'spot': widget.spot,
                  'hours': hours,
                },
              );
            },
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1E1E1E), // Dark gray
                Color.fromARGB(255, 43, 41, 41), // Black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Duration',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 186, 218, 5),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Card for Duration Selection
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (hours > 1) {
                              setState(() => hours--);
                              HapticFeedback.lightImpact();
                            }
                          },
                          child: const Icon(
                            CupertinoIcons.minus_circle,
                            size: 30,
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            '$hours hour${hours > 1 ? 's' : ''}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() => hours++);
                            HapticFeedback.lightImpact();
                          },
                          child: const Icon(
                            CupertinoIcons.add_circled,
                            size: 30,
                            color: CupertinoColors.systemGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Center(
                    child: Text(
                      'Total: ₹${(widget.spot.pricePerHour * hours).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 68, 199),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CupertinoButton.filled(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      Navigator.pushNamed(
                        context,
                        '/payment',
                        arguments: {
                          'spot': widget.spot,
                          'hours': hours,
                        },
                      );
                    },
                    child: const Text('Proceed to Payment'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
