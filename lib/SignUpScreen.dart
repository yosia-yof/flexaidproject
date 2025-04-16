import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _userFormKey = GlobalKey<FormState>();
  final _companyFormKey = GlobalKey<FormState>();

  // You can store form data here later for backend
  final _userData = {
    'name': '',
    'email': '',
    'password': '',
    'phone': '',
  };

  final _companyData = {
    'companyName': '',
    'email': '',
    'password': '',
    'phone': '',
    'address': '',
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
          title: Text('Create Account'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'User'),
              Tab(text: 'Company'),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            _buildUserForm(),
            _buildCompanyForm(),
          ],
        ),
      ),
    );
  }

  // ------------------ USER FORM ------------------ //
  Widget _buildUserForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _userFormKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: _inputDecoration('Full Name', Icons.person),
              validator: (value) =>
              value!.isEmpty ? 'Please enter your full name' : null,
              onSaved: (value) => _userData['name'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: _inputDecoration('Email', Icons.email),
              validator: (value) => _validateEmail(value),
              onSaved: (value) => _userData['email'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: _inputDecoration('Password', Icons.lock),
              validator: (value) =>
              value!.length < 6 ? 'Password must be at least 6 characters' : null,
              onSaved: (value) => _userData['password'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: _inputDecoration('Phone Number', Icons.phone),
              validator: (value) =>
              value!.isEmpty ? 'Enter phone number' : null,
              onSaved: (value) => _userData['phone'] = value!,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_userFormKey.currentState!.validate()) {
                  _userFormKey.currentState!.save();
                  // Proceed with backend logic here
                  print('User data: $_userData');
                }
              },
              style: _buttonStyle(),
              child: Text('Sign Up as User'),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ COMPANY FORM ------------------ //
  Widget _buildCompanyForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _companyFormKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: _inputDecoration('Company Name', Icons.business),
              validator: (value) =>
              value!.isEmpty ? 'Please enter company name' : null,
              onSaved: (value) => _companyData['companyName'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: _inputDecoration('Company Email', Icons.email),
              validator: (value) => _validateEmail(value),
              onSaved: (value) => _companyData['email'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: _inputDecoration('Password', Icons.lock),
              validator: (value) =>
              value!.length < 6 ? 'Password must be at least 6 characters' : null,
              onSaved: (value) => _companyData['password'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: _inputDecoration('Phone Number', Icons.phone),
              validator: (value) =>
              value!.isEmpty ? 'Enter phone number' : null,
              onSaved: (value) => _companyData['phone'] = value!,
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: _inputDecoration('Address', Icons.location_on),
              validator: (value) =>
              value!.isEmpty ? 'Enter address' : null,
              onSaved: (value) => _companyData['address'] = value!,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (_companyFormKey.currentState!.validate()) {
                  _companyFormKey.currentState!.save();
                  // Proceed with backend logic here
                  print('Company data: $_companyData');
                }
              },
              style: _buttonStyle(),
              child: Text('Sign Up as Company'),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ STYLES & VALIDATION HELPERS ------------------ //
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 15),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter email';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) return 'Enter valid email';
    return null;
  }
}
