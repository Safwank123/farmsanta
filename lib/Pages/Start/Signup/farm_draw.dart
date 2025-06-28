import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Models/Farmer/Coordinate.dart';
import 'package:farmsanta_new/Models/Farmer/Land.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../base_screen.dart';

class FarmDrawScreen extends BaseScreen {
  static const routeName = "/farm-draw-screen";
  const FarmDrawScreen({super.key});

  @override
  BaseScreenState<FarmDrawScreen> createState() => _FarmDrawScreenState();
}

class _FarmDrawScreenState extends BaseScreenState<FarmDrawScreen> {
  LatLng? get position {
    final pos = StoreHelper.store.position;
    return pos != null ? LatLng(pos.latitude, pos.longitude) : null;
  }

  bool addingBoundary = false;
  List<LatLng> markerPoints = [];

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
                      if (addingBoundary) {
                        setState(() => markerPoints.add(point));
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    if (markerPoints.isNotEmpty)
                      PolygonLayer(
                        polygons: [
                          Polygon(
                            points: markerPoints,
                            borderStrokeWidth: 2,
                            borderColor: color,
                            color: AppThemeColors.getColor(
                              AppThemeColorsEnum.locationBackground,
                            ).withOpacity(0.3),
                          ),
                        ],
                      ),
                    if (markerPoints.length > 1)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: [...markerPoints, markerPoints.first],
                            strokeWidth: 3.0,
                            color: color,
                          ),
                        ],
                      ),
                    MarkerLayer(
                      markers: markerPoints.map((point) {
                        return Marker(
                          width: 40,
                          height: 40,
                          point: point,
                          child: Icon(Icons.location_on, color: color),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                // Pin Boundary Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      textKey: AppStrings.pinBoundary,
                      color: color,
                      bold: true,
                    ),
                    5.widthBox,
                    VxCircle(
                      radius: 35,
                      backgroundColor: color,
                      child: Icon(
                        addingBoundary ? Icons.close : Icons.map,
                        color: whiteColor,
                      ),
                    ).onInkTap(() {
                      setState(() => addingBoundary = !addingBoundary);
                    }),
                  ],
                ).pOnly(top: 80, right: 30),

                // Undo Button
                if (markerPoints.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        textKey: AppStrings.undoString,
                        color: color,
                        bold: true,
                      ),
                      10.widthBox,
                      VxCircle(
                        radius: 35,
                        backgroundColor: color,
                        child: Icon(Icons.undo_sharp, color: whiteColor),
                      ).onInkTap(() {
                        setState(() => markerPoints.removeLast());
                      }),
                    ],
                  ).pOnly(top: 160, right: 30),

                // Add Farm Button
                Positioned.fill(
                  child: CustomButtonElevated(
                    text: AppStrings.addFarm,
                    onTap: () {
                      if (markerPoints.length >= 3) {
                        final newFarm = LandModel(
                          landId: DateTime.now().millisecondsSinceEpoch.toString(),
                          landName: 'Farm ${DateTime.now().second}',
                          registrationNumber: '',
                          farmLocation: 'Unknown',
                          latitude: markerPoints.first.latitude,
                          longitude: markerPoints.first.longitude,
                          unitOfMeasure: 'acres',
                          waterSource: 'Unknown',
                          documents: [],
                          area: null,
                         coordinates: markerPoints
    .asMap()
    .entries
    .map((entry) => Coordinate(
          latitude: entry.value.latitude,
          longitude: entry.value.longitude,
          index: entry.key, // Assign index safely
        ))
    .toList(), crops: [],

                        );

                        Navigator.pop(context, newFarm);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please mark at least 3 points to define a farm."),
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
}
