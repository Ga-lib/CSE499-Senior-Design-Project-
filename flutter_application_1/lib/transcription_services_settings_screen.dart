import 'package:flutter/material.dart';

class TranscriptionServicesSettingsScreen extends StatefulWidget {
  @override
  _TranscriptionServicesSettingsScreenState createState() =>
      _TranscriptionServicesSettingsScreenState();
}

class _TranscriptionServicesSettingsScreenState
    extends State<TranscriptionServicesSettingsScreen> {
  bool _realTimeTranscriptionEnabled = false;
  bool _textFormattingEnabled = true; // New feature: Text formatting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transcription Services'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-Time Transcription',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enable Real-Time Transcription',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _realTimeTranscriptionEnabled,
                  onChanged: (value) {
                    setState(() {
                      _realTimeTranscriptionEnabled = value;
                    });
                    _handleRealTimeTranscription(value);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'Text Formatting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enable Text Formatting',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: _textFormattingEnabled,
                  onChanged: (value) {
                    setState(() {
                      _textFormattingEnabled = value;
                    });
                    _handleTextFormatting(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleRealTimeTranscription(bool enabled) {
    String message = enabled
        ? 'Enabled real-time transcription'
        : 'Disabled real-time transcription';
    _showSnackbar(context, message);
    // Implement logic to apply/save the setting
    // Example: Save to preferences, send to server, etc.
  }

  void _handleTextFormatting(bool enabled) {
    String message =
        enabled ? 'Enabled text formatting' : 'Disabled text formatting';
    _showSnackbar(context, message);
    // Implement logic to apply/save the setting
    // Example: Save to preferences, send to server, etc.
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
