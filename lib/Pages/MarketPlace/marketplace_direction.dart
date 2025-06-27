

import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../themeFiles/app_colors.dart';

class DirectionPage extends BaseScreen {
  const DirectionPage({super.key});

  @override
  BaseScreenState<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends BaseScreenState<DirectionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TextEditingController startLocationController = TextEditingController();
  TextEditingController endLocationController = TextEditingController();
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: vehicleOptions.length, vsync: this);
  }

  @override
  void dispose() {
    startLocationController.dispose();
    endLocationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _addMarkers() {
    String startLocation = startLocationController.text;
    String endLocation = endLocationController.text;

    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('start'),
          position: LatLng(37.7749,
              -122.4194), // Replace with actual coordinates of start location
          infoWindow:
              InfoWindow(title: 'Start Location', snippet: startLocation),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('end'),
          position: LatLng(37.3382,
              -121.8863), // Replace with actual coordinates of end location
          infoWindow: InfoWindow(title: 'End Location', snippet: endLocation),
        ),
      );
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: bottomBar(() {}, "5 km", "16 mins"),
      body: Stack(alignment: Alignment.topCenter, children: [
        //maps
        Expanded(
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  37.7749, -122.4194), // Replace with initial camera position
              zoom: 12.0,
            ),
          ),
        ),

        //Top
        locationDirectionInfo(context, "Your Location", "Farm Store")
            .pOnly(top: 50, left: 20, right: 20),
      ]),
    );
  }

  Widget bottomBar(dynamic onTap, String distanceLeft, String timeLeft) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonElevated(text: "Start Direction", onTap: () {}),
        Row(
          children: [
            Row(
              children: [
                CustomText(textKey: '•'),
                CustomText(
                  textKey: distanceLeft,
                  color: AppColors.primary,
                  bold: true,
                ),
              ],
            ),
            10.widthBox,
            Row(
              children: [
                Icon(
                  Icons.pedal_bike,
                  size: 16,
                ),
                CustomText(
                    textKey: timeLeft,
                    style: AppTextStyle.bodySmall,
                    color: AppColors.primary),
              ],
            ),
          ],
        ),
      ],
    ).p12().box.make().color(AppColors.white).cornerRadius(35).p24();
  }

  Widget locationDirectionInfo(
      BuildContext context, yourLocation, String storeLocation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: yourLocation,
                  color: AppColors.orange,
                  bold: true,
                ),
                20.heightBox,
                CustomText(
                  textKey: storeLocation,
                  color: AppColors.primary,
                  bold: true,
                ),
              ],
            )
          ],
        ),
        20.heightBox,
        TabBar(
          labelColor: AppColors.enabledBlue,
          controller: _tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 15),
          indicator: BoxDecoration(
            color: AppColors.blueLight,
            borderRadius: BorderRadius.circular(25),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.enabledBlue,
          dividerColor: AppColors.white,
          tabs: vehicleOptions.map((option) {
            return Tab(
              iconMargin: EdgeInsets.zero,
              text: option.distanceLeft,
              icon: Icon(
                option.icon,
              ),
            );
          }).toList(),
        ),
      ],
    ).wFull(context).p16().box.make().color(AppColors.white).cornerRadius(16);
  }

  List<VehicleOption> vehicleOptions = [
    VehicleOption(
      title: 'Walk',
      timeLeft: '35 min',
      distanceLeft: '2.5 km',
      icon: Icons.directions_walk,
    ),
    VehicleOption(
      title: 'Bicycle',
      timeLeft: '35 min',
      distanceLeft: '20 min',
      icon: Icons.directions_bike,
    ),
    VehicleOption(
      title: 'Car',
      timeLeft: '35 min',
      distanceLeft: '10 min',
      icon: Icons.directions_car,
    ),
    VehicleOption(
      title: 'Train',
      timeLeft: '35 min',
      distanceLeft: '15 min',
      icon: Icons.train,
    ),
  ];
}

class VehicleOption {
  final String title;
  final String timeLeft;
  final String distanceLeft;
  final IconData icon;

  VehicleOption({
    required this.title,
    required this.timeLeft,
    required this.distanceLeft,
    required this.icon,
  });
}
