// import 'package:flutter/material.dart';

// class PasswordsAccountsScreen extends StatefulWidget {
//   @override
//   _PasswordsAccountsScreenState createState() =>
//       _PasswordsAccountsScreenState();
// }

// class _PasswordsAccountsScreenState extends State<PasswordsAccountsScreen> {
//   final _currentPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _confirmNewPasswordController = TextEditingController();
//   final _newAccountController = TextEditingController();
//   bool _passwordsMatch = true;

//   @override
//   void dispose() {
//     _currentPasswordController.dispose();
//     _newPasswordController.dispose();
//     _confirmNewPasswordController.dispose();
//     _newAccountController.dispose();
//     super.dispose();
//   }

//   void _changePassword() {
//     if (_newPasswordController.text == _confirmNewPasswordController.text) {
//       // Implement the password change logic here
//       print('Password changed successfully!');
//       _showSuccessSnackBar('Password changed successfully!');
//       // Clear the text fields after successful password change
//       _clearTextFields();
//     } else {
//       // Handle password mismatch error
//       print('New passwords do not match!');
//       _showErrorSnackBar('Passwords do not match!');
//       setState(() {
//         _passwordsMatch = false;
//       });
//     }
//   }

//   void _addNewAccount() {
//     // Implement the logic to add a new account here
//     print('New account added: ${_newAccountController.text}');
//     _showSuccessSnackBar('New account added: ${_newAccountController.text}');
//     // Clear the text field after adding a new account
//     _newAccountController.clear();
//   }

//   void _clearTextFields() {
//     _currentPasswordController.clear();
//     _newPasswordController.clear();
//     _confirmNewPasswordController.clear();
//     setState(() {
//       _passwordsMatch = true;
//     });
//   }

//   void _showSuccessSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   void _showErrorSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Passwords & Accounts'),
//         backgroundColor: Color.fromRGBO(32, 121, 222, 1),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _currentPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'Current Password',
//                 border: OutlineInputBorder(),
//                 errorText: !_passwordsMatch ? 'Passwords do not match' : null,
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _newPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'New Password',
//                 border: OutlineInputBorder(),
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _confirmNewPasswordController,
//               decoration: InputDecoration(
//                 labelText: 'Confirm New Password',
//                 border: OutlineInputBorder(),
//                 errorText: !_passwordsMatch ? 'Passwords do not match' : null,
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _changePassword,
//               child: Text('Change Password'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromRGBO(32, 121, 222, 1),
//               ),
//             ),
//             Divider(height: 32, thickness: 2),
//             TextField(
//               controller: _newAccountController,
//               decoration: InputDecoration(
//                 labelText: 'Add New Account',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _addNewAccount,
//               child: Text('Add Account'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromRGBO(32, 121, 222, 1),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PasswordsAccountsScreen extends StatefulWidget {
  @override
  _PasswordsAccountsScreenState createState() =>
      _PasswordsAccountsScreenState();
}

class _PasswordsAccountsScreenState extends State<PasswordsAccountsScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final _newAccountController = TextEditingController();
  bool _passwordsMatch = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    _newAccountController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_newPasswordController.text == _confirmNewPasswordController.text) {
      // Implement the password change logic here
      print('Password changed successfully!');
      _showSuccessSnackBar('Password changed successfully!');
      // Clear the text fields after successful password change
      _clearTextFields();
    } else {
      // Handle password mismatch error
      print('New passwords do not match!');
      _showErrorSnackBar('Passwords do not match!');
      setState(() {
        _passwordsMatch = false;
      });
    }
  }

  void _addNewAccount() {
    String email = _newAccountController.text.trim();
    if (email.isNotEmpty) {
      _showPasswordDialog(email);
    } else {
      _showErrorSnackBar('Please enter an email');
    }
  }

  void _showPasswordDialog(String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password for $email'),
          content: TextField(
            controller: _currentPasswordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Implement logic to save the account with password
                String enteredPassword = _currentPasswordController.text;
                print('New account added: $email');
                print('Password for account: $enteredPassword');
                _showSuccessSnackBar('New account added: $email');
                _clearTextFields();
                Navigator.of(context).pop(); // Close dialog
              },
            ),
          ],
        );
      },
    );
  }

  void _clearTextFields() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmNewPasswordController.clear();
    _newAccountController.clear();
    setState(() {
      _passwordsMatch = true;
    });
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passwords & Accounts'),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _currentPasswordController,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
                errorText: !_passwordsMatch ? 'Passwords do not match' : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmNewPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm New Password',
                border: OutlineInputBorder(),
                errorText: !_passwordsMatch ? 'Passwords do not match' : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Change Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
              ),
            ),
            Divider(height: 32, thickness: 2),
            TextField(
              controller: _newAccountController,
              decoration: InputDecoration(
                labelText: 'Add New Account (Email)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addNewAccount,
              child: Text('Add Account'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(32, 121, 222, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
