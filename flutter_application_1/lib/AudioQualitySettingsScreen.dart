import 'package:flutter/material.dart';

class AudioQualitySettingsScreen extends StatefulWidget {
  @override
  _AudioQualitySettingsScreenState createState() =>
      _AudioQualitySettingsScreenState();
}

class _AudioQualitySettingsScreenState
    extends State<AudioQualitySettingsScreen> {
  int _selectedBitrate = 128; // Default bitrate
  double _selectedSampleRate = 44100.0; // Default sample rate

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Quality Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bitrate',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
              ),
            ),
            SizedBox(height: 10),
            _buildBitrateOptions(),
            SizedBox(height: 20),
            Text(
              'Sample Rate',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
              ),
            ),
            SizedBox(height: 10),
            _buildSampleRateOptions(),
            SizedBox(height: 20),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBitrateOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<int>(
          title: Text('128 kbps'),
          value: 128,
          groupValue: _selectedBitrate,
          onChanged: (int? value) {
            setState(() {
              if (value != null) {
                _selectedBitrate = value;
                // Implement logic to save or apply bitrate settings
              }
            });
          },
        ),
        RadioListTile<int>(
          title: Text('256 kbps'),
          value: 256,
          groupValue: _selectedBitrate,
          onChanged: (int? value) {
            setState(() {
              if (value != null) {
                _selectedBitrate = value;
                // Implement logic to save or apply bitrate settings
              }
            });
          },
        ),
        // Add more bitrate options as needed
      ],
    );
  }

  Widget _buildSampleRateOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<double>(
          title: Text('44.1 kHz'),
          value: 44100.0,
          groupValue: _selectedSampleRate,
          onChanged: (double? value) {
            setState(() {
              if (value != null) {
                _selectedSampleRate = value;
                // Implement logic to save or apply sample rate settings
              }
            });
          },
        ),
        RadioListTile<double>(
          title: Text('48 kHz'),
          value: 48000.0,
          groupValue: _selectedSampleRate,
          onChanged: (double? value) {
            setState(() {
              if (value != null) {
                _selectedSampleRate = value;
                // Implement logic to save or apply sample rate settings
              }
            });
          },
        ),
        // Add more sample rate options as needed
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement logic to save audio quality settings
          print(
              'Saved: Bitrate: $_selectedBitrate, Sample Rate: $_selectedSampleRate');
          _showSnackBar('Audio quality settings saved');
        },
        child: Text('Save Changes'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(32, 121, 222, 1), // Button color
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
