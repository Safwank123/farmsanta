import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../base_screen.dart';

class AddFarmLocation extends BaseScreen {
  static const routeName = "/add-farm";

  const AddFarmLocation({super.key});

  @override
  BaseScreenState<AddFarmLocation> createState() => _AddFarmLocationState();
}

class _AddFarmLocationState extends BaseScreenState<AddFarmLocation> {
  LatLng selectedLocation = LatLng(10.8505, 76.2711); // Default to Kerala

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Farm Location"),
      ),
      body: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          initialCenter: selectedLocation,
          initialZoom: 13.0,
          onTap: (tapPosition, point) {
            setState(() {
              selectedLocation = point;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.farmsanta_new',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: selectedLocation,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "Location selected: (${selectedLocation.latitude}, ${selectedLocation.longitude})"),
              ),
            );
          },
          child: const Text("Confirm Location"),
        ),
      ),
    );
  }
}
