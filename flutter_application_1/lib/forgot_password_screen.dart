import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Your Password?'),
        centerTitle: true,
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Match SignInScreen color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildLogo(), // No need to pass context here
              const SizedBox(height: 20),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.lock,
          size: 60,
          color: Color.fromRGBO(32, 121, 222, 1), // Match SignInScreen color
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _emailSent = false;
  bool _otpVerified = false;
  bool _isLoading = false; // For showing loading indicator

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _sendResetEmail() {
    final String email = _emailController.text.trim();
    // Simulating a delay to show loading indicator
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      // Replace with actual logic to send password reset email
      // Example: AuthService.sendPasswordResetEmail(email);
      print('Sending password reset email to $email');
      setState(() {
        _emailSent = true;
        _isLoading = false;
      });
    });
  }

  void _verifyOTP() {
    String otp = _otpController.text.trim();
    if (otp.isNotEmpty) {
      // Simulating OTP verification
      setState(() {
        _otpVerified = true;
      });
    } else {
      print('Please enter the OTP received on your email');
    }
  }

  void _continueToNewPassword() {
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        newPassword == confirmPassword) {
      // TODO: Implement logic to update the password
      print('Password updated successfully');
      // Navigate to success screen or appropriate screen
      Navigator.pop(
          context); // Pop back to previous screen after updating password
    } else {
      // Show error or handle password mismatch scenario
      print('Passwords do not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildStepIndicator(),
        _buildStepContent(),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStepCircle('1', 'Enter Email', _emailSent),
        _buildStepLine(),
        _buildStepCircle('2', 'Verify Email', _otpVerified),
        _buildStepLine(),
        _buildStepCircle('3', 'Set New Password', false),
      ],
    );
  }

  Widget _buildStepCircle(String number, String title, bool completed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: completed ? Colors.green : Colors.grey.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStepLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  Widget _buildStepContent() {
    if (!_emailSent) {
      return _buildEnterEmailUI();
    } else if (!_otpVerified) {
      return _buildVerifyEmailUI();
    } else {
      return _buildNewPasswordUI();
    }
  }

  Widget _buildEnterEmailUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 20),
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Enter your email',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _isLoading ? null : _sendResetEmail,
          child: _isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const Text('Next'),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Color.fromRGBO(32, 121, 222, 1), // Match SignInScreen color
          ),
        ),
      ],
    );
  }

  Widget _buildVerifyEmailUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 20),
        TextFormField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter OTP',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter OTP';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _verifyOTP,
          child: const Text('Verify'),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Color.fromRGBO(32, 121, 222, 1), // Match SignInScreen color
          ),
        ),
      ],
    );
  }

  Widget _buildNewPasswordUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 20),
        TextFormField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter New Password',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter new password';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm New Password',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm new password';
            } else if (value != _newPasswordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _continueToNewPassword,
          child: const Text('Continue'),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Color.fromRGBO(32, 121, 222, 1), // Match SignInScreen color
          ),
        ),
      ],
    );
  }
}
