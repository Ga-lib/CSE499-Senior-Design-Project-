import 'package:flutter/material.dart';

class AudioSettingsScreen extends StatefulWidget {
  final double microphoneSensitivity;
  final String audioFormat;
  final double sampleRate;
  final ValueChanged<double> onSensitivityChanged;
  final ValueChanged<String> onFormatChanged;
  final ValueChanged<double> onSampleRateChanged;

  const AudioSettingsScreen({
    required this.microphoneSensitivity,
    required this.audioFormat,
    required this.sampleRate,
    required this.onSensitivityChanged,
    required this.onFormatChanged,
    required this.onSampleRateChanged,
    Key? key,
  }) : super(key: key);

  @override
  _AudioSettingsScreenState createState() => _AudioSettingsScreenState();
}

class _AudioSettingsScreenState extends State<AudioSettingsScreen> {
  late double _microphoneSensitivity;
  late String _audioFormat;
  late double _sampleRate;

  @override
  void initState() {
    super.initState();
    _microphoneSensitivity = widget.microphoneSensitivity;
    _audioFormat = widget.audioFormat;
    _sampleRate = widget.sampleRate;
    print("Initial microphone sensitivity: $_microphoneSensitivity");
    print("Initial audio format: $_audioFormat");
    print("Initial sample rate: $_sampleRate");
  }

  void _selectAudioFormat() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Audio Format'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('MP3'),
                leading: Radio<String>(
                  value: 'MP3',
                  groupValue: _audioFormat,
                  onChanged: (String? value) {
                    setState(() {
                      _audioFormat = value!;
                      widget.onFormatChanged(value);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('WAV'),
                leading: Radio<String>(
                  value: 'WAV',
                  groupValue: _audioFormat,
                  onChanged: (String? value) {
                    setState(() {
                      _audioFormat = value!;
                      widget.onFormatChanged(value);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('FLAC'),
                leading: Radio<String>(
                  value: 'FLAC',
                  groupValue: _audioFormat,
                  onChanged: (String? value) {
                    setState(() {
                      _audioFormat = value!;
                      widget.onFormatChanged(value);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectSampleRate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Sample Rate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('44.1 kHz'),
                leading: Radio<double>(
                  value: 44.1,
                  groupValue: _sampleRate,
                  onChanged: (double? value) {
                    setState(() {
                      _sampleRate = value!;
                      widget.onSampleRateChanged(value);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('48 kHz'),
                leading: Radio<double>(
                  value: 48.0,
                  groupValue: _sampleRate,
                  onChanged: (double? value) {
                    setState(() {
                      _sampleRate = value!;
                      widget.onSampleRateChanged(value);
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Microphone Sensitivity'),
              trailing: Slider(
                value: _microphoneSensitivity,
                onChanged: (double value) {
                  setState(() {
                    _microphoneSensitivity = value;
                    widget.onSensitivityChanged(value);
                  });
                },
                min: 0.0,
                max: 1.0,
              ),
            ),
            ListTile(
              title: const Text('Audio Format'),
              subtitle: Text(_audioFormat),
              onTap: _selectAudioFormat,
            ),
            ListTile(
              title: const Text('Sample Rate'),
              subtitle: Text('$_sampleRate kHz'),
              onTap: _selectSampleRate,
            ),
          ],
        ),
      ),
    );
  }
}
