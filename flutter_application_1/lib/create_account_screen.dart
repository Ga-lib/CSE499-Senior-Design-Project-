import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String _name = '';
  String _phoneNumber = '';
  String _city = '';
  String _password = '';
  String _confirmPassword = '';
  String _gender = ''; // Can be 'male' or 'female'
  String _location = '';
  bool _agreeToTerms = false;

  void _signUp() {
    // Implement sign-up logic here
    if (_name.isNotEmpty &&
        _phoneNumber.isNotEmpty &&
        _city.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        _gender.isNotEmpty &&
        _location.isNotEmpty &&
        _agreeToTerms) {
      // Valid form, perform sign-up actions
      print('Signing up...');
      // You can navigate to another screen or perform other actions here
    } else {
      // Invalid form, show error message or handle accordingly
      print('Please fill all fields and agree to terms');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromRGBO(32, 121, 222, 1), // Use the same blue color
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Use the same blue color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(),
            const SizedBox(height: 30),
            _buildInputField('Name', Icons.person,
                onChanged: (value) => _name = value),
            const SizedBox(height: 20),
            _buildInputField('Phone Number', Icons.phone,
                keyboardType: TextInputType.phone,
                onChanged: (value) => _phoneNumber = value),
            const SizedBox(height: 20),
            _buildInputField('City', Icons.location_city,
                onChanged: (value) => _city = value),
            const SizedBox(height: 20),
            _buildInputField('Password', Icons.lock,
                obscureText: true, onChanged: (value) => _password = value),
            const SizedBox(height: 20),
            _buildInputField('Confirm Password', Icons.lock,
                obscureText: true,
                onChanged: (value) => _confirmPassword = value),
            const SizedBox(height: 20),
            _buildGenderSelection(),
            const SizedBox(height: 20),
            _buildInputField('Location', Icons.location_on,
                onChanged: (value) => _location = value),
            const SizedBox(height: 20),
            _buildTermsCheckbox(),
            const SizedBox(height: 40),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          'Please fill out the following details to create your account.',
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildInputField(String label, IconData icon,
      {TextInputType? keyboardType,
      bool obscureText = false,
      required ValueChanged<String> onChanged}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.blue.withOpacity(0.3),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.withOpacity(0.8), width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildGenderButton('Male', Icons.male,
            isSelected: _gender == 'male', onTap: () => _selectGender('male')),
        const SizedBox(width: 20),
        _buildGenderButton('Female', Icons.female,
            isSelected: _gender == 'female',
            onTap: () => _selectGender('female')),
      ],
    );
  }

  Widget _buildGenderButton(String label, IconData icon,
      {required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: isSelected ? Colors.white : Colors.blue),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.blue, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _selectGender(String gender) {
    setState(() {
      _gender = gender;
    });
  }

  Widget _buildTermsCheckbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _agreeToTerms,
          onChanged: (value) {
            setState(() {
              _agreeToTerms = value!;
            });
          },
          activeColor: Colors.blue,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'I agree to the Terms of Use and Privacy Policy',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: _signUp,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Sign up',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
