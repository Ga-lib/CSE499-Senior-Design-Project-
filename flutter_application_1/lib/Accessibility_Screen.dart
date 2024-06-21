import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 121, 222, 1),
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(32, 121, 222, 1),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: AccessibilityScreen(),
    );
  }
}

class AccessibilityScreen extends StatefulWidget {
  @override
  _AccessibilityScreenState createState() => _AccessibilityScreenState();
}

class _AccessibilityScreenState extends State<AccessibilityScreen> {
  bool textSizeExpanded = false;
  bool colorContrastExpanded = false;
  bool audioAssistanceExpanded = false;
  bool touchGesturesExpanded = false;

  int selectedTextSize = 1; // Default text size option
  int selectedContrastOption = 1; // Default contrast option
  bool audioAssistanceEnabled = false; // Audio assistance enabled/disabled
  bool touchGesturesEnabled = true; // Touch gestures enabled/disabled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Accessibility Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            SizedBox(height: 24),
            _buildSettingsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customize Your Accessibility Options',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Make your app easier to use for everyone',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExpansionPanel(
          isExpanded: textSizeExpanded,
          headerText: 'Text Size',
          content: _buildTextSizeSettings(),
          onPressed: () {
            setState(() {
              textSizeExpanded = !textSizeExpanded;
            });
          },
        ),
        SizedBox(height: 16),
        _buildExpansionPanel(
          isExpanded: colorContrastExpanded,
          headerText: 'Color Contrast',
          content: _buildColorContrastSettings(),
          onPressed: () {
            setState(() {
              colorContrastExpanded = !colorContrastExpanded;
            });
          },
        ),
        SizedBox(height: 16),
        _buildExpansionPanel(
          isExpanded: audioAssistanceExpanded,
          headerText: 'Audio Assistance',
          content: _buildAudioAssistanceSettings(),
          onPressed: () {
            setState(() {
              audioAssistanceExpanded = !audioAssistanceExpanded;
            });
          },
        ),
        SizedBox(height: 16),
        _buildExpansionPanel(
          isExpanded: touchGesturesExpanded,
          headerText: 'Touch Gestures',
          content: _buildTouchGesturesSettings(),
          onPressed: () {
            setState(() {
              touchGesturesExpanded = !touchGesturesExpanded;
            });
          },
        ),
      ],
    );
  }

  Widget _buildExpansionPanel({
    required bool isExpanded,
    required String headerText,
    required Widget content,
    required VoidCallback onPressed,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool expanded) {
          onPressed();
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  headerText,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            },
            body: content,
            isExpanded: isExpanded,
          ),
        ],
      ),
    );
  }

  Widget _buildTextSizeSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextSizeOption(1, 'Small', 14.0),
          SizedBox(height: 12),
          _buildTextSizeOption(2, 'Medium', 16.0),
          SizedBox(height: 12),
          _buildTextSizeOption(3, 'Large', 18.0),
        ],
      ),
    );
  }

  Widget _buildTextSizeOption(int option, String label, double fontSize) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedTextSize = option;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selectedTextSize == option
              ? Color.fromRGBO(32, 121, 222, 1)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: selectedTextSize == option ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorContrastSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildColorContrastOption(1, 'Light'),
          SizedBox(height: 12),
          _buildColorContrastOption(2, 'Dark'),
        ],
      ),
    );
  }

  Widget _buildColorContrastOption(int option, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContrastOption = option;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: option == 1 ? Colors.white : Colors.black,
              border: Border.all(
                color: option == 1 ? Colors.grey[400]! : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAudioAssistanceSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(
              'Enable Audio Assistance',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            activeColor: Color.fromRGBO(32, 121, 222, 1),
            value: audioAssistanceEnabled,
            onChanged: (value) {
              setState(() {
                audioAssistanceEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTouchGesturesSettings() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(
              'Enable Touch Gestures',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            activeColor: Color.fromRGBO(32, 121, 222, 1),
            value: touchGesturesEnabled,
            onChanged: (value) {
              setState(() {
                touchGesturesEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
