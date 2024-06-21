import 'package:flutter/material.dart';

class RecordingFormatOptionsScreen extends StatefulWidget {
  @override
  _RecordingFormatOptionsScreenState createState() =>
      _RecordingFormatOptionsScreenState();
}

class _RecordingFormatOptionsScreenState
    extends State<RecordingFormatOptionsScreen> {
  String? _selectedFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recording Format Options'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormatOption('WAV', Icons.music_note_outlined),
          _buildFormatOption('MP3', Icons.audiotrack_outlined),
          _buildFormatOption('FLAC', Icons.library_music_outlined),
          _buildFormatOption('AAC', Icons.music_note),
          _buildFormatOption('OGG', Icons.music_note),
        ],
      ),
      floatingActionButton: _buildSaveButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFormatOption(String format, IconData icon) {
    return ListTile(
      title: Text(format),
      leading: Icon(icon),
      trailing: Radio<String>(
        value: format,
        groupValue: _selectedFormat,
        onChanged: (String? value) {
          setState(() {
            _selectedFormat = value;
          });
        },
      ),
      onTap: () {
        setState(() {
          _selectedFormat = format;
        });
      },
    );
  }

  Widget _buildSaveButton() {
    return FloatingActionButton.extended(
      onPressed: _selectedFormat != null ? _saveFormat : null,
      label: Text('Save'),
      icon: Icon(Icons.save),
      backgroundColor:
          _selectedFormat != null ? Colors.blue : Colors.grey.withOpacity(0.6),
    );
  }

  void _saveFormat() {
    // Implement logic to save or apply selected recording format
    print('Selected format: $_selectedFormat');
    Navigator.pop(
        context, _selectedFormat); // Return selected format to previous screen
  }
}
