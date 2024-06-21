// import 'package:flutter/material.dart';
// import 'profile_drawer.dart'; // Import the profile drawer widget

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key, required this.toggleTheme}) : super(key: key);

//   final VoidCallback toggleTheme;

//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   String _selectedLanguage = 'English'; // Default language

//   void _saveLanguageSelection() {
//     // Simulate saving language selection (e.g., to SharedPreferences)
//     print('Selected language: $_selectedLanguage');
//     // You can implement actual saving logic here
//     Navigator.pop(context); // Go back to the previous screen after saving
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     var bodyText1;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
//         elevation: 0,
//         actions: [
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.person),
//               onPressed: () {
//                 Scaffold.of(context).openEndDrawer(); // Open profile drawer
//               },
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           _buildBackgroundGradient(), // Add gradient background
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 // const Text(
//                 //   'Settings Screen',
//                 //   style: TextStyle(fontSize: 24, color: Colors.white),
//                 // ),
//                 ElevatedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: const Text('Select Language',
//                               style: TextStyle(color: Colors.white)),
//                           backgroundColor:
//                               Color.fromRGBO(32, 121, 222, 1), // RGB color
//                           content: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               ListTile(
//                                 title: const Text('Bengali',
//                                     style: TextStyle(color: Colors.white)),
//                                 leading: Radio<String>(
//                                   value: 'Bengali',
//                                   groupValue: _selectedLanguage,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       _selectedLanguage = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                               ListTile(
//                                 title: const Text('English',
//                                     style: TextStyle(color: Colors.white)),
//                                 leading: Radio<String>(
//                                   value: 'English',
//                                   groupValue: _selectedLanguage,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       _selectedLanguage = value!;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ],
//                           ),
//                           actions: <Widget>[
//                             ElevatedButton(
//                               onPressed: () {
//                                 _saveLanguageSelection();
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor:
//                                     Color.fromRGBO(32, 121, 222, 1),
//                                 backgroundColor:
//                                     Colors.white, // Foreground color
//                               ),
//                               child: const Text('Save'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor:
//                         Color.fromRGBO(32, 121, 222, 1), // Foreground color
//                   ),
//                   child: const Text('Set Language'),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     widget
//                         .toggleTheme(); // Toggle theme using function from MyApp
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor:
//                         Theme.of(context).textTheme.bodyLarge?.color,
//                     backgroundColor: Colors.pink[300], // Foreground color
//                     minimumSize: const Size(200, 60),
//                     padding: const EdgeInsets.all(20),
//                   ),
//                   child: Text(
//                     Theme.of(context).brightness == Brightness.dark
//                         ? 'Switch to Light Theme'
//                         : 'Switch to Dark Theme',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       endDrawer: const ProfileDrawer(), // Add profile drawer here
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: 2, // Update this to navigate between tabs if needed
//         onTap: (index) {
//           // Add logic to handle bottom navigation bar item tap
//           switch (index) {
//             case 0:
//               // Handle Home tab
//               Navigator.pushNamed(
//                   context, '/dashboard'); // Navigate to '/settings'
//               break;
//             case 1:
//               // Handle History tab
//               Navigator.pushNamed(context, '/audio_history');

//               break;
//             case 2:
//               break;
//           }
//         },
//         backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//       ),
//     );
//   }

//   Widget _buildBackgroundGradient() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromRGBO(32, 121, 222, 1), // RGB color
//             Color.fromRGBO(58, 96, 115, 1), // Darker shade for gradient
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'profile_drawer.dart'; // Import the profile drawer widget

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({Key? key, required this.toggleTheme}) : super(key: key);

//   final VoidCallback toggleTheme;

//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   String _selectedLanguage = 'English'; // Default language
//   bool _notificationsEnabled = true;
//   String _notificationTone = 'Default';
//   double _microphoneSensitivity = 0.5;
//   String _audioFormat = 'MP3';
//   double _sampleRate = 44.1;
//   bool _autoStartStopRecording = false;
//   double _recordingDurationLimit = 30.0;
//   bool _backgroundNoiseReduction = false;
//   String _preferredAccent = 'American';
//   bool _dataSharing = false;
//   String _dataStorage = 'Local';
//   bool _debugMode = false;

