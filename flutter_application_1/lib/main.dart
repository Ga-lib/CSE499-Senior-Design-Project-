import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'sign_in_screen.dart';
import 'dashboard_screen.dart' as Dashboard; // Import with prefix
import 'audio_history_screen.dart' as AudioHistory; // Import with prefix
import 'settings_screen.dart';
import 'forgot_password_screen.dart';
import 'create_account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.pink[300]!),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.pink[300]!),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 60)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(20)),
          ),
        ),
      ),
      themeMode: _themeMode,
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/sign_in': (context) => SignInScreen(toggleTheme: _toggleTheme),
        '/dashboard': (context) =>
            Dashboard.DashboardScreen(toggleTheme: _toggleTheme),
        '/audio_history': (context) =>
            AudioHistory.AudioHistoryScreen(toggleTheme: _toggleTheme),
        '/settings': (context) => SettingsScreen(toggleTheme: _toggleTheme),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/create_account': (context) => CreateAccountScreen(),
      },
    );
  }
}
