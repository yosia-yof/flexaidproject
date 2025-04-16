import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MechanicTrackingScreen extends StatefulWidget {
  @override
  _MechanicTrackingScreenState createState() => _MechanicTrackingScreenState();
}

class _MechanicTrackingScreenState extends State<MechanicTrackingScreen> {
  late GoogleMapController _controller;
  late LatLng _mechanicLocation;
  late LatLng _userLocation;
  int _etaInMinutes = 10; // Example ETA (10 minutes)
  String _status = "Mechanic on the way";

  @override
  void initState() {
    super.initState();
    // Hardcoding mechanic's location (just an example)
    _mechanicLocation = LatLng(37.42796133580664, -122.085749655962);
    // Hardcoding user's location (just an example)
    _userLocation = LatLng(37.43296265331129, -122.08832357078792);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mechanic Tracking"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Map View
          Expanded(
            flex: 8,
            child: Container(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _userLocation,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('user'),
                    position: _userLocation,
                    infoWindow: InfoWindow(title: 'Your Location'),
                  ),
                  Marker(
                    markerId: MarkerId('mechanic'),
                    position: _mechanicLocation,
                    infoWindow: InfoWindow(title: 'Mechanic Location'),
                  ),
                },
                onMapCreated: _onMapCreated,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ETA: $_etaInMinutes minutes',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Status: $_status',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),

          // ETA Timer and Status

        ],
      ),
    );
  }
}
