import 'package:flutter/material.dart';

class GettingStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getting Started'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Match the app bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Our App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Match the primary color
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Here at Our App, we want to make your experience as smooth and enjoyable as possible. '
              'Below, you\'ll find everything you need to get started:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            _buildSectionTitle('1. Account Creation'),
            _buildSectionContent(
              'To begin using Our App, you need to create an account. '
              'Simply tap on the "Sign Up" button on the login screen and follow the prompts. '
              'We\'ll ask for basic information to set up your account securely.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('2. Navigation Basics'),
            _buildSectionContent(
              'Our App features a simple and intuitive navigation system. '
              'Use the bottom navigation bar to switch between different sections of the app. '
              'You\'ll find tabs for Home, Profile, Notifications, and more.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('3. Exploring Features'),
            _buildSectionContent(
              'Explore the features available in Our App by tapping on different icons and buttons. '
              'Each feature is designed to enhance your experience and provide useful functionality. '
              'Take your time to familiarize yourself with all the options available.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('4. Getting Help'),
            _buildSectionContent(
              'If you ever get stuck or have questions while using Our App, we\'re here to help. '
              'Tap on the "Support" option in the menu to access our Help Center, where you\'ll find '
              'answers to common questions and ways to contact our support team directly.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 121, 222, 1), // Match the primary color
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[800],
      ),
    );
  }
}
