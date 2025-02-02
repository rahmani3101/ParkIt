import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/parking_spot.dart';

class ParkingSpotCard extends StatefulWidget {
  final ParkingSpot spot;
  final VoidCallback onTap;

  const ParkingSpotCard({
    super.key,
    required this.spot,
    required this.onTap,
  });

  @override
  _ParkingSpotCardState createState() => _ParkingSpotCardState();
}

class _ParkingSpotCardState extends State<ParkingSpotCard> {
  bool _isHovered = false; // To track hover-like behavior

  @override
  Widget build(BuildContext context) {
    // Force dark mode using CupertinoTheme
    return CupertinoTheme(
      data: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemGreen,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) =>
            setState(() => _isHovered = true), // Simulate hover on tap down
        onTapUp: (_) =>
            setState(() => _isHovered = false), // Reset hover on tap up
        onTapCancel: () =>
            setState(() => _isHovered = false), // Reset hover if canceled
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isHovered
                  ? [
                      CupertinoColors.systemBlue.withOpacity(0.3),
                      CupertinoColors.darkBackgroundGray,
                    ]
                  : [
                      CupertinoColors.black,
                      CupertinoColors.darkBackgroundGray,
                    ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.spot.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isHovered
                            ? CupertinoColors.systemGreen
                            : CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Available: ${widget.spot.availableSpots}/${widget.spot.totalSpots}',
                      style: TextStyle(
                        fontSize: 14,
                        color: _isHovered
                            ? CupertinoColors.systemGrey
                            : CupertinoColors.systemGrey3,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '₹${widget.spot.pricePerHour}/hr',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _isHovered
                          ? CupertinoColors.systemGreen
                          : CupertinoColors.systemYellow,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    CupertinoIcons.forward,
                    size: 16,
                    color: _isHovered
                        ? CupertinoColors.systemGreen
                        : CupertinoColors.systemGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
