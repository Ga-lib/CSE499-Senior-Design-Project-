import 'package:flutter/material.dart';

class ScheduledRecordingsScreen extends StatefulWidget {
  @override
  _ScheduledRecordingsScreenState createState() =>
      _ScheduledRecordingsScreenState();
}

class _ScheduledRecordingsScreenState extends State<ScheduledRecordingsScreen> {
  List<ScheduledRecording> _scheduledRecordings =
      []; // Placeholder for scheduled recordings

  @override
  void initState() {
    super.initState();
    // Fetch or initialize scheduled recordings data
    _loadScheduledRecordings();
  }

  void _loadScheduledRecordings() {
    // Simulated data loading for demonstration purposes
    setState(() {
      _scheduledRecordings = [
        ScheduledRecording('Monday', '10:00 AM', 'WAV'),
        ScheduledRecording('Wednesday', '2:00 PM', 'MP3'),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Recordings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: _buildScheduledRecordingsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add new scheduled recording screen
          _navigateToAddScheduledRecording();
        },
        child: Icon(Icons.add),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
    );
  }

  Widget _buildScheduledRecordingsList() {
    if (_scheduledRecordings.isEmpty) {
      return Center(
        child: Text(
          'No scheduled recordings found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _scheduledRecordings.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                _scheduledRecordings[index].day,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${_scheduledRecordings[index].time} (${_scheduledRecordings[index].format})',
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Implement delete functionality
                  _deleteScheduledRecording(index);
                },
              ),
            ),
          );
        },
      );
    }
  }

  void _deleteScheduledRecording(int index) {
    setState(() {
      _scheduledRecordings.removeAt(index);
    });
    // Implement logic to delete scheduled recording
    print('Deleted scheduled recording at index $index');
  }

  void _navigateToAddScheduledRecording() {
    // Navigate to add new scheduled recording screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddScheduledRecordingScreen(),
      ),
    ).then((value) {
      // Handle result from add scheduled recording screen if needed
      if (value != null && value is ScheduledRecording) {
        // Add new scheduled recording to the list
        setState(() {
          _scheduledRecordings.add(value);
        });
      }
    });
  }
}

class ScheduledRecording {
  final String day;
  final String time;
  final String format;

  ScheduledRecording(this.day, this.time, this.format);
}

class AddScheduledRecordingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Scheduled Recording'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Day and Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
              ),
            ),
            SizedBox(height: 16),
            _buildDayPicker(),
            SizedBox(height: 16),
            _buildTimePicker(),
            SizedBox(height: 16),
            _buildFormatPicker(),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveScheduledRecording(context);
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(
                      32, 121, 222, 1), // Your app's primary color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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

  Widget _buildDayPicker() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Day',
        border: OutlineInputBorder(),
      ),
      items: [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ]
          .map((day) => DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              ))
          .toList(),
      onChanged: (value) {
        // Handle day selection
      },
    );
  }

  Widget _buildTimePicker() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter Time',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.datetime,
      onTap: () {
        // Show time picker
      },
    );
  }

  Widget _buildFormatPicker() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Select Format',
        border: OutlineInputBorder(),
      ),
      items: ['WAV', 'MP3', 'FLAC', 'AAC', 'OGG']
          .map((format) => DropdownMenuItem<String>(
                value: format,
                child: Text(format),
              ))
          .toList(),
      onChanged: (value) {
        // Handle format selection
      },
    );
  }

  void _saveScheduledRecording(BuildContext context) {
    // Implement logic to save or submit scheduled recording
    // For demo purposes, just pop the screen
    Navigator.pop(context,
        ScheduledRecording('Selected day', 'Selected time', 'Selected format'));
  }
}
