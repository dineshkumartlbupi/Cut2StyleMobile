// 📁 lib/views/auth/otp_screen.dart
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Verify OTP'),
              onPressed: () {
                // TODO: Add OTP verification logic
              },
            )
          ],
        ),
      ),
    );
  }
}
