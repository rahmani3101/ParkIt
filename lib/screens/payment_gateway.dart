import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/parking_spot.dart';
import 'booking_confirmation_page.dart';

class PaymentGatewayScreen extends StatefulWidget {
  final double amount;

  const PaymentGatewayScreen({super.key, required this.amount});

  @override
  _PaymentGatewayScreenState createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  bool _isCardSelected = true;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _upiIdController = TextEditingController();

  bool _isLoading = false;

  bool get _isFormValid {
    if (_isCardSelected) {
      return _cardNumberController.text.isNotEmpty &&
          _expiryDateController.text.isNotEmpty &&
          _cvvController.text.isNotEmpty;
    } else {
      return _upiIdController.text.isNotEmpty;
    }
  }

  void _processPayment(
      BuildContext context, ParkingSpot spot, int hours) async {
    if (!_isFormValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    final parkingNumber = (DateTime.now().millisecondsSinceEpoch % 10000)
        .toString()
        .padLeft(4, '0');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationPage(
          spot: spot,
          hours: hours,
          parkingNumber: parkingNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final spot = args['spot'] as ParkingSpot;
    final hours = args['hours'] as int;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Payment Gateway'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.info_circle),
          onPressed: () {
            // Show payment info
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pay ₹${widget.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 3, 44, 88),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CupertinoSegmentedControl<bool>(
                children: {
                  true: const Text('Card'),
                  false: const Text('UPI'),
                },
                onValueChanged: (value) {
                  setState(() {
                    _isCardSelected = value;
                  });
                },
                groupValue: _isCardSelected,
              ),
              const SizedBox(height: 20),
              if (_isCardSelected)
                Column(
                  children: [
                    CupertinoTextField(
                      controller: _cardNumberController,
                      keyboardType: TextInputType.number,
                      placeholder: 'Card Number',
                      decoration: BoxDecoration(
                        border: Border.all(color: CupertinoColors.separator),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoTextField(
                            controller: _expiryDateController,
                            keyboardType: TextInputType.datetime,
                            placeholder: 'Expiry Date (MM/YY)',
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: CupertinoColors.separator),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CupertinoTextField(
                            controller: _cvvController,
                            keyboardType: TextInputType.number,
                            placeholder: 'CVV',
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: CupertinoColors.separator),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              else
                CupertinoTextField(
                  controller: _upiIdController,
                  keyboardType: TextInputType.emailAddress,
                  placeholder: 'UPI ID (e.g., user@upi)',
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.separator),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: _isLoading
                    ? null
                    : () => _processPayment(context, spot, hours),
                child: _isLoading
                    ? const CupertinoActivityIndicator()
                    : const Text('Pay Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