//   void _saveLanguageSelection() {
//     // Simulate saving language selection (e.g., to SharedPreferences)
//     print('Selected language: $_selectedLanguage');
//     // You can implement actual saving logic here
//     Navigator.pop(context); // Go back to the previous screen after saving
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         centerTitle: true,
//         backgroundColor: const Color.fromRGBO(32, 121, 222, 1), // RGB color
//         elevation: 0,
//         actions: [
//           Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(Icons.person),
//               onPressed: () {
//                 Scaffold.of(context).openEndDrawer(); // Open profile drawer
//               },
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           _buildBackgroundGradient(), // Add gradient background
//           ListView(
//             padding: EdgeInsets.all(16),
//             children: [
//               _buildSettingsOption(
//                 title: 'Language',
//                 onTap: () => _showLanguageDialog(),
//               ),
//               _buildSettingsOption(
//                 title: 'Passwords & Accounts',
//                 onTap: () {
//                   // Navigate to Passwords & Accounts screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PasswordsAccountsScreen(),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Notifications',
//                 onTap: () {
//                   // Navigate to Notifications screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => NotificationsScreen(
//                         notificationsEnabled: _notificationsEnabled,
//                         notificationTone: _notificationTone,
//                         onToggleNotifications: (enabled) {
//                           setState(() {
//                             _notificationsEnabled = enabled;
//                           });
//                         },
//                         onToneChanged: (tone) {
//                           setState(() {
//                             _notificationTone = tone;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Audio Settings',
//                 onTap: () {
//                   // Navigate to Audio Settings screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AudioSettingsScreen(
//                         microphoneSensitivity: _microphoneSensitivity,
//                         audioFormat: _audioFormat,
//                         sampleRate: _sampleRate,
//                         onSensitivityChanged: (sensitivity) {
//                           setState(() {
//                             _microphoneSensitivity = sensitivity;
//                           });
//                         },
//                         onFormatChanged: (format) {
//                           setState(() {
//                             _audioFormat = format;
//                           });
//                         },
//                         onSampleRateChanged: (rate) {
//                           setState(() {
//                             _sampleRate = rate;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Recording Settings',
//                 onTap: () {
//                   // Navigate to Recording Settings screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RecordingSettingsScreen(
//                         autoStartStopRecording: _autoStartStopRecording,
//                         recordingDurationLimit: _recordingDurationLimit,
//                         backgroundNoiseReduction: _backgroundNoiseReduction,
//                         onAutoStartStopChanged: (enabled) {
//                           setState(() {
//                             _autoStartStopRecording = enabled;
//                           });
//                         },
//                         onDurationLimitChanged: (limit) {
//                           setState(() {
//                             _recordingDurationLimit = limit;
//                           });
//                         },
//                         onNoiseReductionChanged: (enabled) {
//                           setState(() {
//                             _backgroundNoiseReduction = enabled;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Preferred Accent',
//                 onTap: () {
//                   // Show dialog to select preferred accent
//                   _showPreferredAccentDialog();
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Privacy Settings',
//                 onTap: () {
//                   // Navigate to Privacy Settings screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PrivacySettingsScreen(
//                         dataSharing: _dataSharing,
//                         dataStorage: _dataStorage,
//                         onDataSharingChanged: (sharing) {
//                           setState(() {
//                             _dataSharing = sharing;
//                           });
//                         },
//                         onDataStorageChanged: (storage) {
//                           setState(() {
//                             _dataStorage = storage;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Feedback and Support',
//                 onTap: () {
//                   // Navigate to Feedback and Support screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FeedbackSupportScreen(),
//                     ),
//                   );
//                 },
//               ),
//               _buildSettingsOption(
//                 title: 'Advanced Settings',
//                 onTap: () {
//                   // Navigate to Advanced Settings screen
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AdvancedSettingsScreen(
//                         debugMode: _debugMode,
//                         onDebugModeChanged: (enabled) {
//                           setState(() {
//                             _debugMode = enabled;
//                           });
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   widget
//                       .toggleTheme(); // Toggle theme using function from MyApp
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
//                   backgroundColor: Colors.pink[300], // Foreground color
//                   minimumSize: const Size(200, 60),
//                   padding: const EdgeInsets.all(20),
//                 ),
//                 child: Text(
//                   Theme.of(context).brightness == Brightness.dark
//                       ? 'Switch to Light Theme'
//                       : 'Switch to Dark Theme',
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//       endDrawer: const ProfileDrawer(), // Add profile drawer here
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: 2, // Update this to navigate between tabs if needed
//         onTap: (index) {
//           // Add logic to handle bottom navigation bar item tap
//           switch (index) {
//             case 0:
//               // Handle Home tab
//               Navigator.pushNamed(
//                   context, '/dashboard'); // Navigate to '/dashboard'
//               break;
//             case 1:
//               // Handle History tab
//               Navigator.pushNamed(context, '/audio_history');
//               break;
//             case 2:
//               break;
//           }
//         },
//         backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//       ),
//     );
//   }

//   Widget _buildSettingsOption(
//       {required String title, required VoidCallback onTap}) {
//     return ListTile(
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 18, color: Colors.white),
//       ),
//       trailing: Icon(Icons.arrow_forward, color: Colors.white),
//       onTap: onTap,
//     );
//   }

