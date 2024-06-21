// import 'package:flutter/material.dart';

// class ProfileDrawer extends StatelessWidget {
//   const ProfileDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Color.fromRGBO(32, 121, 222, 1), // RGB color
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(32, 121, 222, 1), // RGB color
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.white,
//                     // Replace with your profile image
//                     backgroundImage: AssetImage('assets/profile_image.png'),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Wakib Jahan Galib',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _buildDrawerItem(
//               icon: Icons.home,
//               title: 'Home',
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/dashboard');
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.person,
//               title: 'My Profile',
//               onTap: () {
//                 // Implement navigation to profile screen
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.settings,
//               title: 'Settings',
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/settings');
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.help,
//               title: 'Help',
//               onTap: () {
//                 // Implement navigation to help screen
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.info,
//               title: 'About Us',
//               onTap: () {
//                 // Implement navigation to about us screen
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: Colors.white,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ProfileDrawer extends StatelessWidget {
//   const ProfileDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Color.fromRGBO(32, 121, 222, 1), // RGB color
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(32, 121, 222, 1), // RGB color
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.white,
//                     // Replace with your profile image
//                     backgroundImage: AssetImage('assets/profile_image.png'),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Wakib Jahan Galib',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             _buildDrawerItem(
//               icon: Icons.home,
//               title: 'Home',
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/dashboard');
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.person,
//               title: 'My Profile',
//               onTap: () {
//                 // Implement navigation to profile screen
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.settings,
//               title: 'Settings',
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/settings');
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.help,
//               title: 'Help',
//               onTap: () {
//                 // Implement navigation to help screen
//               },
//             ),
//             _buildDrawerItem(
//               icon: Icons.info,
//               title: 'About Us',
//               onTap: () {
//                 // Implement navigation to about us screen
//               },
//             ),
//             Divider(color: Colors.white), // Add a divider for visual separation
//             _buildDrawerItem(
//               icon: Icons.logout,
//               title: 'Log Out',
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.pushReplacementNamed(
//                     context, '/sign_in'); // Navigate to sign in screen
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDrawerItem({
//     required IconData icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color: Colors.white,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/profile_screen.dart'; // Import the profile screen

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(32, 121, 222, 1), // RGB color
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(32, 121, 222, 1), // RGB color
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    // Replace with your profile image
                    backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wakib Jahan Galib',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            _buildDrawerItem(
              icon: Icons.person,
              title: 'My Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            _buildDrawerItem(
              icon: Icons.help,
              title: 'Help',
              onTap: () {
                // Implement navigation to help screen
              },
            ),
            _buildDrawerItem(
              icon: Icons.info,
              title: 'About Us',
              onTap: () {
                // Implement navigation to about us screen
              },
            ),
            Divider(color: Colors.white), // Add a divider for visual separation
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, '/sign_in'); // Navigate to sign in screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }
}
