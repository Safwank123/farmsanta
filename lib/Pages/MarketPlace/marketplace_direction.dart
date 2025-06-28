import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Widgets/Widgets/custom_button.dart';
import '../../Widgets/Widgets/custom_text.dart';
import '../../themeFiles/app_colors.dart';
import '../../themeFiles/app_typography.dart';
import '../base_screen.dart';

class DirectionPage extends BaseScreen {
  const DirectionPage({super.key});

  @override
  BaseScreenState<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends BaseScreenState<DirectionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController startLocationController = TextEditingController();
  final TextEditingController endLocationController = TextEditingController();

  LatLng startLocation = LatLng(37.7749, -122.4194); // Example start
  LatLng endLocation = LatLng(37.3382, -121.8863);   // Example end

  @override
  void initState() {
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

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: bottomBar(() {}, "5 km", "16 mins"),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: startLocation,
              initialZoom: 10,
              onTap: (tapPosition, point) {
                // You can implement marker update on tap if needed
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
                    point: startLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.location_on, color: Colors.red),
                  ),
                  Marker(
                    point: endLocation,
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.flag, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
          locationDirectionInfo(context, "Your Location", "Farm Store")
              .pOnly(top: 50, left: 20, right: 20),
        ],
      ),
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
                const Icon(Icons.pedal_bike, size: 16),
                CustomText(
                  textKey: timeLeft,
                  style: AppTextStyle.bodySmall,
                  color: AppColors.primary,
                ),
              ],
            ),
          ],
        ),
      ],
    ).p12().box.make().color(AppColors.white).cornerRadius(35).p24();
  }

  Widget locationDirectionInfo(
      BuildContext context, String yourLocation, String storeLocation) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
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
            ),
          ],
        ),
        20.heightBox,
        TabBar(
          labelColor: AppColors.enabledBlue,
          controller: _tabController,
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
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
              icon: Icon(option.icon),
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
      timeLeft: '20 min',
      distanceLeft: '3.5 km',
      icon: Icons.directions_bike,
    ),
    VehicleOption(
      title: 'Car',
      timeLeft: '10 min',
      distanceLeft: '5.0 km',
      icon: Icons.directions_car,
    ),
    VehicleOption(
      title: 'Train',
      timeLeft: '15 min',
      distanceLeft: '6.0 km',
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
