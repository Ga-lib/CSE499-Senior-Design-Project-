import 'package:flutter/material.dart';

class AdvancedFeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Features'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Match the app bar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover Advanced Features',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color:
                    Color.fromRGBO(32, 121, 222, 1), // Match the primary color
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Explore the powerful features that enhance your experience with Our App. '
              'Below are some advanced functionalities you can use to get the most out of the app:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            _buildSectionTitle('1. Customization Options'),
            _buildSectionContent(
              'Personalize your app experience by customizing themes, layouts, and '
              'notification preferences. Access these options through the settings menu '
              'to tailor the app to your preferences.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('2. Integration with Other Services'),
            _buildSectionContent(
              'Our App seamlessly integrates with popular services like social media platforms, '
              'cloud storage, and productivity tools. Sync your accounts to streamline '
              'your workflow and stay connected across platforms.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('3. Advanced Analytics and Insights'),
            _buildSectionContent(
              'Gain deeper insights into your usage patterns and activities within the app. '
              'Track metrics, view reports, and utilize analytics tools to optimize your '
              'productivity and achieve your goals.',
            ),
            SizedBox(height: 16),
            _buildSectionTitle('4. Collaboration and Sharing'),
            _buildSectionContent(
              'Collaborate with others by sharing content, files, or projects directly from '
              'the app. Use collaborative tools to work together efficiently and achieve '
              'shared objectives with ease.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 121, 222, 1), // Match the primary color
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[800],
      ),
    );
  }
}