//   void _showLanguageDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Language',
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 title: const Text('Bengali',
//                     style: TextStyle(color: Colors.white)),
//                 leading: Radio<String>(
//                   value: 'Bengali',
//                   groupValue: _selectedLanguage,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedLanguage = value!;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text('English',
//                     style: TextStyle(color: Colors.white)),
//                 leading: Radio<String>(
//                   value: 'English',
//                   groupValue: _selectedLanguage,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedLanguage = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 _saveLanguageSelection();
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Color.fromRGBO(32, 121, 222, 1),
//                 backgroundColor: Colors.white, // Foreground color
//               ),
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showPreferredAccentDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Select Preferred Accent',
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 title: const Text('American',
//                     style: TextStyle(color: Colors.white)),
//                 leading: Radio<String>(
//                   value: 'American',
//                   groupValue: _preferredAccent,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _preferredAccent = value!;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text('British',
//                     style: TextStyle(color: Colors.white)),
//                 leading: Radio<String>(
//                   value: 'British',
//                   groupValue: _preferredAccent,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _preferredAccent = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 // Save preferred accent selection
//                 Navigator.pop(context); // Close the dialog
//               },
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Color.fromRGBO(32, 121, 222, 1),
//                 backgroundColor: Colors.white, // Foreground color
//               ),
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildBackgroundGradient() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromRGBO(32, 121, 222, 1), // RGB color
//             Color.fromRGBO(58, 96, 115, 1), // Darker shade for gradient
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Additional screens for different settings options
// class PasswordsAccountsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Passwords & Accounts'),
//       ),
//       body: Center(
//         child: Text('Passwords & Accounts Settings'),
//       ),
//     );
//   }
// }

// class NotificationsScreen extends StatelessWidget {
//   final bool notificationsEnabled;
//   final String notificationTone;
//   final ValueChanged<bool> onToggleNotifications;
//   final ValueChanged<String> onToneChanged;

//   NotificationsScreen({
//     required this.notificationsEnabled,
//     required this.notificationTone,
//     required this.onToggleNotifications,
//     required this.onToneChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SwitchListTile(
//               title: const Text('Enable Notifications'),
//               value: notificationsEnabled,
//               onChanged: onToggleNotifications,
//             ),
//             ListTile(
//               title: const Text('Notification Tone'),
//               subtitle: Text(notificationTone),
//               onTap: () {
//                 // Show dialog to select notification tone
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AudioSettingsScreen extends StatelessWidget {
//   final double microphoneSensitivity;
//   final String audioFormat;
//   final double sampleRate;
//   final ValueChanged<double> onSensitivityChanged;
//   final ValueChanged<String> onFormatChanged;
//   final ValueChanged<double> onSampleRateChanged;

//   AudioSettingsScreen({
//     required this.microphoneSensitivity,
//     required this.audioFormat,
//     required this.sampleRate,
//     required this.onSensitivityChanged,
//     required this.onFormatChanged,
//     required this.onSampleRateChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Audio Settings'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Slider(
//               label: 'Microphone Sensitivity',
//               value: microphoneSensitivity,
//               onChanged: onSensitivityChanged,
//               min: 0.0,
//               max: 1.0,
//             ),
//             ListTile(
//               title: const Text('Audio Format'),
//               subtitle: Text(audioFormat),
//               onTap: () {
//                 // Show dialog to select audio format
//               },
//             ),
//             Slider(
//               label: 'Sample Rate',
//               value: sampleRate,
//               onChanged: onSampleRateChanged,
//               min: 44.1,
//               max: 48.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RecordingSettingsScreen extends StatelessWidget {
//   final bool autoStartStopRecording;
//   final double recordingDurationLimit;
//   final bool backgroundNoiseReduction;
//   final ValueChanged<bool> onAutoStartStopChanged;
//   final ValueChanged<double> onDurationLimitChanged;
//   final ValueChanged<bool> onNoiseReductionChanged;

//   RecordingSettingsScreen({
//     required this.autoStartStopRecording,
//     required this.recordingDurationLimit,
//     required this.backgroundNoiseReduction,
//     required this.onAutoStartStopChanged,
//     required this.onDurationLimitChanged,
//     required this.onNoiseReductionChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recording Settings'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SwitchListTile(
//               title: const Text('Auto Start/Stop Recording'),
//               value: autoStartStopRecording,
//               onChanged: onAutoStartStopChanged,
//             ),
//             ListTile(
//               title: const Text('Recording Duration Limit'),
//               subtitle: Text('$recordingDurationLimit minutes'),
//               onTap: () {
//                 // Show dialog to set duration limit
//               },
//             ),
//             SwitchListTile(
//               title: const Text('Background Noise Reduction'),
//               value: backgroundNoiseReduction,
//               onChanged: onNoiseReductionChanged,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PrivacySettingsScreen extends StatelessWidget {
//   final bool dataSharing;
//   final String dataStorage;
//   final ValueChanged<bool> onDataSharingChanged;
//   final ValueChanged<String> onDataStorageChanged;

//   PrivacySettingsScreen({
//     required this.dataSharing,
//     required this.dataStorage,
//     required this.onDataSharingChanged,
//     required this.onDataStorageChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Privacy Settings'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SwitchListTile(
//               title: const Text('Data Sharing'),
//               value: dataSharing,
//               onChanged: onDataSharingChanged,
//             ),
//             ListTile(
//               title: const Text('Data Storage'),
//               subtitle: Text(dataStorage),
//               onTap: () {
//                 // Show dialog to select data storage option
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Clear all recorded data
//               },
//               child: const Text('Clear Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FeedbackSupportScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Feedback and Support'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ListTile(
//               title: const Text('Send Feedback'),
//               onTap: () {
//                 // Navigate to Send Feedback screen
//               },
//             ),
//             ListTile(
//               title: const Text('Report a Problem'),
//               onTap: () {
//                 // Navigate to Report a Problem screen
//               },
//             ),
//             ListTile(
//               title: const Text('Contact Support'),
//               onTap: () {
//                 // Navigate to Contact Support screen
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AdvancedSettingsScreen extends StatelessWidget {
//   final bool debugMode;
//   final ValueChanged<bool> onDebugModeChanged;

//   AdvancedSettingsScreen({
//     required this.debugMode,
//     required this.onDebugModeChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Advanced Settings'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             ListTile(
//               title: const Text('Model Selection'),
//               onTap: () {
//                 // Navigate to Model Selection screen
//               },
//             ),
//             ListTile(
//               title: const Text('Algorithm Parameters'),
//               onTap: () {
//                 // Navigate to Algorithm Parameters screen
//               },
//             ),
//             SwitchListTile(
//               title: const Text('Debug Mode'),
//               value: debugMode,
//               onChanged: onDebugModeChanged,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Accessibility_Screen.dart';
import 'package:flutter_application_1/Backup_Restore_Screen.dart';
import 'package:flutter_application_1/Data_Usage_Screen.dart';
import 'package:flutter_application_1/Tutorials_Screen.dart';
import 'package:flutter_application_1/advanced_settings_screen.dart';
import 'package:flutter_application_1/audio_settings_screen.dart';
import 'package:flutter_application_1/feedback_support_screen.dart';
import 'package:flutter_application_1/notifications_screen.dart';
import 'package:flutter_application_1/passwords_accounts_screen.dart';
import 'package:flutter_application_1/privacy_settings_screen.dart';
import 'package:flutter_application_1/recording_settings_screen.dart';
import 'profile_drawer.dart'; // Import the profile drawer widget
import 'preferred_accent_screen.dart'; // Import the PreferredAccentScreen

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.toggleTheme}) : super(key: key);

  final VoidCallback toggleTheme;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'English'; // Default language
  bool _notificationsEnabled = true;
  String _notificationTone = 'Default';
  double _microphoneSensitivity = 0.5;
  String _audioFormat = 'MP3';
  double _sampleRate = 44.1;
  bool _autoStartStopRecording = false;
  double _recordingDurationLimit = 30.0;
  bool _backgroundNoiseReduction = false;
  String _preferredAccent = 'American';
  bool _dataSharing = false;
  String _dataStorage = 'Local';
  bool _debugMode = false;

  void _saveLanguageSelection() {
    // Simulate saving language selection (e.g., to SharedPreferences)
    print('Selected language: $_selectedLanguage');
    // You can implement actual saving logic here
    Navigator.pop(context); // Go back to the previous screen after saving
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1), // RGB color
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open profile drawer
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _buildBackgroundGradient(), // Add gradient background
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              _buildSettingsOption(
                title: 'Language',
                onTap: () => _showLanguageDialog(),
              ),
              _buildSettingsOption(
                title: 'Passwords & Accounts',
                onTap: () {
                  // Navigate to Passwords & Accounts screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordsAccountsScreen(),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Notifications',
                onTap: () {
                  // Navigate to Notifications screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(
                        notificationsEnabled: _notificationsEnabled,
                        notificationTone: _notificationTone,
                        onToggleNotifications: (enabled) {
                          setState(() {
                            _notificationsEnabled = enabled;
                          });
                        },
                        onToneChanged: (tone) {
                          setState(() {
                            _notificationTone = tone;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Audio Settings',
                onTap: () {
                  // Navigate to Audio Settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AudioSettingsScreen(
                        microphoneSensitivity: _microphoneSensitivity,
                        audioFormat: _audioFormat,
                        sampleRate: _sampleRate,
                        onSensitivityChanged: (sensitivity) {
                          setState(() {
                            _microphoneSensitivity = sensitivity;
                          });
                        },
                        onFormatChanged: (format) {
                          setState(() {
                            _audioFormat = format;
                          });
                        },
                        onSampleRateChanged: (rate) {
                          setState(() {
                            _sampleRate = rate;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Recording Settings',
                onTap: () {
                  // Navigate to Recording Settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecordingSettingsScreen(
                        autoStartStopRecording: _autoStartStopRecording,
                        recordingDurationLimit: _recordingDurationLimit,
                        backgroundNoiseReduction: _backgroundNoiseReduction,
                        onAutoStartStopChanged: (enabled) {
                          setState(() {
                            _autoStartStopRecording = enabled;
                          });
                        },
                        onDurationLimitChanged: (limit) {
                          setState(() {
                            _recordingDurationLimit = limit;
                          });
                        },
                        onNoiseReductionChanged: (enabled) {
                          setState(() {
                            _backgroundNoiseReduction = enabled;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Preferred Accent',
                onTap: () {
                  // Navigate to Preferred Accent screen
                  _navigateToPreferredAccentScreen();
                },
              ),
              _buildSettingsOption(
                title: 'Privacy Settings',
                onTap: () {
                  // Navigate to Privacy Settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacySettingsScreen(
                        dataSharing: _dataSharing,
                        dataStorage: _dataStorage,
                        onDataSharingChanged: (sharing) {
                          setState(() {
                            _dataSharing = sharing;
                          });
                        },
                        onDataStorageChanged: (storage) {
                          setState(() {
                            _dataStorage = storage;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Feedback and Support',
                onTap: () {
                  // Navigate to Feedback and Support screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedbackSupportScreen(),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Advanced Settings',
                onTap: () {
                  // Navigate to Advanced Settings screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdvancedSettingsScreen(
                        debugMode: _debugMode,
                        onDebugModeChanged: (enabled) {
                          setState(() {
                            _debugMode = enabled;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              _buildSettingsOption(
                title: 'Backup and Restore',
                onTap: () {
                  // Navigate to Backup and Restore screen
                  _navigateToBackupRestoreScreen();
                },
              ),
              _buildSettingsOption(
                title: 'Data Usage Monitoring',
                onTap: () {
                  // Navigate to Data Usage Monitoring screen
                  _navigateToDataUsageScreen();
                },
              ),
              _buildSettingsOption(
                title: 'Accessibility Settings',
                onTap: () {
                  // Navigate to Accessibility Settings screen
                  _navigateToAccessibilityScreen();
                },
              ),
              _buildSettingsOption(
                title: 'Interactive Tutorials',
                onTap: () {
                  // Navigate to Interactive Tutorials screen
                  _navigateToTutorialsScreen();
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget
                      .toggleTheme(); // Toggle theme using function from MyApp
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
                  backgroundColor: Colors.pink[300], // Foreground color
                  minimumSize: const Size(200, 60),
                  padding: const EdgeInsets.all(20),
                ),
                child: Text(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'Switch to Light Theme'
                      : 'Switch to Dark Theme',
                ),
              ),
            ],
          ),
        ],
      ),
      endDrawer: const ProfileDrawer(), // Add profile drawer here
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 2, // Update this to navigate between tabs if needed
        onTap: (index) {
          // Add logic to handle bottom navigation bar item tap
          switch (index) {
            case 0:
              // Handle Home tab
              Navigator.pushNamed(context, '/dashboard');
              break;
            case 1:
              // Handle History tab
              Navigator.pushNamed(context, '/audio_history');
              break;
            case 2:
              break;
          }
        },
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }

  Widget _buildSettingsOption(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward, color: Colors.white),
      onTap: onTap,
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Bengali',
                    style: TextStyle(color: Colors.white)),
                leading: Radio<String>(
                  value: 'Bengali',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('English',
                    style: TextStyle(color: Colors.white)),
                leading: Radio<String>(
                  value: 'English',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _saveLanguageSelection();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromRGBO(32, 121, 222, 1),
                backgroundColor: Colors.white, // Foreground color
              ),
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToPreferredAccentScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreferredAccentScreen(
          initialAccent: _preferredAccent,
          preferredAccent: '',
        ),
      ),
    );

    if (result != null) {
      _updatePreferredAccent(result);
    }
  }

  void _updatePreferredAccent(String newAccent) {
    setState(() {
      _preferredAccent = newAccent;
    });
  }

  Widget _buildBackgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(32, 121, 222, 1), // RGB color
            Color.fromRGBO(58, 96, 115, 1), // Darker shade for gradient
          ],
        ),
      ),
    );
  }

  // Navigation methods for additional features

  void _navigateToBackupRestoreScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BackupRestoreScreen()),
    );
  }

  void _navigateToDataUsageScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DataUsageScreen()),
    );
  }

  void _navigateToAccessibilityScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccessibilityScreen()),
    );
  }

  void _navigateToTutorialsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TutorialsScreen()),
    );
  }
}
