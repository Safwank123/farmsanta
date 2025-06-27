// ignore_for_file: sort_child_properties_last


import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../base_screen.dart';

class FarmDrawScreen extends BaseScreen {
  static const routeName = "/farm-draw-screen";
  const FarmDrawScreen({super.key});

  @override
  BaseScreenState<FarmDrawScreen> createState() => _FarmDrawScreenState();
}

class _FarmDrawScreenState extends BaseScreenState<FarmDrawScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    var color = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    var whiteColor = AppThemeColors.getColor(AppThemeColorsEnum.white);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              GoogleMap(
                      onMapCreated: (controller) {
                        onMapCreated(controller);
                      },
                      polygons: polygons,
                      polylines: polylines,
                      onTap: (argument) {
                        if (addingBoundary) {
                          addPoint(argument);
                        }
                      },
                      rotateGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: true,
                      markers: markers,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          zoom: 12,
                          target:
                              LatLng(position!.latitude, position!.longitude)))
                  .hFull(context),
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
                    child: Icon(
                      addingBoundary ? Icons.close : Icons.map,
                      color: whiteColor,
                    ),
                    radius: 35,
                    backgroundColor: color,
                  ).onInkTap(() {
                    setState(() {
                      addingBoundary = !addingBoundary;
                    });
                  })
                ],
              ).pOnly(top: 80, right: 30),
              if (markers.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      textKey: AppStrings.undoString,
                      color: color,
                      bold: true,
                    ),
                    //TODO color
                    10.widthBox,
                    VxCircle(
                      child: Icon(
                        Icons.undo_sharp,
                        color: whiteColor,
                      ),
                      radius: 35,
                      backgroundColor: color,
                    ).onInkTap(() {
                      setState(() {
                        addingBoundary = !addingBoundary;
                      });
                    })
                  ],
                ).pOnly(top: 160, right: 30),

              //add farm button
              Positioned.fill(
                  child: CustomButtonElevated(
                          text: AppStrings.addFarm,
                          onTap: () {
                            //TODO
                          })
                      .w24(context)
                      .objectBottomCenter()
                      .pOnly(bottom: 15))
            ],
          )
        ],
      ).hFull(context).wFull(context),
    );
  }

  var position = StoreHelper.store.position;
  Set<Marker> markers = {};
  bool addingBoundary = false;
  Set<Polygon> polygons = {};
  Set<Polyline> polylines = {};

  //function called when map is created and visible to user
  void onMapCreated(GoogleMapController controller) {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Container(
    //       color: AppThemeColors.getColor(AppThemeColorsEnum.white),
    //       child: Column(
    //         children: [
    //           CustomText(
    //             textKey: AppStrings.markYourarea,
    //             semiBold: true,
    //           ),
    //           15.heightBox,
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: CustomText(textKey: AppStrings.createBoundaryMark),
    //               ),
    //               Icon(
    //                 Icons.location_on,
    //                 size: 30,
    //               ).w32(context)
    //             ],
    //           ),
    //           15.heightBox,
    //           CustomText(
    //             textKey: AppStrings.gotIt,
    //             color: AppThemeColors.getColor(AppThemeColorsEnum.primary),
    //             underLine: true,
    //           ).onInkTap(() {
    //             Navigator.pop(context);
    //           })
    //         ],
    //       ).p8(),
    //     );
    //   },
    // );
  }

  //function to add points on map and create shape
  addPoint(LatLng latLng) {
    int id = markers.length + 1;
    print("length id ${id} ");
    if (id < 5) {
      //creating lines
      if (id > 1) {
        if (id == 4) {
          polylines.remove(polylines.last);
        }
        polylines.add(
          Polyline(
            polylineId: PolylineId('line_$id'),
            points: [latLng, markers.last.position],
            color: AppThemeColors.getColor(AppThemeColorsEnum.primary),
            width: 2,
          ),
        );
      }
      markers.add(Marker(
        markerId: MarkerId("marker_$id"),
        position: latLng,
      ));

      //creating shape
      if (id == 4) {
        polygons.remove(polygons.first);
        polygons.add(Polygon(
          polygonId: const PolygonId('square'),
          points: markers.map((e) => e.position).toList(),
          strokeColor: AppThemeColors.getColor(AppThemeColorsEnum.primary),
          strokeWidth: 2,
          fillColor: AppThemeColors.getColor(AppThemeColorsEnum.locationBackground),
        ));
      } else if (id == 3) {
        polygons.add(Polygon(
          polygonId: const PolygonId('triangle'),
          points: markers.map((e) => e.position).toList(),
          strokeColor: AppThemeColors.getColor(AppThemeColorsEnum.primary),
          strokeWidth: 2,
          fillColor: AppThemeColors.getColor(AppThemeColorsEnum.locationBackground),
        ));
      }

      //creating last to first line
      if (id > 2) {
        polylines.add(
          Polyline(
            polylineId: PolylineId('line_$id'),
            points: [latLng, markers.first.position],
            color: AppThemeColors.getColor(AppThemeColorsEnum.primary),
            width: 2,
          ),
        );
      }

      print("lenght is ${polygons.length} ${polylines.length}");
      setState(() {});
    }
  }
}
