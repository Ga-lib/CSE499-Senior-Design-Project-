import 'package:flutter/material.dart';

class AudioHistoryScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const AudioHistoryScreen({required this.toggleTheme, Key? key})
      : super(key: key);

  @override
  _AudioHistoryScreenState createState() => _AudioHistoryScreenState();
}

class _AudioHistoryScreenState extends State<AudioHistoryScreen> {
  List<String> audioHistory = List.generate(10, (index) => 'Audio $index');
  List<bool> _selected = List.generate(10, (index) => false);
  bool _isSelectionMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bengali Accent Detector'),
        centerTitle: true,
        actions: [
          if (_isSelectionMode)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _deleteSelected,
            ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'select_all') {
                _selectAll();
              } else if (value == 'delete_all') {
                _clearAudioHistory();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'select_all',
                  child: Text('Select All'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete_all',
                  child: Text('Delete All'),
                ),
              ];
            },
          ),
        ],
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
      ),
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
        child: ListView.builder(
          itemCount: audioHistory.length,
          itemBuilder: (context, index) {
            return _buildListItem(context, index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewAudio,
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
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
        currentIndex: 1, // Update this to navigate between tabs if needed
        onTap: (index) {
          // Add logic to handle bottom navigation bar item tap
          switch (index) {
            case 0:
              // Handle Home tab
              Navigator.pushNamed(
                  context, '/dashboard'); // Navigate to '/settings'
              break;
            case 1:
              // Handle History tab

              break;
            case 2:
              Navigator.pushNamed(
                  context, '/settings'); // Navigate to '/settings'
              break;
          }
        },
        backgroundColor: const Color.fromRGBO(32, 121, 222, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _isSelectionMode = true;
          _selected[index] = true;
        });
      },
      child: Card(
        color: _selected[index] ? Colors.lightBlue : Colors.lightBlue[100],
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: _isSelectionMode
              ? Checkbox(
                  value: _selected[index],
                  onChanged: (value) {
                    setState(() {
                      _selected[index] = value!;
                    });
                  },
                )
              : CircleAvatar(
                  backgroundColor: Colors.lightBlue[200],
                  child: const Icon(Icons.audiotrack, color: Colors.black),
                ),
          title: Text(
            audioHistory[index],
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            'Recording Date: ${_formatDate(index)}',
            style: const TextStyle(color: Colors.black54),
          ),
          trailing: !_isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteAudio(index);
                  },
                  color: Colors.black,
                )
              : null,
        ),
      ),
    );
  }

  void _addNewAudio() {
    setState(() {
      audioHistory.add('Audio ${audioHistory.length}');
      _selected.add(false);
    });
  }

  void _deleteAudio(int index) {
    setState(() {
      audioHistory.removeAt(index);
      _selected.removeAt(index);
      if (!_selected.contains(true)) {
        _isSelectionMode = false;
      }
    });
  }

  void _deleteSelected() {
    setState(() {
      for (int i = _selected.length - 1; i >= 0; i--) {
        if (_selected[i]) {
          audioHistory.removeAt(i);
          _selected.removeAt(i);
        }
      }
      _isSelectionMode = false;
    });
  }

  void _clearAudioHistory() {
    setState(() {
      audioHistory.clear();
      _selected = List.generate(audioHistory.length, (index) => false);
      _isSelectionMode = false;
    });
  }

  void _selectAll() {
    setState(() {
      bool newValue = !_selected.every((selected) => selected);
      _selected = List.generate(audioHistory.length, (index) => newValue);
    });
  }

  String _formatDate(int index) {
    return DateTime.now().subtract(Duration(days: index)).toString();
  }
}
