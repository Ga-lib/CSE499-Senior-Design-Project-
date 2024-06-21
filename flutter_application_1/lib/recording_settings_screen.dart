import 'package:flutter/material.dart';
import 'package:flutter_application_1/AudioQualitySettingsScreen.dart';
import 'package:flutter_application_1/CustomizableThemesScreen.dart';
import 'package:flutter_application_1/Microphone_Sensitivity_Screen.dart';
import 'package:flutter_application_1/RecordingFormatOptionsScreen.dart';
import 'package:flutter_application_1/analytics_insights_screen.dart';
import 'package:flutter_application_1/cloud_integration_screen.dart';
import 'package:flutter_application_1/offline_mode_settings_screen.dart';
import 'package:flutter_application_1/scheduled_recordings_screen.dart';
import 'package:flutter_application_1/security_privacy_settings_screen.dart';
import 'package:flutter_application_1/transcription_services_settings_screen.dart';
import 'package:flutter_application_1/voice_commands_settings_screen.dart';

class RecordingSettingsScreen extends StatefulWidget {
  final bool autoStartStopRecording;
  final double recordingDurationLimit;
  final bool backgroundNoiseReduction;
  final ValueChanged<bool> onAutoStartStopChanged;
  final ValueChanged<double> onDurationLimitChanged;
  final ValueChanged<bool> onNoiseReductionChanged;

  RecordingSettingsScreen({
    required this.autoStartStopRecording,
    required this.recordingDurationLimit,
    required this.backgroundNoiseReduction,
    required this.onAutoStartStopChanged,
    required this.onDurationLimitChanged,
    required this.onNoiseReductionChanged,
  });

  @override
  _RecordingSettingsScreenState createState() =>
      _RecordingSettingsScreenState();
}

class _RecordingSettingsScreenState extends State<RecordingSettingsScreen> {
  late bool _autoStartStopRecording;
  late double _recordingDurationLimit;
  late bool _backgroundNoiseReduction;
  late double
      _recordingMicrophoneSensitivity; // Declare but don't initialize here

  @override
  void initState() {
    super.initState();
    _autoStartStopRecording = widget.autoStartStopRecording;
    _recordingDurationLimit = widget.recordingDurationLimit;
    _backgroundNoiseReduction = widget.backgroundNoiseReduction;
    _recordingMicrophoneSensitivity =
        0.5; // Initialize with a default value here
  }

