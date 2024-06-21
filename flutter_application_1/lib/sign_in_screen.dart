import 'package:flutter/material.dart';
// ignore: unused_import
import 'profile_drawer.dart'; // Import the profile drawer widget

class SignInScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const SignInScreen({required this.toggleTheme});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonAnimationController;
  late Animation<double> _buttonScaleAnimation;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _buttonAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1), // RGB color
        elevation: 0,
        // actions: [
        //   Builder(
        //     builder: (context) => IconButton(
        //       icon: const Icon(Icons.person),
        //       onPressed: () {
        //         Scaffold.of(context).openEndDrawer(); // Open profile drawer
        //       },
        //     ),
        //   ),
        // ],
        automaticallyImplyLeading: false, // Remove the back button
      ),
      // endDrawer: const ProfileDrawer(),
      body: Stack(
        children: [
          _buildBackgroundGradient(), // Add gradient background
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Welcome back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextFieldWithIcon(
                  icon: Icons.person,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                _buildTextFieldWithIcon(
                  icon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            splashRadius: 20,
                            checkColor: Colors.white,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot_password');
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ScaleTransition(
                  scale: _buttonScaleAnimation,
                  child: ElevatedButton(
                    onPressed: () {
                      _buttonAnimationController.forward().then((_) {
                        _buttonAnimationController.reverse();
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(32, 121, 222, 1), // RGB color
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      animationDuration: const Duration(milliseconds: 300),
                    ),
                    child: AnimatedBuilder(
                      animation: _buttonAnimationController,
                      builder: (context, child) => Transform.scale(
                        scale: _buttonScaleAnimation.value,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Don't have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_account');
                  },
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Or sign in with',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(
                      image: 'assets/facebook_logo.png',
                      onPressed: () {
                        // Add Facebook login logic here
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      image: 'assets/google_logo.png',
                      onPressed: () {
                        // Add Google login logic here
                      },
                    ),
                    const SizedBox(width: 16),
                    _buildSocialButton(
                      image: 'assets/apple_logo.png',
                      onPressed: () {
                        // Add Apple login logic here
                      },
                    ),
                  ],
                ),
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

  Widget _buildTextFieldWithIcon({
    required IconData icon,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.3),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String image,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Image.asset(image, width: 20, height: 20),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
