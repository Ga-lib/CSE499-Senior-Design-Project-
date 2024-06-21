import 'package:flutter/material.dart';
import 'getting_started_screen.dart'; // Import the GettingStartedScreen
import 'advanced_features_screen.dart'; // Import the AdvancedFeaturesScreen
import 'troubleshooting_screen.dart'; // Import the TroubleshootingScreen

class TutorialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Tutorials'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Updated app bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTutorialCard(
              title: 'Getting Started',
              description:
                  'Learn the basics of using our app and its key features.',
              onPressed: () {
                // Navigate to Getting Started tutorial page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GettingStartedScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            _buildTutorialCard(
              title: 'Advanced Features',
              description:
                  'Discover advanced tips and tricks to master our app.',
              onPressed: () {
                // Navigate to Advanced Features tutorial page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvancedFeaturesScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            _buildTutorialCard(
              title: 'Troubleshooting',
              description:
                  'Explore solutions to common problems and how to fix them.',
              onPressed: () {
                // Navigate to Troubleshooting tutorial page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TroubleshootingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorialCard({
    required String title,
    required String description,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(32, 121, 222, 1), // Updated title color
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(32, 121, 222, 1), // Updated primary color
        scaffoldBackgroundColor: Colors.grey[50],
        fontFamily: 'Roboto',
      ),
      home: TutorialsScreen(),
    );
  }
}