  void _selectRecordingDurationLimit() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Recording Duration Limit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildDurationOption(30.0),
              _buildDurationOption(60.0),
              _buildDurationOption(120.0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDurationOption(double duration) {
    return ListTile(
      title: Text('$duration minutes'),
      leading: Radio<double>(
        value: duration,
        groupValue: _recordingDurationLimit,
        onChanged: (double? value) {
          if (value != null) {
            setState(() {
              _recordingDurationLimit = value;
              widget.onDurationLimitChanged(value);
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recording Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSettingTile(
              'Auto Start/Stop Recording',
              Switch(
                value: _autoStartStopRecording,
                onChanged: (bool value) {
                  setState(() {
                    _autoStartStopRecording = value;
                    widget.onAutoStartStopChanged(value);
                  });
                },
              ),
            ),
            _buildSettingTile(
              'Recording Duration Limit',
              ListTile(
                title: Text('$_recordingDurationLimit minutes'),
                onTap: _selectRecordingDurationLimit,
              ),
            ),
            _buildSettingTile(
              'Background Noise Reduction',
              Switch(
                value: _backgroundNoiseReduction,
                onChanged: (bool value) {
                  setState(() {
                    _backgroundNoiseReduction = value;
                    widget.onNoiseReductionChanged(value);
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _confirmClearData(context);
              },
              child: const Text('Clear Recorded Data'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            SizedBox(height: 20),
            _buildSettingTile(
              'Customizable Themes',
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomizableThemesScreen(),
                    ),
                  );
                },
                child: const Text('Customize Themes'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSettingTile(
              'Advanced Settings',
              ElevatedButton(
                onPressed: () {
                  _showAdvancedSettings();
                },
                child: const Text('Advanced Settings'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(String title, Widget trailingWidget) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
              ),
            ),
            SizedBox(height: 10),
            trailingWidget,
          ],
        ),
      ),
    );
  }

  void _confirmClearData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clear Recorded Data?'),
          content: Text('Are you sure you want to clear all recorded data?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Clear'),
              onPressed: () {
                // Perform clear operation here
                // Example: Clear data logic
                print('Clearing recorded data...');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAdvancedSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Advanced Settings'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAudioQualitySettings(),
                SizedBox(height: 20),
                _buildRecordingFormatOptions(),
                SizedBox(height: 20),
                _buildMicrophoneSensitivity(),
                SizedBox(height: 20),
                _buildScheduledRecordingsTile(),
                SizedBox(height: 20),
                _buildCloudIntegrationTile(),
                SizedBox(height: 20),
                _buildVoiceCommands(),
                SizedBox(height: 20),
                _buildTranscriptionServices(),
                SizedBox(height: 20),
                _buildAnalyticsAndInsights(),
                SizedBox(height: 20),
                _buildSecurityAndPrivacySettings(),
                SizedBox(height: 20),
                _buildOfflineMode(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAudioQualitySettings() {
    return ListTile(
      title: Text('Audio Quality Settings'),
      subtitle: Text('Adjust audio bitrate and sample rate'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AudioQualitySettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildRecordingFormatOptions() {
    return ListTile(
      title: Text('Recording Format Options'),
      subtitle: Text('Select recording format: WAV, MP3, etc.'),
      onTap: () async {
        final selectedFormat = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecordingFormatOptionsScreen(),
          ),
        );
        if (selectedFormat != null) {
          // Handle selected format, e.g., update preferences or settings
          print('Selected format: $selectedFormat');
          // Update any relevant state or settings with the selected format
        }
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildMicrophoneSensitivity() {
    return ListTile(
      title: Text('Microphone Sensitivity'),
      subtitle: Text('Adjust microphone input sensitivity'),
      onTap: () async {
        final selectedSensitivity = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MicrophoneSensitivityScreen(
              currentSensitivity: _recordingMicrophoneSensitivity,
            ),
          ),
        );
        if (selectedSensitivity != null) {
          setState(() {
            _recordingMicrophoneSensitivity = selectedSensitivity;
          });
          // Optionally, update any relevant settings or preferences with the selected sensitivity
          print('Selected sensitivity: $selectedSensitivity');
        }
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildScheduledRecordingsTile() {
    return ListTile(
      title: Text('Scheduled Recordings'),
      subtitle: Text('Set automatic recording schedules'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScheduledRecordingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildCloudIntegrationTile() {
    return ListTile(
      title: Text('Cloud Integration'),
      subtitle: Text('Sync recordings with cloud storage'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloudIntegrationSettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildVoiceCommands() {
    return ListTile(
      title: Text('Voice Commands'),
      subtitle: Text('Control recordings with voice commands'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VoiceCommandsSettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildTranscriptionServices() {
    return ListTile(
      title: Text('Transcription Services'),
      subtitle: Text('Enable real-time transcription'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TranscriptionServicesSettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildAnalyticsAndInsights() {
    return ListTile(
      title: Text('Analytics and Insights'),
      subtitle: Text('View recording statistics and insights'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnalyticsInsightsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildSecurityAndPrivacySettings() {
    return ListTile(
      title: Text('Security and Privacy Settings'),
      subtitle: Text('Manage privacy and security options'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecurityPrivacySettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildOfflineMode() {
    return ListTile(
      title: Text('Offline Mode'),
      subtitle: Text('Enable offline recording mode'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OfflineModeSettingsScreen(),
          ),
        );
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
