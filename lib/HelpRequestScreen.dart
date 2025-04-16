import 'package:flutter/material.dart';

class HelpRequestScreen extends StatefulWidget {
  @override
  _HelpRequestScreenState createState() => _HelpRequestScreenState();
}

class _HelpRequestScreenState extends State<HelpRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedService;
  String description = '';

  List<String> services = [
    'Flat Tire',
    'Fuel',
    'Battery Jump',
    'Towing',
    'Locked Out',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Help'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title
              Text(
                'What kind of help do you need?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Service Type Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Service Type',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: services
                    .map((service) => DropdownMenuItem(
                  value: service,
                  child: Text(service),
                ))
                    .toList(),
                value: selectedService,
                onChanged: (value) => setState(() => selectedService = value),
                validator: (value) =>
                value == null ? 'Please select a service' : null,
              ),
              SizedBox(height: 20),

              // Location Display
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your current location will be used.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Add manual location option later
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Description Field
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Additional Notes (optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => description = value,
              ),
              SizedBox(height: 30),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send request to backend later
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Request sent successfully!')),
                    );
                    Navigator.pop(context); // Go back to home screen
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Request Assistance',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
