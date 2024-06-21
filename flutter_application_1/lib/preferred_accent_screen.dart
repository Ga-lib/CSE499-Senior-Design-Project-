import 'package:flutter/material.dart';

class PreferredAccentScreen extends StatefulWidget {
  final ValueNotifier<String> preferredAccentNotifier;

  PreferredAccentScreen({
    required String preferredAccent,
    required String initialAccent,
  }) : preferredAccentNotifier = ValueNotifier<String>(preferredAccent);

  @override
  _PreferredAccentScreenState createState() => _PreferredAccentScreenState();
}

class _PreferredAccentScreenState extends State<PreferredAccentScreen> {
  late String _preferredAccent;

  @override
  void initState() {
    super.initState();
    _preferredAccent = widget.preferredAccentNotifier.value;
  }

  void _selectAccent(String? accent) {
    if (accent != null) {
      setState(() {
        _preferredAccent = accent;
        widget.preferredAccentNotifier.value = accent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferred Accent'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAccentOption('American English'),
            _buildAccentOption('British English'),
            _buildAccentOption('Australian English'),
            _buildAccentOption('Indian English'),
          ],
        ),
      ),
    );
  }

  Widget _buildAccentOption(String accent) {
    return GestureDetector(
      onTap: () {
        _selectAccent(accent);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accent,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _preferredAccent == accent
                      ? Color.fromRGBO(32, 121, 222, 1) // Selected accent color
                      : Colors.black,
                ),
              ),
              if (_preferredAccent == accent)
                Icon(
                  Icons.check_circle,
                  color:
                      Color.fromRGBO(32, 121, 222, 1), // Selected accent color
                ),
            ],
          ),
        ),
      ),
    );
  }
}
