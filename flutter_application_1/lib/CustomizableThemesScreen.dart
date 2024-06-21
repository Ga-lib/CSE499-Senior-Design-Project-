import 'package:flutter/material.dart';

class CustomizableThemesScreen extends StatefulWidget {
  @override
  _CustomizableThemesScreenState createState() =>
      _CustomizableThemesScreenState();
}

class _CustomizableThemesScreenState extends State<CustomizableThemesScreen> {
  Color _primaryColor =
      Color.fromRGBO(32, 121, 222, 1); // Default primary color
  Brightness? _brightness = Brightness.light; // Nullable Brightness

  void _setPrimaryColor(Color color) {
    setState(() {
      _primaryColor = color;
    });
  }

  void _setBrightness(Brightness? brightness) {
    setState(() {
      _brightness = brightness; // Nullable assignment
    });
  }

  void _saveThemeChanges(BuildContext context) {
    // Apply selected theme changes here (e.g., save to preferences, update app theme)
    // For demo purposes, we print the selected options
    print('Selected Primary Color: $_primaryColor');
    print('Selected Theme Mode: $_brightness');
    // Close the screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customizable Themes'),
        backgroundColor: Colors.indigo, // Updated background color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Customize Themes Here',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildColorPickerSection(),
            SizedBox(height: 20),
            _buildThemeModeSection(),
            Spacer(), // Spacer to push content to the top
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () => _saveThemeChanges(context),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _primaryColor, // Use the selected primary color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPickerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Primary Color:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildColorPickerItem(Colors.blue),
            _buildColorPickerItem(Colors.red),
            _buildColorPickerItem(Colors.green),
            _buildColorPickerItem(Colors.orange),
            _buildColorPickerItem(Colors.purple),
          ],
        ),
      ],
    );
  }

  Widget _buildColorPickerItem(Color color) {
    return GestureDetector(
      onTap: () {
        _setPrimaryColor(color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: color == _primaryColor ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildThemeModeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Theme Mode:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ListTile(
          title: Text('Light Mode'),
          leading: Radio<Brightness?>(
            value: Brightness.light,
            groupValue: _brightness,
            onChanged: _setBrightness,
          ),
        ),
        ListTile(
          title: Text('Dark Mode'),
          leading: Radio<Brightness?>(
            value: Brightness.dark,
            groupValue: _brightness,
            onChanged: _setBrightness,
          ),
        ),
      ],
    );
  }
}
