import 'package:flutter/material.dart';

class CloudIntegrationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud Integration Settings'),
        backgroundColor:
            Color.fromRGBO(32, 121, 222, 1), // Your app's primary color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCloudServiceButton(
              service: 'Google Drive',
              icon: Icons.cloud,
              onPressed: () {
                // Implement Google Drive integration
                print('Configure Google Drive integration');
                _showSnackbar(context, 'Configured Google Drive integration');
              },
            ),
            SizedBox(height: 20),
            _buildCloudServiceButton(
              service: 'Dropbox',
              icon: Icons.cloud_upload,
              onPressed: () {
                // Implement Dropbox integration
                print('Configure Dropbox integration');
                _showSnackbar(context, 'Configured Dropbox integration');
              },
            ),
            SizedBox(height: 20),
            _buildCloudServiceButton(
              service: 'OneDrive',
              icon: Icons.cloud_queue,
              onPressed: () {
                // Implement OneDrive integration
                print('Configure OneDrive integration');
                _showSnackbar(context, 'Configured OneDrive integration');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloudServiceButton(
      {required String service,
      required IconData icon,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(service),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        minimumSize: Size(200, 50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Color.fromRGBO(32, 121, 222, 1)), // Border color
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
