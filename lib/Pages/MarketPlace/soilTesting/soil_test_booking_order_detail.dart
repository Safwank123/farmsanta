import 'dart:async';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Models/MarketPlace/SoilTesting/lab_model.dart';
import '../../../Models/MarketPlace/SoilTesting/soil_test_booking_model.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/app_bar.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class SoilTestBookingOrderDetail extends BaseScreen {
  static const String routeName = "/soil-test-booking-order-detail-screen";
  final bool isExpert;
  const SoilTestBookingOrderDetail({required this.isExpert, super.key});

  @override
  BaseScreenState<SoilTestBookingOrderDetail> createState() => _SoilTestBookingOrderDetailState();
}

class _SoilTestBookingOrderDetailState extends BaseScreenState<SoilTestBookingOrderDetail> {
  bool isBookingConfirmed = false;
  double _initailProgressState = 0.0;
  late Timer _progressTimer;
  int activeStep = 0;
  final TextEditingController startLocationController = TextEditingController();
  final TextEditingController endLocationController = TextEditingController();
  final List<Marker> _markers = [];

  LatLng startLocation = LatLng(37.7749, -122.4194);
  LatLng endLocation = LatLng(37.3382, -121.8863);

  void updateProgressState() {
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _initailProgressState += 0.01;
        if (_initailProgressState >= 1.0) {
          isBookingConfirmed = true;
          activeStep = 1;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    startLocationController.dispose();
    endLocationController.dispose();
    _progressTimer.cancel();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    updateProgressState();
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly(
        AppStrings.soilTestBooking,
        titleSize: 15,
        backgroundColor: AppColors.soilTestPrimary,
        color: AppColors.white,
        toolbarHeight: 25,
        iconData: Icons.arrow_back,
        iconSize: 20,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.soilTestPrimary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: height * 0.50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!isBookingConfirmed)
                    CustomText(
                      textKey: AppStrings.approvalWaiting,
                      color: AppColors.white,
                    ),
                  10.heightBox,
                  if (!isBookingConfirmed)
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.greenLight),
                      value: _initailProgressState,
                      backgroundColor: AppColors.white,
                      minHeight: 10,
                    ).cornerRadius(10),
                  if (!isBookingConfirmed)
                    CustomText(
                      size: 10,
                      textKey: " ${AppStrings.minLeft}",
                      color: AppColors.white,
                    ).objectBottomRight(),
                  if (isBookingConfirmed && widget.isExpert)
                    CustomText(
                      size: 20,
                      bold: true,
                      textKey: '✅ ${AppStrings.bookingAccepted.toUpperCase()}',
                      color: AppColors.white,
                    ),
                  if (isBookingConfirmed && !widget.isExpert)
                    CustomText(
                      size: 20,
                      bold: true,
                      textKey: '✅ ${AppStrings.bookingConfirmed.toUpperCase()}',
                      color: AppColors.white,
                    ),
                  Row(
                    children: [
                      CustomText(
                        size: 18,
                        textKey: AppStrings.soilTesting.toUpperCase(),
                        color: AppColors.white,
                      ),
                      5.widthBox,
                      CustomText(
                        size: 10,
                        textKey: widget.isExpert ? ' ${AppStrings.byLabExpert} ' : ' ${AppStrings.selfSoilCollection} ',
                        color: AppColors.white,
                      ).box.make().color(AppColors.LightsoilTestPrimary).cornerRadius(5),
                    ],
                  ),
                  CustomText(
                    size: 10,
                    textKey: '${AppStrings.bookingID}:- ',
                    color: AppColors.white,
                  ),
                  CustomText(
                    size: 10,
                    textKey: widget.isExpert ? '${AppStrings.soilCollectionDate}: ' : '${AppStrings.labVisitDate}: ',
                    color: AppColors.white,
                  ),
                  if (widget.isExpert) 5.heightBox,
                  if (!widget.isExpert) labInfoCard(),
                  if (widget.isExpert) addressCard(address: "#350 Farm No., "),
                  5.heightBox,
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: startLocation,
                      initialZoom: 10,
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
                  ).w(width * 0.7).h(height * 0.35).cornerRadius(10),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      textKey: widget.isExpert ? '${AppStrings.visitOn}:' : '${AppStrings.directionOn}:',
                      color: AppColors.white,
                    ),
                  ).w(width).h(height * 0.05).color(AppColors.gray).cornerRadius(5).pSymmetric(v: 5),
                  Row(
                    children: [
                      Icon(size: 15, Icons.info_outlined, color: AppColors.orange),
                      5.widthBox,
                      CustomText(
                        overflow: TextOverflow.visible,
                        color: AppColors.gray,
                        size: 10,
                        textKey: AppStrings.directionWillBeShownAfterBookingApproval,
                      ),
                    ],
                  ),
                  10.heightBox,
                  CustomText(textKey: AppStrings.connectWithLab),
                  contactCard(sellerName: AppStrings.sellerName).pSymmetric(v: 10, h: 5).color(AppColors.white).cornerRadius(5),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: CustomText(size: 10, textKey: AppStrings.cancelBooking, color: AppColors.white),
                      ).centered().w(width * 0.45).h(height * 0.05).color(AppColors.red).cornerRadius(10),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(size: 10, textKey: AppStrings.editContactDetails, color: AppColors.white),
                      ).centered().w(width * 0.45).h(height * 0.05).color(AppColors.greenLight).cornerRadius(10),
                    ],
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      Icon(size: 15, Icons.info_outlined, color: AppColors.orange),
                      5.widthBox,
                      CustomText(color: AppColors.gray, size: 10, textKey: AppStrings.cancelOrEditDetailsWithin5MinOfPlacingOrder),
                    ],
                  ),
                ],
              ).p(10),
            ],
          )
        ]),
      ),
    );
  }

  Widget labInfoCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "Lab Name", color: AppColors.soilTestPrimary),
            WidgetHelper.ratingReviewTag(rating: 4.5, noOfReviewsInK: 1).color(AppColors.grayLight).cornerRadius(15)
          ],
        ),
        3.heightBox,
        titleIconRowWidget(
          titleColor: AppColors.gray,
          icon: Icon(Icons.location_on, size: 15, color: AppColors.soilTestPrimary),
          title: "Address",
        ),
        5.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "5:00 AM - 9:00 PM", color: AppColors.gray),
            CustomText(textKey: AppStrings.openNow, color: AppColors.primary),
          ],
        ),
      ],
    ).p(5).h(height * 0.1).color(AppColors.white).cornerRadius(5);
  }

  Widget titleIconRowWidget({required Icon icon, required String title, Color? titleColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        icon,
        5.widthBox,
        CustomText(textKey: title, size: 10, color: titleColor ?? AppColors.gray),
      ],
    );
  }

  Widget addressCard({required String address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(textKey: AppStrings.yourAddress.toUpperCase(), color: AppColors.gray),
        3.heightBox,
        CustomText(textKey: AppStrings.farm.toUpperCase(), bold: true, color: AppColors.soilTestPrimary),
        3.heightBox,
        CustomText(size: 10, textKey: address, color: AppColors.gray),
      ],
    ).p(5).h(height * 0.1).w(width).color(AppColors.white).cornerRadius(5).pSymmetric(h: 10);
  }

  Widget contactCard({required String sellerName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(ImageRoutes.sellerProfilePic),
            5.widthBox,
            CustomText(textKey: sellerName, size: 10),
          ],
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.call, color: AppColors.gray),
              label: CustomText(size: 10, textKey: AppStrings.call, color: AppColors.black),
            ).h(height * 0.05).color(AppColors.grayLight).cornerRadius(20),
            5.widthBox,
            TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.wechat_sharp, color: AppColors.primary),
              label: CustomText(size: 10, textKey: AppStrings.message, color: AppColors.black),
            ).h(height * 0.05).color(AppColors.grayLight).cornerRadius(20),
          ],
        ),
      ],
    );
  }
}
