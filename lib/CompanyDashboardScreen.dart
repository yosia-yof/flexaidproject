import 'package:flutter/material.dart';

class CompanyDashboardScreen extends StatefulWidget {
  @override
  _CompanyDashboardScreenState createState() => _CompanyDashboardScreenState();
}

class _CompanyDashboardScreenState extends State<CompanyDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Mock request list
  List<Map<String, dynamic>> requests = [
    {
      'name': 'John Doe',
      'service': 'Flat Tire',
      'location': '123 Main St',
      'status': 'Pending',
    },
    {
      'name': 'Jane Smith',
      'service': 'Fuel',
      'location': '456 Oak Ave',
      'status': 'Pending',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void assignMechanic(int index) {
    setState(() {
      requests[index]['status'] = 'Assigned';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Mechanic assigned to ${requests[index]['name']}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Dashboard'),
        backgroundColor: Colors.blueAccent,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Active Requests'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Active Requests Tab
          ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final request = requests[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request['name'],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 6),
                      Text("Service: ${request['service']}"),
                      Text("Location: ${request['location']}"),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(request['status']),
                            backgroundColor: request['status'] == 'Assigned'
                                ? Colors.green[200]
                                : Colors.orange[200],
                          ),
                          ElevatedButton(
                            onPressed: request['status'] == 'Pending'
                                ? () => assignMechanic(index)
                                : null,
                            child: Text('Assign Mechanic'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // History Tab (for now just placeholder)
          Center(
            child: Text(
              'History will be shown here.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
