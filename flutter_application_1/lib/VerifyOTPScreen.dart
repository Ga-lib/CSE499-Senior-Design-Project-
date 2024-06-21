import 'package:flutter/material.dart';

class VerifyOTPScreen extends StatelessWidget {
  final String email;

  const VerifyOTPScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    void _verifyOTP() {
      // Implement OTP verification logic
      String otp = otpController.text.trim();
      if (otp.isNotEmpty) {
        // TODO: Implement OTP verification logic here
        print('OTP verified successfully');
        // Navigate to password reset screen or appropriate screen
      } else {
        // Show error or handle empty OTP scenario
        print('Please enter the OTP received on your email');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Email'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Verify Your Email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'We just sent you the OTP on your email, please enter below to verify your email',
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
