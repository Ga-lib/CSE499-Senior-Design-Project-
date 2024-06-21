// import 'package:flutter/material.dart';

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

// import 'package:flutter/material.dart';

// class FeedbackSupportScreen extends StatelessWidget {
//   void _showFeedbackDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String feedbackText = '';

//         return AlertDialog(
//           title: Text('Send Feedback'),
//           content: TextField(
//             onChanged: (value) {
//               feedbackText = value;
//             },
//             decoration: InputDecoration(hintText: 'Enter your feedback'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Send'),
//               onPressed: () {
//                 // Implement your logic to send feedback (e.g., API call)
//                 print('Feedback sent: $feedbackText');
//                 Navigator.pop(context);
//               },
//             ),
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showProblemReportDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String problemText = '';

//         return AlertDialog(
//           title: Text('Report a Problem'),
//           content: TextField(
//             onChanged: (value) {
//               problemText = value;
//             },
//             decoration: InputDecoration(hintText: 'Enter the problem'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Report'),
//               onPressed: () {
//                 // Implement your logic to report the problem (e.g., API call)
//                 print('Problem reported: $problemText');
//                 Navigator.pop(context);
//               },
//             ),
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _contactSupport(BuildContext context) async {
//     const supportNumber = '1234567890';
//     final url = 'tel:$supportNumber';

//     try {
//       if (await canLaunch(url)) {
//         await launch(url);
//       } else {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       print('Error launching phone call: $e');
//       // Handle error as needed
//     }
//   }

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
//                 _showFeedbackDialog(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Report a Problem'),
//               onTap: () {
//                 _showProblemReportDialog(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Contact Support'),
//               onTap: () {
//                 _contactSupport(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   canLaunch(String url) {}

//   launch(String url) {}
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackSupportScreen extends StatelessWidget {
  void _showFeedbackDialog(BuildContext context) {
    String feedbackText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send Feedback',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  onChanged: (value) {
                    feedbackText = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your logic to send feedback (e.g., API call)
                        print('Feedback sent: $feedbackText');
                        Navigator.pop(context);
                      },
                      child: Text('Send'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showProblemReportDialog(BuildContext context) {
    String problemText = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report a Problem',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  onChanged: (value) {
                    problemText = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter the problem',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Implement your logic to report the problem (e.g., API call)
                        print('Problem reported: $problemText');
                        Navigator.pop(context);
                      },
                      child: Text('Report'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _contactSupport(BuildContext context) async {
    const supportNumber = '1234567890';
    final url = 'tel:$supportNumber';

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching phone call: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback and Support'),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _showFeedbackDialog(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
              ),
              child: Text('Send Feedback'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _showProblemReportDialog(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
              ),
              child: Text('Report a Problem'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _contactSupport(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
              ),
              child: Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}
