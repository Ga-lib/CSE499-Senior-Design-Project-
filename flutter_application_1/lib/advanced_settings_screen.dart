import 'package:flutter/material.dart';

class AdvancedSettingsScreen extends StatefulWidget {
  final bool debugMode;
  final ValueChanged<bool> onDebugModeChanged;

  AdvancedSettingsScreen({
    required this.debugMode,
    required this.onDebugModeChanged,
  });

  @override
  _AdvancedSettingsScreenState createState() => _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState extends State<AdvancedSettingsScreen> {
  late bool _debugMode;
  String? _selectedModel;

  @override
  void initState() {
    super.initState();
    _debugMode = widget.debugMode;
  }

  void _showModelSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color.fromRGBO(32, 121, 222, 1), // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildModelOption(context, 'ANN'),
                _buildModelOption(context, 'CNN1D'),
                _buildModelOption(context, 'CNN2D'),
                _buildModelOption(context, 'LSTM'),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Perform save operation here
                      if (_selectedModel != null) {
                        print('Selected model: $_selectedModel');
                        // Optionally, you can save `_selectedModel` to storage or perform other actions
                        Navigator.pop(context); // Close the dialog
                      } else {
                        // Handle case where no model is selected
                        print('Please select a model');
                      }
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(32, 121, 222, 1),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildModelOption(BuildContext context, String modelName) {
    bool isSelected = _selectedModel == modelName;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          modelName,
          style: TextStyle(color: Colors.white),
        ),
        tileColor: isSelected ? Colors.white : null,
        selectedTileColor: Colors.white,
        leading: Radio<String>(
          value: modelName,
          groupValue: _selectedModel,
          onChanged: (String? value) {
            setState(() {
              _selectedModel = value;
            });
          },
          activeColor: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Settings'),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1), // App bar color
      ),
      body: Container(
        color: Colors.white, // Background color
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                _showModelSelectionDialog(context);
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Model Selection',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(32, 121, 222, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(32, 121, 222, 1),
                      ),
                    ],
                  ),
                ),
                color: Colors.blue[50], // Card background color
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigate to Algorithm Parameters screen
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Algorithm Parameters',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(32, 121, 222, 1),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromRGBO(32, 121, 222, 1),
                      ),
                    ],
                  ),
                ),
                color: Colors.blue[50], // Card background color
              ),
            ),
            SizedBox(height: 20),
            SwitchListTile(
              title: const Text(
                'Debug Mode',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(32, 121, 222, 1),
                ),
              ),
              activeColor: Color.fromRGBO(32, 121, 222, 1),
              value: _debugMode,
              onChanged: (bool value) {
                setState(() {
                  _debugMode = value;
                  widget.onDebugModeChanged(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
