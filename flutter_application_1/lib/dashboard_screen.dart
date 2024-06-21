import 'dart:async';
import 'package:flutter/material.dart';
import 'profile_drawer.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const DashboardScreen({required this.toggleTheme, Key? key})
      : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _recordDuration = '';
  String _detectedAccent = '';
  bool _showAccentBox = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _colorAnimation =
        ColorTween(begin: Colors.blueAccent, end: Colors.redAccent)
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      if (!_isRecording) {
        _startRecording();
      } else {
        _stopRecording();
      }
      _isRecording = !_isRecording;
      _isRecording ? _controller.forward() : _controller.reverse();
      if (_isRecording) {
        _showAccentBox = false; // Hide the accent box when recording starts
      }
    });
  }

  void _startRecording() {
    _stopwatch.reset();
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _recordDuration = _formatDuration(_stopwatch.elapsed);
      });
    });
  }

  String _formatDuration(Duration duration) {
    return '${duration.inMinutes.toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}:'
        '${(duration.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0')}';
  }

  void _stopRecording() {
    _stopwatch.stop();
    _timer.cancel();
    _detectAccent();
  }

  void _detectAccent() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _detectedAccent = '"Noakhailla"';
        _showAccentBox = true;
      });
    });
  }

  void _dismissAccentBox() {
    setState(() {
      _showAccentBox = false;
      _detectedAccent = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bengali Accent Detector'),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
        automaticallyImplyLeading: false,
      ),
      endDrawer: const ProfileDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 121, 222, 1),
              Color.fromRGBO(58, 96, 115, 1),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _toggleRecording,
                    child: AnimatedBuilder(
                      animation: _colorAnimation,
                      builder: (context, child) => Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple,
                              _colorAnimation.value!,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: _colorAnimation.value!.withOpacity(0.6),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_showAccentBox)
                    _buildAccentBox(), // Show the accent box only if not recording and the result is available
                  const SizedBox(height: 16),
                  Text(
                    _isRecording
                        ? 'Recording: $_recordDuration'
                        : _detectedAccent.isNotEmpty
                            ? 'Detected Accent: $_detectedAccent'
                            : 'Tap the mic to start recording',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (_isRecording)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: WaveWidget(
                  config: CustomConfig(
                    gradients: [
                      [Colors.blue.shade800, Colors.blue.shade500],
                      [Colors.blue.shade400, Colors.blue.shade200],
                    ],
                    durations: [35000, 19440],
                    heightPercentages: [0.20, 0.25],
                    blur: MaskFilter.blur(BlurStyle.solid, 10),
                    gradientBegin: Alignment.bottomLeft,
                    gradientEnd: Alignment.topRight,
                  ),
                  waveAmplitude: 0,
                  backgroundColor: Colors.transparent,
                  size: const Size(double.infinity, 200),
                ),
              ),
          ],
        ),
      ),
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
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, '/audio_history');
              break;
            case 2:
              Navigator.pushNamed(context, '/settings');
              break;
          }
        },
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }

  Widget _buildAccentBox() {
    return GestureDetector(
      onTap: _dismissAccentBox,
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Detected Accent:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              _detectedAccent,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
