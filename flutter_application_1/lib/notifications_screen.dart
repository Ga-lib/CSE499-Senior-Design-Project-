import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  final bool notificationsEnabled;
  final String notificationTone;
  final ValueChanged<bool> onToggleNotifications;
  final ValueChanged<String> onToneChanged;

  NotificationsScreen({
    required this.notificationsEnabled,
    required this.notificationTone,
    required this.onToggleNotifications,
    required this.onToneChanged,
  });

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late bool _notificationsEnabled;
  late String _notificationTone;

  @override
  void initState() {
    super.initState();
    _notificationsEnabled = widget.notificationsEnabled;
    _notificationTone = widget.notificationTone;
  }

  void _selectNotificationTone() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Notification Tone'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildToneSelectionTile('Default'),
              _buildToneSelectionTile('Tone 1'),
              _buildToneSelectionTile('Tone 2'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToneSelectionTile(String toneName) {
    return ListTile(
      title: Text(toneName),
      leading: Radio<String>(
        value: toneName,
        groupValue: _notificationTone,
        onChanged: (String? value) {
          if (value != null) {
            setState(() {
              _notificationTone = value;
              widget.onToneChanged(value);
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color.fromRGBO(32, 121, 222, 1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                _buildNotificationsSwitch(),
                SizedBox(height: 24),
                _buildNotificationToneTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsSwitch() {
    return ListTile(
      title: Text('Enable Notifications'),
      subtitle: Text(_notificationsEnabled ? 'Enabled' : 'Disabled'),
      trailing: Switch(
        value: _notificationsEnabled,
        onChanged: (bool value) {
          setState(() {
            _notificationsEnabled = value;
            widget.onToggleNotifications(value);
          });
        },
      ),
    );
  }

  Widget _buildNotificationToneTile() {
    return ListTile(
      title: Text('Notification Tone'),
      subtitle: Text(_notificationTone),
      onTap: _selectNotificationTone,
    );
  }
}
