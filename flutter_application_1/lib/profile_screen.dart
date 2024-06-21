import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Placeholder variables for user data
  String _name = 'Wakib Jahan Galib';
  DateTime _birthday =
      DateTime(1990, 1, 1); // Replace with actual birthday format
  String _mobileNumber = '+880'; // Default to Bangladeshi format
  String _location = 'City, Country'; // Replace with actual location
  String _email = 'example@email.com'; // Replace with actual email

  bool _isEditing = false; // Track if editing mode is active

  // Controllers for editing text fields
  late TextEditingController _nameController;
  late TextEditingController _mobileNumberController;
  late TextEditingController _locationController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current values
    _nameController = TextEditingController(text: _name);
    _mobileNumberController = TextEditingController(text: _mobileNumber);
    _locationController = TextEditingController(text: _location);
    _emailController = TextEditingController(text: _email);
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _nameController.dispose();
    _mobileNumberController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: _isEditing ? _buildEditingActions() : _buildViewActions(),
      ),
      body: Stack(
        children: [
          _buildBackgroundGradient(),
          ListView(
            padding: EdgeInsets.all(16),
            children: [
              _buildProfilePicture(),
              _buildProfileItem('Name', _nameController),
              _buildBirthdayPicker(),
              _buildProfileItem('Mobile Number', _mobileNumberController),
              _buildProfileItem('Location', _locationController),
              _buildProfileItem('Email', _emailController),
              SizedBox(height: 20),
              _isEditing
                  ? _buildSaveButton()
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = true;
                        });
                      },
                      child: Text('Edit'),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildViewActions() {
    return [
      IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          setState(() {
            _isEditing = true;
          });
        },
      ),
    ];
  }

  List<Widget> _buildEditingActions() {
    return [
      IconButton(
        icon: Icon(Icons.save),
        onPressed: () {
          // Save changes here (you can implement this part)
          // For demonstration, we just toggle back to view mode
          setState(() {
            _isEditing = false;
            // Update actual user data with edited values
            _name = _nameController.text;
            _mobileNumber = _mobileNumberController.text;
            _location = _locationController.text;
            _email = _emailController.text;
          });
        },
      ),
    ];
  }

  Widget _buildProfileItem(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextFormField(
          controller: controller,
          enabled: _isEditing,
          keyboardType: label == 'Mobile Number'
              ? TextInputType.phone
              : TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter $label',
            fillColor: Colors.white,
            filled: true,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            } else if (label == 'Email' && !isValidEmail(value)) {
              return 'Please enter a valid email';
            } else if (label == 'Mobile Number' &&
                !_isBangladeshiNumber(value)) {
              return 'Please enter a Bangladeshi number starting with +880';
            }
            return null;
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBirthdayPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birthday',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () {
            if (_isEditing) {
              _pickDate(context);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: _birthday.toString().split(' ')[0],
              enabled: false,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _birthday.toString().split(' ')[0],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Icon(Icons.calendar_today, color: Colors.white),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthday,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
      });
    }
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isEditing = false;
          // Update actual user data with edited values
          _name = _nameController.text;
          _mobileNumber = _mobileNumberController.text;
          _location = _locationController.text;
          _email = _emailController.text;
        });
      },
      child: Text('Save'),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey[200],
            backgroundImage: AssetImage(
                'assets/profile_image.png'), // Replace with actual profile image
          ),
          if (_isEditing)
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  // Implement logic to change profile picture
                  // This can open a dialog or navigate to a new screen
                },
              ),
            ),
        ],
      ),
    );
  }

  bool _isBangladeshiNumber(String value) {
    return value.startsWith('+880');
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
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
}
