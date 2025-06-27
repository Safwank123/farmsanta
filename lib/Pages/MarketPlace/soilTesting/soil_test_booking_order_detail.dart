import 'dart:async';

import 'package:easy_stepper/easy_stepper.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  BaseScreenState<SoilTestBookingOrderDetail> createState() =>
      _SoilTestBookingOrderDetailState();
}

class _SoilTestBookingOrderDetailState
    extends BaseScreenState<SoilTestBookingOrderDetail> {
  bool isBookingConfirmed = false;
  double _initailProgressState = 0.0;
  late Timer _progressTimer;
  int activeStep = 0;
  TextEditingController startLocationController = TextEditingController();
  TextEditingController endLocationController = TextEditingController();
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  // final List<SoilTestBookingModel> _soilTestBookingModelList =
  //     soilTestBookingModelList;
  // final List<LabModel> _labModelList = labModelList;

  void updateProgressState() {
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _initailProgressState = _initailProgressState + 0.01;

        if (_initailProgressState >= 1.0) {
          isBookingConfirmed = true;
          activeStep = 1;
        } else if (_initailProgressState >= 1.0) {
          timer.cancel();
          // navigateToPageReplaceMent(
          //     MarketPlaceOrderConfirmed(isPurchase: widget.isPurchase));
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
    updateProgressState();
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        // Soil Test Booking text
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
              // colored container with clip from bottom
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

              // content over colored container
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Approval waiting text
                  if (!isBookingConfirmed)
                    CustomText(
                      textKey: AppStrings.approvalWaiting,
                      color: AppColors.white,
                    ),

                  //some spacing
                  10.heightBox,

                  // linear progress indicator
                  if (!isBookingConfirmed)
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.greenLight),
                      value: _initailProgressState,
                      backgroundColor: AppColors.white,
                      minHeight: 10,
                    ).cornerRadius(10),

                  // time left text
                  if (!isBookingConfirmed)
                    CustomText(
                      size: 10,
                      textKey:
                          " ${AppStrings.minLeft}", // TODO: To be added in model
                      color: AppColors.white,
                    ).objectBottomRight(),

                  //  Booking status for expert
                  if (isBookingConfirmed && widget.isExpert)
                    // Booking Accepted text
                    CustomText(
                      size: 20,
                      bold: true,
                      textKey: '✅ ${AppStrings.bookingAccepted.toUpperCase()}',
                      color: AppColors.white,
                    ),

                  if (isBookingConfirmed && !widget.isExpert)
                    // Booking Accepted text
                    CustomText(
                      size: 20,
                      bold: true,
                      textKey: '✅ ${AppStrings.bookingConfirmed.toUpperCase()}',
                      color: AppColors.white,
                    ),

                  // Soil Testing text with type tag
                  Row(
                    children: [
                      // soil testing text
                      CustomText(
                        size: 18,
                        textKey: AppStrings.soilTesting.toUpperCase(),
                        color: AppColors.white,
                      ),

                      // some spacing
                      5.widthBox,

                      // type tag
                      CustomText(
                        size: 10,
                        textKey: widget.isExpert
                            ? ' ${AppStrings.byLabExpert} '
                            : ' ${AppStrings.selfSoilCollection} ',
                        color: AppColors.white,
                      )
                          .box
                          .make()
                          .color(AppColors.LightsoilTestPrimary)
                          .cornerRadius(5),
                    ],
                  ),

                  // Booking id
                  CustomText(
                    size: 10,
                    textKey:
                        '${AppStrings.bookingID}:- ', // TODO: Need to add in model
                    color: AppColors.white,
                  ),

                  // Soil Collection/ Lab Visit Date
                  CustomText(
                    size: 10,
                    textKey: widget.isExpert
                        ? '${AppStrings.soilCollectionDate}: ' // TODO:
                        : '${AppStrings.labVisitDate}: ', // TODO:
                    color: AppColors.white,
                  ),

                  // steps for expert
                  if (widget.isExpert)
                    // EasyStepper(
                    //   activeStep: activeStep,
                    //   lineLength: height * 0.06,
                    //   lineSpace: 0,
                    //   lineType: LineType.normal,
                    //   defaultLineColor: AppColors.white,
                    //   finishedLineColor: AppColors.white,
                    //   internalPadding: 0,
                    //   showLoadingAnimation: false,
                    //   stepRadius: 20,
                    //   showStepBorder: false,
                    //   steps: [
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 1
                    //             ? AppColors.LightsoilTestPrimary
                    //             : AppColors.white,
                    //         child: Icon(
                    //           Icons.shopping_bag_rounded,
                    //           color: activeStep >= 1
                    //               ? AppColors.white
                    //               : AppColors.gray,
                    //         ),
                    //       ),
                    //       customTitle: CustomText(
                    //         size: 10,
                    //         color: AppColors.white,
                    //         textAlign: TextAlign.center,
                    //         textKey: AppStrings.bookingAccepted,
                    //       ),
                    //     ),
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 2
                    //             ? AppColors.LightsoilTestPrimary
                    //             : AppColors.white,
                    //         child: Icon(
                    //           Icons.pedal_bike_sharp,
                    //           color: activeStep >= 2
                    //               ? AppColors.white
                    //               : AppColors.gray,
                    //         ),
                    //       ),
                    //       customTitle: CustomText(
                    //         size: 10,
                    //         color: AppColors.white,
                    //         textAlign: TextAlign.center,
                    //         textKey: AppStrings.expertOnTheWay,
                    //       ),
                    //     ),
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 3
                    //             ? AppColors.LightsoilTestPrimary
                    //             : AppColors.white,
                    //         child: Icon(
                    //           Icons.medication_liquid_outlined,
                    //           color: activeStep >= 3
                    //               ? AppColors.white
                    //               : AppColors.gray,
                    //         ),
                    //       ),
                    //       customTitle: CustomText(
                    //         size: 10,
                    //         color: AppColors.white,
                    //         textAlign: TextAlign.center,
                    //         textKey: AppStrings.soilTesting,
                    //       ),
                    //     ),
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 4
                    //             ? AppColors.LightsoilTestPrimary
                    //             : AppColors.white,
                    //         child: Icon(
                    //           Icons.document_scanner_sharp,
                    //           color: activeStep >= 4
                    //               ? AppColors.white
                    //               : AppColors.gray,
                    //         ),
                    //       ),
                    //       customTitle: CustomText(
                    //         size: 10,
                    //         color: AppColors.white,
                    //         textAlign: TextAlign.center,
                    //         textKey: AppStrings.reportShared,
                    //       ),
                    //     ),
                    //   ],
                    //   onStepReached: (index) =>
                    //       setState(() => activeStep = index + 1),
                    // ),

                  // some spacing
                  5.heightBox,

                  // lab info card for self soil collection
                  if (!widget.isExpert)
                    labInfoCard(), // TODO: Model needs to be added

                  // address card for expert
                  if (widget.isExpert)
                    addressCard(
                      address: "#350 Farm No., ", //TODO: Need to add model
                    ),

                  // some spacing
                  5.heightBox,

                  // google map
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.7749,
                          -122.4194), // Replace with initial camera position
                      zoom: 12.0,
                    ),
                  ).w(width * 0.7).h(height * 0.35).cornerRadius(10),

                  // visit/direction on button
                  TextButton(
                          onPressed: () {},
                          child: CustomText(
                            textKey: widget.isExpert
                                ? '${AppStrings.visitOn}:' //TODO: Visit date to be added
                                : '${AppStrings.directionOn}:', //TODO: direction on date to be added
                            color: AppColors.white,
                          ))
                      .w(width)
                      .h(height * 0.05)
                      .color(AppColors.gray)
                      .cornerRadius(5)
                      .pSymmetric(v: 5),

                  // visit/direction on message
                  Row(
                    children: [
                      Icon(
                        size: 15,
                        Icons.info_outlined,
                        color: AppColors.orange,
                      ),
                      5.widthBox,
                      CustomText(
                        overflow: TextOverflow.visible,
                        color: AppColors.gray,
                        size: 10,
                        textKey:
                            AppStrings.directionWillBeShownAfterBookingApproval,
                      ),
                    ],
                  ),

                  // some spacing
                  10.heightBox,

                  // connect with seller text
                  CustomText(textKey: AppStrings.connectWithLab),

                  // Contact card
                  contactCard(
                    sellerName:
                        AppStrings.sellerName, // TODO: need to add in model
                  )
                      .pSymmetric(v: 10, h: 5)
                      .color(AppColors.white)
                      .cornerRadius(5),

                  // some spacing
                  5.heightBox,

                  // cancel and edit detail button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          size: 10,
                          textKey: AppStrings.cancelBooking,
                          color: AppColors.white,
                        ),
                      )
                          .centered()
                          .w(width * 0.45)
                          .h(height * 0.05)
                          .color(AppColors.red)
                          .cornerRadius(10),
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          size: 10,
                          textKey: AppStrings.editContactDetails,
                          color: AppColors.white,
                        ),
                      )
                          .centered()
                          .w(width * 0.45)
                          .h(height * 0.05)
                          .color(AppColors.greenLight)
                          .cornerRadius(10),
                    ],
                  ),
                  // some spacing
                  5.heightBox,
                  // cancel or edit message
                  Row(
                    children: [
                      Icon(
                        size: 15,
                        Icons.info_outlined,
                        color: AppColors.orange,
                      ),
                      5.widthBox,
                      CustomText(
                          color: AppColors.gray,
                          size: 10,
                          textKey: AppStrings
                              .cancelOrEditDetailsWithin5MinOfPlacingOrder),
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

  // lab info card
  Widget labInfoCard(
      // {required LabModel labModel}
      ) {
    return Column(
      children: [
        // lab name and rating review tag
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: "Lab Name", //TODO: To be removed
              // textKey: labModel.name,
              color: AppColors.soilTestPrimary,
            ),
            WidgetHelper.ratingReviewTag(
              rating: 4.5, //TODO: To be removed
              // rating: labModel.rating,
              noOfReviewsInK: 1, //TODO: To be removed
              // noOfReviewsInK: labModel.reviewModel.length,
            ).color(AppColors.grayLight).cornerRadius(15)
          ],
        ),

        // some spacing
        3.heightBox,

        // location icon with address text
        titleIconRowWidget(
            titleColor: AppColors.gray,
            icon: Icon(
              Icons.location_on,
              size: 15,
              color: AppColors.soilTestPrimary,
            ),
            // title: labModel.address,
            title: "Address" //TODO: To be removed
            ),

        // some spacing
        5.heightBox,

        // active hours and open-closed status
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // active hours text
            CustomText(
              textKey: "5:00 AM - 9:00 PM", //TODO: To be removed
              // '${labModel.activeHours?.min}:00 ${AppStrings.am.toUpperCase()} - ${labModel.activeHours?.max}:00 ${AppStrings.pm.toUpperCase()}',
              color: AppColors.gray,
            ),

            // open-closed status text
            CustomText(
              textKey: AppStrings.openNow, //TODO: To be added to model
              color: AppColors.primary,
            ),
          ],
        ),
      ],
    ).p(5).h(height * 0.1).color(AppColors.white).cornerRadius(5);
  }

  // title icon widget in row fashion
  Widget titleIconRowWidget(
      {required Icon icon, required String title, Color? titleColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // icon
        icon,
        5.widthBox,

        // name
        CustomText(
          textKey: title,
          size: 10,
          color: titleColor ?? AppColors.gray,
        )
      ],
    );
  }

  // address card
  Widget addressCard({required String address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // your address text
        CustomText(
          textKey: AppStrings.yourAddress.toUpperCase(),
          color: AppColors.gray,
        ),

        // some spacing
        3.heightBox,

        // FARM text
        CustomText(
          textKey: AppStrings.farm.toUpperCase(),
          bold: true,
          color: AppColors.soilTestPrimary,
        ),

        // some spacing
        3.heightBox,

        // address
        CustomText(
          size: 10,
          textKey: address,
          color: AppColors.gray,
        ),
      ],
    )
        .p(5)
        .h(height * 0.1)
        .w(width)
        .color(AppColors.white)
        .cornerRadius(5)
        .pSymmetric(h: 10);
  }

// contact card
  Widget contactCard({required String sellerName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(ImageRoutes.sellerProfilePic),
            5.widthBox,
            CustomText(
              textKey: sellerName,
              size: 10,
            ),
          ],
        ),
        Row(
          children: [
            TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.call,
                  color: AppColors.gray,
                ),
                label: CustomText(
                  size: 10,
                  textKey: AppStrings.call,
                  color: AppColors.black,
                )).h(height * 0.05).color(AppColors.grayLight).cornerRadius(20),
            5.widthBox,
            TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.wechat_sharp,
                  color: AppColors.primary,
                ),
                label: CustomText(
                  size: 10,
                  textKey: AppStrings.message,
                  color: AppColors.black,
                )).h(height * 0.05).color(AppColors.grayLight).cornerRadius(20),
          ],
        ),
      ],
    );
  }
}
