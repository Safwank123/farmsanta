// import 'package:farmsanta_new/Models/Farmer/Coordinate.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class FarmMapPreview extends StatelessWidget {
//   final List<Coordinate> coordinates;
  
//   const FarmMapPreview({
//     Key? key,
//     required this.coordinates,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (coordinates.isEmpty) {
//       return const Center(child: Text('No coordinates available'));
//     }

//     // Calculate center point
//     final centerLat = coordinates.map((c) => c.latitude).reduce((a, b) => a + b) / coordinates.length;
//     final centerLng = coordinates.map((c) => c.longitude).reduce((a, b) => a + b) / coordinates.length;
//     final center = LatLng(centerLat, centerLng);

//     // Convert coordinates to LatLng for the map
//     final polygonPoints = coordinates.map((c) => LatLng(c.latitude, c.longitude)).toList();

//     return FlutterMap(
//       options: MapOptions(
//         initialCenter: center,
//         initialZoom: 15.0,
//         interactiveFlags: InteractiveFlag.none,
//       ),
//       children: [
//         TileLayer(
//           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//           userAgentPackageName: 'com.example.farmsanta',
//         ),
//         PolygonLayer(
//           polygons: [
//             Polygon(
//               points: polygonPoints,
//               color: Colors.green.withOpacity(0.3),
//               borderColor: Colors.green,
//               borderStrokeWidth: 2,
//               isFilled: true,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }