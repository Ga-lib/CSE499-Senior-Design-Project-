import 'package:flutter/material.dart';

class TroubleshootingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Troubleshooting'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Updated app bar color
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Troubleshooting',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(32, 121, 222, 1), // Updated title color
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Explore solutions to common problems and how to fix them.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              _buildTroubleshootingItem(
                context: context,
                title: 'App Crashing',
                description:
                    'If the app is crashing frequently, try the following steps:\n1. Restart the app.\n2. Clear the app cache.\n3. Reinstall the app.',
              ),
              SizedBox(height: 20),
              _buildTroubleshootingItem(
                context: context,
                title: 'Login Issues',
                description:
                    'If you are facing login issues, ensure the following:\n1. Check your internet connection.\n2. Verify your username and password.\n3. Reset your password if necessary.',
              ),
              SizedBox(height: 20),
              _buildTroubleshootingItem(
                context: context,
                title: 'Slow Performance',
                description:
                    'For slow performance, consider:\n1. Closing other running apps.\n2. Restarting your device.\n3. Updating the app to the latest version.',
              ),
              SizedBox(height: 20),
              _buildTroubleshootingItem(
                context: context,
                title: 'Feature Not Working',
                description:
                    'If a specific feature is not working:\n1. Check for any available updates.\n2. Ensure you have the necessary permissions enabled.\n3. Contact support if the issue persists.',
              ),
              // Add more troubleshooting items here as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTroubleshootingItem({
    required BuildContext context,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(32, 121, 222, 1), // Updated title color
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
