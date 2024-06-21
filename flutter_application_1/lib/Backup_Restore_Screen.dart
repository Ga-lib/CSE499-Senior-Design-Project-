import 'package:flutter/material.dart';

class BackupRestoreScreen extends StatefulWidget {
  @override
  _BackupRestoreScreenState createState() => _BackupRestoreScreenState();
}

class _BackupRestoreScreenState extends State<BackupRestoreScreen> {
  String? selectedOption;
  String? selectedGoogleAccount;
  String lastBackupTime = ''; // Variable to store last backup time
  int backupSizeMB = 0; // Variable to store backup size in MB

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Backup and Restore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Backup Options',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 16),
                      _buildButton(
                        'Backup Now',
                        () => _backupNow(context),
                        Colors.green,
                      ),
                      SizedBox(height: 16),
                      _buildButton(
                        'Schedule Backup',
                        () => _showScheduleOptions(context),
                        Colors.green,
                      ),
                      if (selectedOption != null) ...[
                        SizedBox(height: 16),
                        Text(
                          'Scheduled Backup: $selectedOption',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                      SizedBox(height: 24),
                      _buildGoogleAccountSelector(),
                      SizedBox(height: 24),
                      _buildBackupDetails(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            _buildFooterButton(
              'Restore Backup',
              () => _restoreBackup(context),
              Color.fromRGBO(32, 121, 222, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildFooterButton(String label, VoidCallback onPressed, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildBackupDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Last Backup: $lastBackupTime',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 8),
        Text(
          'Size: $backupSizeMB MB',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  void _backupNow(BuildContext context) {
    setState(() {
      lastBackupTime = _getCurrentTime(); // Update last backup time
      backupSizeMB = _simulateBackupSize(); // Update backup size in MB
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Backup initiated')),
    );
  }

  void _restoreBackup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Restore backup feature coming soon!')),
    );
  }

  void _showScheduleOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Select Backup Schedule',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  _buildOptionButton(context, 'Never'),
                  _buildOptionButton(context, 'Only when I tap "Back up"'),
                  _buildOptionButton(context, 'Daily'),
                  _buildOptionButton(context, 'Weekly'),
                  _buildOptionButton(context, 'Monthly'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement logic to save the selected schedule option
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Backup schedule set: $selectedOption'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(32, 121, 222, 1),
                        ),
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOptionButton(BuildContext context, String option) {
    return RadioListTile<String>(
      title: Text(option),
      value: option,
      groupValue: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
      },
    );
  }

  Widget _buildGoogleAccountSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Google Account for Backup',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: selectedGoogleAccount,
          onChanged: (value) {
            setState(() {
              selectedGoogleAccount = value;
            });
          },
          items: [
            DropdownMenuItem(
              value: 'wakib.galib@northsouth.edu',
              child: Text('wakib.galib@northsouth.edu'),
            ),
            DropdownMenuItem(
              value: 'example@gmail.com',
              child: Text('example@gmail.com'),
            ),
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Select Google Account',
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Implement logic to add a new account
              },
              child: Text(
                'Add Account',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to save the selected account
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Selected Google Account: $selectedGoogleAccount'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }

  String _getCurrentTime() {
    // Helper function to get current time in format: hh:mm a
    DateTime now = DateTime.now();
    return TimeOfDay.fromDateTime(now).format(context);
  }

  int _simulateBackupSize() {
    // Helper function to simulate backup size in MB
    return 67; // Replace with actual calculation or data retrieval logic
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 121, 222, 1),
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(32, 121, 222, 1),
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(32, 121, 222, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      home: BackupRestoreScreen(),
    );
  }
}
