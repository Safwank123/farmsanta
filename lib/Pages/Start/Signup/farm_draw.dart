import 'package:farmsanta_new/Models/Farmer/Coordinate.dart';
import 'package:farmsanta_new/Models/Farmer/Crop.dart';
import 'package:farmsanta_new/Models/Farmer/Land.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class FarmDrawScreen extends BaseScreen {
  static const routeName = "/farm-draw-screen";
  const FarmDrawScreen({super.key});

  @override
  BaseScreenState<FarmDrawScreen> createState() => _FarmDrawScreenState();
}

class _FarmDrawScreenState extends BaseScreenState<FarmDrawScreen> {
  // Map Drawing State
  LatLng? get position {
    final pos = StoreHelper.store.position;
    return pos != null ? LatLng(pos.latitude, pos.longitude) : null;
  }

  bool addingMainBoundary = false;
  bool addingSubLand = false;
  List<LatLng> mainLandPoints = [];
  List<List<LatLng>> subLands = [];
  List<LatLng> currentSubLandPoints = [];
  
  // Sub-land Labeling State
  List<String> subLandNames = [];
  TextEditingController subLandNameController = TextEditingController();
  bool showNameDialog = false;
  int currentSubLandIndex = -1;

  // Visual Styling
  final List<Color> subLandColors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];

  Color getSubLandColor(int index) {
    return subLandColors[index % subLandColors.length];
  }

  @override
  void dispose() {
    subLandNameController.dispose();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    final color = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    final whiteColor = AppThemeColors.getColor(AppThemeColorsEnum.white);

    return Scaffold(
      body: position == null
          ? Center(child: CustomText(textKey: "Location not available"))
          : Stack(
              children: [
                FlutterMap(
                  options: MapOptions(
                    initialCenter: position!,
                    initialZoom: 15,
                    onTap: (tapPosition, point) {
                      if (addingMainBoundary) {
                        setState(() => mainLandPoints.add(point));
                      } else if (addingSubLand) {
                        setState(() => currentSubLandPoints.add(point));
                      }
                    },
                  ),
                  children: [
                    // Updated TileLayer with proper user agent
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.farmsanta_new',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    
                    // Attribution (required by OSM)
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                        )
                      ],
                    ),
                    
                    // Main land polygon
                    if (mainLandPoints.isNotEmpty)
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            points: mainLandPoints,
                            borderStrokeWidth: 3,
                            borderColor: color,
                            color: color.withOpacity(0.2),
                          ),
                        ],
                      ),
                    
                    // Main land boundary line
                    if (mainLandPoints.length > 1)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: [...mainLandPoints, mainLandPoints.first],
                            strokeWidth: 3.0,
                            color: color,
                          ),
                        ],
                      ),
                    
                    // Completed sub-lands with labels
                    PolygonLayer(
                      polygons: subLands.asMap().entries.map((entry) {
                        final index = entry.key;
                        final points = entry.value;
                        return Polygon(
                          points: points,
                          borderStrokeWidth: 2,
                          borderColor: getSubLandColor(index),
                          color: getSubLandColor(index).withOpacity(0.3),
                          label: subLandNames.length > index ? subLandNames[index] : 'Plot ${index + 1}',
                          labelStyle: TextStyle(
                            fontSize: _calculateFontSize(points),
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        );
                      }).toList(),
                    ),
                    
                    // Current sub-land being drawn
                    if (currentSubLandPoints.isNotEmpty)
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            points: currentSubLandPoints,
                            borderStrokeWidth: 2,
                            borderColor: subLandColors[0],
                            color: subLandColors[0].withOpacity(0.3),
                          ),
                        ],
                      ),
                    
                    // Current sub-land boundary line
                    if (currentSubLandPoints.length > 1)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: [...currentSubLandPoints, currentSubLandPoints.first],
                            strokeWidth: 2.0,
                            color: subLandColors[0],
                          ),
                        ],
                      ),
                    
                    // Markers for all points
                    MarkerLayer(
                      markers: [
                        // Main land markers
                        ...mainLandPoints.map((point) => Marker(
                          width: 40,
                          height: 40,
                          point: point,
                          child: Icon(Icons.location_on, color: color),
                        )),
                        
                        // Current sub-land markers
                        ...currentSubLandPoints.map((point) => Marker(
                          width: 40,
                          height: 40,
                          point: point,
                          child: Icon(Icons.location_on, color: subLandColors[0]),
                        )),
                        
                        // Completed sub-land markers with different colors
                        ...subLands.asMap().entries.expand((entry) {
                          final index = entry.key;
                          return entry.value.map((point) => Marker(
                            width: 40,
                            height: 40,
                            point: point,
                            child: Icon(Icons.location_on, color: getSubLandColor(index)),
                          ));
                        }),
                      ],
                    ),
                  ],
                ),

                // Sub-land name input dialog (unchanged)
                if (showNameDialog)
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Enter Crop Name for This Plot',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 15),
                          TextField(
                            controller: subLandNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'e.g., Wheat Field',
                            ),
                            maxLength: 20,
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    showNameDialog = false;
                                    currentSubLandPoints.clear();
                                    subLandNameController.clear();
                                  });
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (subLandNameController.text.trim().isNotEmpty) {
                                    setState(() {
                                      subLandNames.add(subLandNameController.text);
                                      subLands.add(List.from(currentSubLandPoints));
                                      currentSubLandPoints.clear();
                                      subLandNameController.clear();
                                      showNameDialog = false;
                                    });
                                  }
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                // Control buttons column (unchanged)
                Column(
                  children: [
                    // Main Boundary Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          textKey: addingMainBoundary ? "Finish Main Boundary" : "Pin Main Boundary",
                          color: color,
                          bold: true,
                        ),
                        5.widthBox,
                        VxCircle(
                          radius: 35,
                          backgroundColor: color,
                          child: Icon(
                            addingMainBoundary ? Icons.check : Icons.map,
                            color: whiteColor,
                          ),
                        ).onInkTap(() {
                          if (addingMainBoundary && mainLandPoints.length >= 3) {
                            setState(() => addingMainBoundary = false);
                          } else {
                            setState(() {
                              addingMainBoundary = true;
                              addingSubLand = false;
                              currentSubLandPoints.clear();
                            });
                          }
                        }),
                      ],
                    ).pOnly(top: 80, right: 30),
                    
                    // Add Sub-Land Button
                    if (mainLandPoints.length >= 3 && !addingMainBoundary)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            textKey: addingSubLand ? "Finish Sub Land" : "Add Sub Land",
                            color: subLandColors[0],
                            bold: true,
                          ),
                          5.widthBox,
                          VxCircle(
                            radius: 35,
                            backgroundColor: subLandColors[0],
                            child: Icon(
                              addingSubLand ? Icons.check : Icons.add,
                              color: whiteColor,
                            ),
                          ).onInkTap(() {
                            if (addingSubLand && currentSubLandPoints.length >= 3) {
                              setState(() {
                                currentSubLandIndex = subLands.length;
                                showNameDialog = true;
                              });
                            } else {
                              setState(() {
                                addingSubLand = true;
                                addingMainBoundary = false;
                              });
                            }
                          }),
                        ],
                      ).pOnly(top: 20, right: 30),
                    
                    // Undo Button
                    if ((addingMainBoundary && mainLandPoints.isNotEmpty) || 
                        (addingSubLand && currentSubLandPoints.isNotEmpty))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            textKey: "Undo",
                            color: addingMainBoundary ? color : subLandColors[0],
                            bold: true,
                          ),
                          10.widthBox,
                          VxCircle(
                            radius: 35,
                            backgroundColor: addingMainBoundary ? color : subLandColors[0],
                            child: Icon(Icons.undo_sharp, color: whiteColor),
                          ).onInkTap(() {
                            setState(() {
                              if (addingMainBoundary) {
                                mainLandPoints.removeLast();
                              } else if (addingSubLand) {
                                currentSubLandPoints.removeLast();
                              }
                            });
                          }),
                        ],
                      ).pOnly(top: 20, right: 30),
                    
                    // Clear Sub-Lands Button
                    if (subLands.isNotEmpty && !addingSubLand && !addingMainBoundary)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            textKey: "Clear Sub Lands",
                            color: Colors.red,
                            bold: true,
                          ),
                          10.widthBox,
                          VxCircle(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.delete, color: whiteColor),
                          ).onInkTap(() {
                            setState(() {
                              subLands.clear();
                              subLandNames.clear();
                            });
                          }),
                        ],
                      ).pOnly(top: 20, right: 30),
                  ],
                ),

                // Save Button (unchanged)
                Positioned.fill(
                  child: CustomButtonElevated(
                    text: "Save",
                    onTap: () {
                      if (mainLandPoints.length >= 3) {
                        final newFarm = LandModel(
                          landId: DateTime.now().millisecondsSinceEpoch.toString(),
                          landName: 'Farm ${DateTime.now().second}',
                          registrationNumber: 'N/A',
                          farmLocation: 'Current Location',
                          latitude: mainLandPoints.first.latitude,
                          longitude: mainLandPoints.first.longitude,
                          unitOfMeasure: 'acres',
                          waterSource: 'N/A',
                          documents: [],
                          area: null,
                          coordinates: mainLandPoints
                            .asMap()
                            .entries
                            .map((entry) => Coordinate(
                                  latitude: entry.value.latitude,
                                  longitude: entry.value.longitude,
                                  index: entry.key,
                                ))
                            .toList(),
                          subLands: subLands
                            .asMap()
                            .entries
                            .map((entry) {
                              final index = entry.key;
                              final points = entry.value;
                              return LandModel(
                                landId: 'sub-${DateTime.now().millisecondsSinceEpoch}-$index',
                                landName: subLandNames.length > index 
                                    ? subLandNames[index] 
                                    : 'Plot ${index + 1}',
                                registrationNumber: 'N/A',
                                farmLocation: 'Sub-plot',
                                latitude: points.first.latitude,
                                longitude: points.first.longitude,
                                unitOfMeasure: 'acres',
                                waterSource: 'N/A',
                                documents: [getSubLandColor(index).value.toString()],
                                area: null,
                                coordinates: points
                                    .asMap()
                                    .entries
                                    .map((entry) => Coordinate(
                                          latitude: entry.value.latitude,
                                          longitude: entry.value.longitude,
                                          index: entry.key,
                                        ))
                                    .toList(),
                                subLands: [],
                                crops: [],
                              );
                            })
                            .toList(),
                          crops: [],
                        );

                        Navigator.pop(context, newFarm);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please mark at least 3 points for the main land boundary."),
                          ),
                        );
                      }
                    },
                  ).w24(context).objectBottomCenter().pOnly(bottom: 15),
                ),
              ],
            ).hFull(context).wFull(context),
    );
  }

  // Calculate font size based on polygon area (unchanged)
  double _calculateFontSize(List<LatLng> polygon) {
    final area = _calculatePolygonArea(polygon);
    if (area < 0.0001) return 10;  // Very small area
    if (area < 0.001) return 12;   // Small area
    return 14;                      // Normal/large area
  }

  // Simple polygon area calculation (using shoelace formula) (unchanged)
  double _calculatePolygonArea(List<LatLng> polygon) {
    if (polygon.length < 3) return 0;
    
    double area = 0;
    for (int i = 0; i < polygon.length; i++) {
      final p1 = polygon[i];
      final p2 = polygon[(i + 1) % polygon.length];
      area += (p1.longitude * p2.latitude) - (p1.latitude * p2.longitude);
    }
    
    return area.abs() / 2;
  }
}