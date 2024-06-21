import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  final bool dataSharing;
  final String dataStorage;
  final ValueChanged<bool> onDataSharingChanged;
  final ValueChanged<String> onDataStorageChanged;

  PrivacySettingsScreen({
    required this.dataSharing,
    required this.dataStorage,
    required this.onDataSharingChanged,
    required this.onDataStorageChanged,
  });

  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  late bool _dataSharing;
  late String _dataStorage;

  @override
  void initState() {
    super.initState();
    _dataSharing = widget.dataSharing;
    _dataStorage = widget.dataStorage;
  }

  void _selectDataStorageOption() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Data Storage Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildDataStorageOption('Local Storage', Icons.storage),
              _buildDataStorageOption('Cloud Storage', Icons.cloud),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataStorageOption(String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        setState(() {
          _dataStorage = title;
          widget.onDataStorageChanged(title);
          Navigator.pop(context);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                title: const Text(
                  'Data Sharing',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Match to app's primary color
                  ),
                ),
                value: _dataSharing,
                onChanged: (bool value) {
                  setState(() {
                    _dataSharing = value;
                    widget.onDataSharingChanged(value);
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: const Text(
                  'Data Storage',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Match to app's primary color
                  ),
                ),
                subtitle: Text(
                  _dataStorage,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.blue), // Match to app's primary color
                onTap: _selectDataStorageOption,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Clear all recorded data
                _showClearDataConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Clear Data'),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearDataConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear Data'),
          content: Text('Are you sure you want to clear all recorded data?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement your logic to clear data
                print('Data cleared');
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}
