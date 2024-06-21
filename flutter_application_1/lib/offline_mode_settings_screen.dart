import 'package:flutter/material.dart';

class OfflineModeSettingsScreen extends StatefulWidget {
  @override
  _OfflineModeSettingsScreenState createState() =>
      _OfflineModeSettingsScreenState();
}

class _OfflineModeSettingsScreenState extends State<OfflineModeSettingsScreen> {
  bool _offlineModeEnabled = false;
  bool _autoSyncEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Mode Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Updated primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSwitchListTile(
              'Enable Offline Mode',
              _offlineModeEnabled,
              (value) {
                setState(() {
                  _offlineModeEnabled = value;
                });
                _showSnackbar(
                  context,
                  value
                      ? 'Offline recording mode enabled'
                      : 'Offline recording mode disabled',
                );
              },
            ),
            SizedBox(height: 20),
            _buildSwitchListTile(
              'Auto Sync Recordings',
              _autoSyncEnabled,
              (value) {
                setState(() {
                  _autoSyncEnabled = value;
                });
                _showSnackbar(
                  context,
                  value ? 'Auto sync enabled' : 'Auto sync disabled',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchListTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(color: Color.fromRGBO(32, 121, 222, 1)), // Text color
      ),
      subtitle: Text(
        value ? 'Enabled' : 'Disabled',
        style: TextStyle(color: Colors.grey),
      ),
      secondary: Icon(
        value ? Icons.check_circle : Icons.cancel,
        color: value ? Colors.green : Colors.red,
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Color.fromRGBO(32, 121, 222, 1), // Switch color
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
