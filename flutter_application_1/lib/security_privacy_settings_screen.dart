import 'package:flutter/material.dart';

class SecurityPrivacySettingsScreen extends StatefulWidget {
  @override
  _SecurityPrivacySettingsScreenState createState() =>
      _SecurityPrivacySettingsScreenState();
}

class _SecurityPrivacySettingsScreenState
    extends State<SecurityPrivacySettingsScreen> {
  bool _isFingerprintEnabled = false;
  bool _isAnalyticsEnabled = true;
  bool _isNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security and Privacy Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Updated primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildPrivacyOption(
              'Enable Fingerprint',
              _isFingerprintEnabled,
              (value) {
                setState(() {
                  _isFingerprintEnabled = value;
                });
              },
            ),
            _buildPrivacyOption(
              'Enable Analytics',
              _isAnalyticsEnabled,
              (value) {
                setState(() {
                  _isAnalyticsEnabled = value;
                });
              },
            ),
            _buildPrivacyOption(
              'Enable Notifications',
              _isNotificationsEnabled,
              (value) {
                setState(() {
                  _isNotificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyOption(
      String title, bool value, ValueChanged<bool> onChanged) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Color.fromRGBO(32, 121, 222, 1)), // Text color
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color.fromRGBO(32, 121, 222, 1), // Switch color
      ),
    );
  }
}
