import 'dart:async';



import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:flutter/material.dart';


import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../themeFiles/app_colors.dart';

import '../base_screen.dart';
import './marketplace_order_confirmed.dart';

class MarketPlaceOrderDetail extends BaseScreen {
  final bool isPurchase;
  final bool isdelivery;

  const MarketPlaceOrderDetail(
      {super.key, required this.isPurchase, required this.isdelivery});

  @override
  BaseScreenState<MarketPlaceOrderDetail> createState() =>
      _MarketPlaceOrderDetailState();
}

class _MarketPlaceOrderDetailState
    extends BaseScreenState<MarketPlaceOrderDetail> {
  double _initailProgressState = 0.0;
  bool isHomeDeliveryOrderConfirmed = false;
  late Timer _progressTimer;
  int activeStep = 0;

  var billDetails = {
    1: AppStrings.mrpPrice,
    2: AppStrings.discount,
    3: AppStrings.deliveryCharges,
    4: AppStrings.gstCharges,
  };

  void updateProgressState() {
    _progressTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _initailProgressState = _initailProgressState + 0.01;

        if (_initailProgressState >= 1.0 &&
            widget.isPurchase &&
            widget.isdelivery) {
          isHomeDeliveryOrderConfirmed = true;
          activeStep = 1;
        } else if (_initailProgressState >= 1.0) {
          timer.cancel();
          navigateToPageReplaceMent(
              MarketPlaceOrderConfirmed(isPurchase: widget.isPurchase));
        }
      });
    });
  }

  final List<StoreModel> _purchaseStoreList =
      StoreHelper.store.purchaseStoreList;
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<PurchaseOrderModel> _purchaseOrderList =
      StoreHelper.store.purchaseOrderList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

  @override
  void dispose() {
    _progressTimer.cancel();
    super.dispose();
  }

  @override
  Widget buildWidget(BuildContext context) {
    updateProgressState();
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        // My purchase/ Rent booking text
        widget.isPurchase ? AppStrings.myPurchase : AppStrings.rentBooking,
        titleSize: 15,
        backgroundColor:
            widget.isPurchase ? AppColors.primary : AppColors.orange,
        color: AppColors.white,
        toolbarHeight: 25,
        iconData: Icons.arrow_back,
        iconSize: 20,
      ),

      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              // colored container with clip from bottom
              Container(
                decoration: BoxDecoration(
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                height: height * 0.35,
              ),

              // content over colored container
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Approval waiting text
                  if (!isHomeDeliveryOrderConfirmed)
                    CustomText(
                      textKey: AppStrings.approvalWaiting,
                      color: AppColors.white,
                    ),

                  //some spacing
                  10.heightBox,

                  // linear progress indicator
                  if (!isHomeDeliveryOrderConfirmed)
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.greenLight),
                      value: _initailProgressState,
                      backgroundColor: AppColors.white,
                      minHeight: 10,
                    ).cornerRadius(10),

                  // time left text
                  if (!isHomeDeliveryOrderConfirmed)
                    CustomText(
                      size: 10,
                      textKey: " min Left", // TODO: To be added in model
                      color: AppColors.white,
                    ).objectBottomRight(),

                  // Home Delivery order status
                  if (isHomeDeliveryOrderConfirmed)
                    //Order/Booking Confirmed text
                    CustomText(
                      size: 20,
                      bold: true,
                      textKey: activeStep == 3
                          ? '📦 ${AppStrings.orderDelivered.toUpperCase()}'
                          : activeStep == 2
                              ? '🚲  ${AppStrings.orderOnTheWay.toUpperCase()}'
                              : activeStep == 1
                                  ? '✅ ${AppStrings.orderConfirmed.toUpperCase()}'
                                  : '',
                      color: AppColors.white,
                    ),
                  // Order status/ product name text
                  CustomText(
                    size: 18,
                    textKey: widget.isPurchase
                        ? _purchaseOrderList[0].delivery
                            ? AppStrings.deliveryOrder
                            : AppStrings.pickupOrder
                        : "${_rentalStoreList[0].categories[0].name.toUpperCase()} FOR RENT",
                    color: AppColors.white,
                  ),

                  // Order/Rent id text
                  CustomText(
                    size: 10,
                    textKey: widget.isPurchase
                        ? '${AppStrings.orderID}: '
                        : '${AppStrings.rentID}: ', // TODO: Need to add in model
                    color: AppColors.white,
                  ),

                  // pickup status/date text
                  CustomText(
                    size: 10,
                    textKey: widget.isPurchase
                        ? _purchaseOrderList[0].delivery
                            ? '${AppStrings.orderDelivery}: ' // TODO: Need to add in model
                            : '${AppStrings.pickupStatus}: ${_purchaseOrderList[0].status}'
                        : '${AppStrings.pickupDate}: ${_rentalOrderList[0].pickupDateTime}',
                    color: AppColors.white,
                  ),

                  //some spacing
                  10.heightBox,

                  // home order delivery steps
                  if (widget.isPurchase && _purchaseOrderList[0].delivery)
                  //  EasyStepper(
                    //   activeStep: activeStep,
                    //   lineLength: height * 0.10,
                    //   lineSpace: 0,
                    //   lineType: LineType.normal,
                    //   defaultLineColor: AppColors.white,
                    //   finishedLineColor: AppColors.greenLight,
                    //   internalPadding: 0,
                    //   showLoadingAnimation: false,
                    //   stepRadius: 20,
                    //   showStepBorder: false,
                    //   steps: [
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 1
                    //             ? AppColors.greenLight
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
                    //         textKey: AppStrings.orderAccepted,
                    //       ),
                    //     ),
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 2
                    //             ? AppColors.greenLight
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
                    //         textKey: AppStrings.dispatched,
                    //       ),
                    //     ),
                    //     EasyStep(
                    //       customStep: CircleAvatar(
                    //         radius: 20,
                    //         backgroundColor: activeStep >= 3
                    //             ? AppColors.greenLight
                    //             : AppColors.white,
                    //         child: Icon(
                    //           Icons.cases_sharp,
                    //           color: activeStep >= 3
                    //               ? AppColors.white
                    //               : AppColors.gray,
                    //         ),
                    //       ),
                    //       customTitle: CustomText(
                    //         size: 10,
                    //         color: AppColors.white,
                    //         textAlign: TextAlign.center,
                    //         textKey: AppStrings.delivered,
                    //       ),
                    //     ),
                    //   ],
                    //   onStepReached: (index) =>
                    //       setState(() => activeStep = index + 1),
                    // ),

                  // for purchase // for pickup
                  if (widget.isPurchase && !_purchaseOrderList[0].delivery)
                    // store order info card
                    storeOrderInfoCard(storeModel: _purchaseStoreList[0]),
                  // for purchase // for delivery
                  if (widget.isPurchase && _purchaseOrderList[0].delivery)
                    // stepper for purchase home delivery
                    // delivery address card
                    deliveryAddressCard(address: _purchaseStoreList[0].address),

                  // for rental
                  if (!widget.isPurchase)
                    // store order info card
                    storeOrderInfoCard(storeModel: _rentalStoreList[0]),

                  // some spacing
                  10.heightBox,

                  // map image
                  Image.asset(
                    ImageRoutes.pickupMap,
                    fit: BoxFit.fitWidth,
                  ),

                  // direction button
                  TextButton(
                          onPressed: () {},
                          child: CustomText(
                            textKey: widget.isPurchase
                                ? _purchaseOrderList[0].delivery
                                    ? AppStrings.trackYourOrder
                                    : AppStrings.directions
                                : AppStrings.directions,
                            color: AppColors.white,
                          ))
                      .w(width)
                      .h(height * 0.05)
                      .color(isHomeDeliveryOrderConfirmed
                          ? AppColors.primary
                          : AppColors.gray)
                      .cornerRadius(5)
                      .pSymmetric(h: 10, v: 5),

                  // direction message
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
                          textKey: AppStrings.directionWillBeShownAfterApproval)
                    ],
                  ),

                  // some spacing
                  5.heightBox,

                  // connect with seller text
                  CustomText(textKey: AppStrings.connectWithSeller),

                  // seller contact card
                  sellerContactCard(
                    sellerName:
                        AppStrings.sellerName, // TODO: need to add in model
                  )
                      .pSymmetric(v: 10, h: 5)
                      .color(AppColors.white)
                      .cornerRadius(5),

                  // some spacing
                  5.heightBox,
                  // cancel and edit order detail button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: CustomText(
                          size: 10,
                          textKey: AppStrings.cancelOrder,
                          color: AppColors.white,
                        ),
                      )
                          .centered()
                          .w(width * 0.45)
                          .h(height * 0.05)
                          .color(AppColors.red)
                          .opacity(
                              value: _purchaseOrderList[0].delivery ? 0.5 : 1)
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
                          .opacity(
                              value: _purchaseOrderList[0].delivery ? 0.5 : 1)
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

                  // some spacing
                  10.heightBox,

                  // if home delivery confirmed the display this
                  if (_purchaseOrderList[0].delivery)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //order summary text
                        CustomText(
                          size: 15,
                          textKey: AppStrings.orderSummary,
                          bold: true,
                        ),

                        // order summary card

                        purchaseOrderSummaryCard(
                          purchaseOrderModelList: _purchaseOrderList,
                          orderPlacedDate:
                              "14 June, 2023", //TODO: need to add to model
                        ).cornerRadius(10),

                        // some spacing
                        10.heightBox,

                        // payment mode card
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // payment mode text
                            CustomText(
                              textKey: AppStrings.paymentMode,
                              color: AppColors.gray,
                            ),

                            // some spacing
                            10.heightBox,

                            // payment mode value with icon
                            paymentModeAndIcon(
                                isBold: false,
                                paymentNameColor: widget.isPurchase
                                    ? AppColors.primary
                                    : AppColors.orange,
                                paymentMode: AppStrings
                                    .gPay) // TODO: To be passed through UI
                          ],
                        )
                            .p(10)
                            .w(width)
                            .color(AppColors.white)
                            .cornerRadius(10),

                        // some spacing
                        5.heightBox,

                        // delivery address text
                        CustomText(
                          textKey: AppStrings.deliveryAddress,
                          color: AppColors.gray,
                        ),

                        // Home text and address
                        headingValueCard(
                            isBold: false,
                            heading: AppStrings.home,
                            value: _purchaseStoreList[0].address),

                        // some spacing
                        5.heightBox,

                        // contact details text
                        CustomText(
                          textKey: AppStrings.contactDetails,
                          color: AppColors.gray,
                        ),

                        // name text and phone no
                        headingValueCard(
                            isBold: false,
                            heading: AppStrings.name,
                            value: _purchaseStoreList[0].contact),

                        // some spacing
                        5.heightBox,

                        // bill details text
                        CustomText(
                          textKey: AppStrings.billDetails,
                          color: AppColors.gray,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int i = 1; i <= 4; i++)
                              CustomText(
                                textKey: billDetails[i]!,
                                size: 10,
                                color: AppColors.gray,
                              ).p(8),
                            CustomText(
                              textKey: AppStrings.totalAmount,
                              color: AppColors.primary,
                              bold: true,
                            )
                                .p(5)
                                .w(width)
                                .box
                                .make()
                                .color(AppColors.grayLight)
                                .p(8)
                          ],
                        ).w(width).color(AppColors.white).cornerRadius(10),
                      ],
                    )
                ],
              ).p(10),
            ],
          )
        ],
      )),
    );
  }

  Widget storeOrderInfoCard({required StoreModel storeModel}) {
    return Column(
      children: [
        // store name and rating review tag
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: storeModel.name,
              color: widget.isPurchase ? AppColors.primary : AppColors.orange,
            ),
            WidgetHelper.ratingReviewTag(
              rating: storeModel.rating,
              noOfReviewsInK: storeModel.reviews.length,
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
              color: widget.isPurchase ? AppColors.primary : AppColors.orange,
            ),
            title: storeModel.address),

        // some spacing
        5.heightBox,

        // active hours and open-closed status
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // active hours text
            CustomText(
              textKey:
                  '${storeModel.activeHours?.min}:00 AM - ${storeModel.activeHours?.max}:00 PM',
              color: AppColors.gray,
            ),

            // open-closed status text
            CustomText(
              textKey: AppStrings.openNow,
              color: AppColors.primary,
            ), //TODO: To be added to model
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

        // store name
        CustomText(
          textKey: title,
          size: 10,
          color: widget.isPurchase
              ? titleColor ?? AppColors.primary
              : titleColor ?? AppColors.orange,
        )
      ],
    );
  }

  Widget deliveryAddressCard({required String address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // delivery address text
        CustomText(
          textKey: AppStrings.deliveryAddress,
          color: AppColors.gray,
        ),

        // some spacing
        3.heightBox,

        // HOME text
        CustomText(
          textKey: AppStrings.home.toUpperCase(),
          bold: true,
          color: AppColors.primary,
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

  Widget sellerContactCard({required String sellerName}) {
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

  Widget purchaseOrderSummaryCard(
      {required String orderPlacedDate,
      required List<PurchaseOrderModel> purchaseOrderModelList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // orderplace and status row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // order placed text value
            CustomText(
              textKey: '${AppStrings.orderPlacedOn}: $orderPlacedDate',
              color: AppColors.gray,
            ),

            // delivery status tag
            CustomText(
              color: AppColors.white,
              textKey: purchaseOrderModelList[0].delivery
                  ? ' ${AppStrings.deliveryOrder} '
                  : ' ${AppStrings.pickupOrder} ',
              size: 10,
            ).box.make().color(AppColors.orange).cornerRadius(5)
          ],
        ),

        10.heightBox,

        CustomText(
            size: 10,
            color: AppColors.gray,
            textKey:
                '${purchaseOrderModelList[0].products.length} ${AppStrings.itemsPurchase}'),

        // some spacing
        10.heightBox,

        ListView.builder(
            itemCount: purchaseOrderModelList[0].products.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  // image
                  Image.asset(purchaseOrderModelList[0].products[index].image)
                      .p(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // product name
                      CustomText(
                          size: 10,
                          color: AppColors.gray,
                          textKey:
                              purchaseOrderModelList[0].products[index].name),

                      // number of units
                      CustomText(
                          size: 10,
                          color: AppColors.gray,
                          textKey:
                              '${AppStrings.noOfUnits}: ${purchaseOrderModelList[0].products.length}'), //TODO: To be added in model

                      // price
                      CustomText(
                          size: 10,
                          bold: true,
                          textKey:
                              '\$${purchaseOrderModelList[0].products[index].amount}'),
                    ],
                  ),
                ],
              );
            }).h(height * 0.2)
      ],
    ).p(10).color(AppColors.white);
  }

// payment mode and icon widget
  Widget paymentModeAndIcon(
      {required String paymentMode, Color? paymentNameColor, bool? isBold}) {
    return Row(
      children: [
        // image icon
        Image.asset(widget.isPurchase
            ? ImageRoutes.purchaseStoreIcon
            : ImageRoutes.rentalStoreIcon),
        5.widthBox,

        // payment mode
        CustomText(
          textKey: paymentMode,
          size: 10,
          color: paymentNameColor ?? AppColors.gray,
          bold: isBold ?? true,
        )
      ],
    );
  }

  Widget headingValueCard(
      {required String heading, required String value, bool? isBold}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // heading text
        CustomText(
          textKey: heading.toUpperCase(),
          bold: isBold ?? true,
          color: AppColors.primary,
        ),

        // some spacing
        3.heightBox,

        // value
        CustomText(
          size: 10,
          textKey: value,
          color: AppColors.gray,
        ),
      ],
    ).p(10).w(width).color(AppColors.white).cornerRadius(10);
  }
}
