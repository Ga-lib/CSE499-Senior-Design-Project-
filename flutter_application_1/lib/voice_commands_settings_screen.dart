import 'package:flutter/material.dart';

class VoiceCommandsSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Commands Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: Icon(
                Icons.mic,
                size: 50,
                color: Color.fromRGBO(32, 121, 222, 1),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(height: 20),
            _buildVoiceCommandOption(
              title: 'Enable Voice Recognition',
              subtitle: 'Tap to enable voice commands',
              icon: Icons.mic,
              onPressed: () {
                // Implement voice commands configuration
                _showSnackbar(context, 'Voice commands enabled');
              },
            ),
            SizedBox(height: 20),
            _buildVoiceCommandOption(
              title: 'Voice Recognition Language',
              subtitle: 'English (US)',
              icon: Icons.language,
              onPressed: () {
                // Implement language selection for voice recognition
                _showSnackbar(context, 'Language changed to English (US)');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceCommandOption(
      {required String title,
      required String subtitle,
      required IconData icon,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color.fromRGBO(32, 121, 222, 1),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
