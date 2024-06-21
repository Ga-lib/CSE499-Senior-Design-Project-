import 'package:flutter/material.dart';

class MicrophoneSensitivityScreen extends StatefulWidget {
  final double currentSensitivity;

  MicrophoneSensitivityScreen({required this.currentSensitivity});

  @override
  _MicrophoneSensitivityScreenState createState() =>
      _MicrophoneSensitivityScreenState();
}

class _MicrophoneSensitivityScreenState
    extends State<MicrophoneSensitivityScreen> {
  late double _sensitivity; // Define _sensitivity here

  @override
  void initState() {
    super.initState();
    _sensitivity = widget.currentSensitivity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Microphone Sensitivity'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adjust Sensitivity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
              ),
            ),
            SizedBox(height: 20),
            Slider(
              value: _sensitivity,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label: '$_sensitivity',
              onChanged: (value) {
                setState(() {
                  _sensitivity = value;
                });
              },
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  _saveSensitivity();
                },
                icon: Icon(Icons.save),
                label: Text('Save Sensitivity'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveSensitivity() {
    // Implement logic to save or apply the selected sensitivity
    print('Selected sensitivity: $_sensitivity');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sensitivity saved: $_sensitivity'),
        duration: Duration(seconds: 2),
      ),
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context,
          _sensitivity); // Return selected sensitivity to previous screen after 2 seconds
    });
  }
}
