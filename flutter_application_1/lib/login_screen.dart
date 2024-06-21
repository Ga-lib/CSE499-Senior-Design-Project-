// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _buildBackgroundGradient(),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildLogo(),
//                 const SizedBox(height: 40),
//                 _buildSignInButton(context),
//               ],
//             ),
//           ),
//         ],
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

//   Widget _buildLogo() {
//     return Container(
//       width: 120,
//       height: 120,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(60),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Icon(
//           Icons.lock,
//           size: 60,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }

//   Widget _buildSignInButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         Navigator.pushNamed(context, '/sign_in');
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
//         elevation: 5,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Sign in',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTitle(), // Add the title here
                const SizedBox(height: 20), // Add some spacing
                _buildLogo(),
                const SizedBox(height: 40),
                _buildSignInButton(context),
              ],
            ),
          ),
        ],
      ),
    );
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

  Widget _buildTitle() {
    return Text(
      'Bengali Accent Detector',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.lock,
          size: 60,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/sign_in');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        elevation: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
