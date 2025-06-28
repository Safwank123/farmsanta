import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/style_helper.dart';
import '/Widgets/classes/widget_helper_class.dart';
import 'Rental/rent_order_picked.dart';
import 'market_place_order_cancellation.dart';
import 'marketplace_direction.dart';

class MarketPlaceOrderConfirmedDetail extends BaseScreen {
  bool isPurchase;
  PurchaseOrderModel purchaseOrderModel;
  RentalOrderModel rentalOrderModel;
  MarketPlaceOrderConfirmedDetail(
      {super.key,
      required this.isPurchase,
      required this.purchaseOrderModel,
      required this.rentalOrderModel});

  @override
  BaseScreenState<MarketPlaceOrderConfirmedDetail> createState() =>
      _MarketPlaceOrderConfirmedDetail();
}

class _MarketPlaceOrderConfirmedDetail
    extends BaseScreenState<MarketPlaceOrderConfirmedDetail> {
  final List<StoreModel> _purchaseStoreList =
      StoreHelper.store.purchaseStoreList;
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<PurchaseOrderModel> _purchaseOrderList =
      StoreHelper.store.purchaseOrderList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

  var billDetails = {
    1: AppStrings.mrpPrice,
    2: AppStrings.discount,
    3: AppStrings.deliveryCharges,
    4: AppStrings.gstCharges,
  };

  bool orderconfirmed = true;
  final cancellationReasonController = TextEditingController();

  Future updateProgressState() async {
    await Future.delayed(Duration(seconds: 10)).then((value) {
      navigateToPageReplaceMent(
          MarketPlaceCancellationApproved(isPurchase: widget.isPurchase));
    });
  }

  Future _renttimeStarted() async {
    await Future.delayed(Duration(seconds: 5)).then((value) {
      navigateToPageReplaceMent(RentOrderPicked(isPurchase: false));
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (widget.isPurchase == false) {
      _renttimeStarted();
    }
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        // My purchase/ Rent booking text
        widget.isPurchase ? AppStrings.myPurchase : AppStrings.rentBooking,
        titleSize: 15,
        backgroundColor: widget.isPurchase
            ? orderconfirmed
                ? AppColors.primary
                : AppColors.red
            : AppColors.orange,
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
                  color: widget.isPurchase
                      ? orderconfirmed
                          ? AppColors.primary
                          : AppColors.red
                      : AppColors.orange,
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
                  //Order/Booking Confirmed text
                  CustomText(
                    size: 20,
                    bold: true,
                    textKey: widget.isPurchase
                        ? orderconfirmed
                            ? '✅ ${AppStrings.orderConfirmed.toUpperCase()}'
                            : "❌CANCELLATION REQUEST SENT"
                        : '✅ ${AppStrings.bookingConfirmed.toUpperCase()}',
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

                  10.heightBox,

                  // direction button
                  TextButton(
                          onPressed: () {navigateToPageWithoutReplaceMent(DirectionPage());},
                          child: CustomText(
                            textKey: widget.isPurchase
                                ? _purchaseOrderList[0].delivery
                                    ? AppStrings.trackYourOrder
                                    : AppStrings.directions
                                : AppStrings.pickupDirections,
                            color: AppColors.white,
                          ))
                      .w(width)
                      .h(height * 0.05)
                      .color(widget.isPurchase
                          ? AppColors.primary
                          : AppColors.orange)
                      .cornerRadius(5),

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
                        textKey: widget.isPurchase
                            ? AppStrings
                                .startDirectionWhenNeededToPickupProductFromStore
                            : AppStrings.directionWillBeShownAfterApproval,
                      )
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
                        onPressed: () {
                          if (widget.isPurchase) {
                            _cancelorderconfirmation();
                          }
                        },
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
                              .cancelOrEditDetailsWithin5MinOfPlacingOrder)
                    ],
                  ),

                  // some spacing
                  10.heightBox,

                  //order summary text
                  CustomText(
                    size: 15,
                    textKey: AppStrings.orderSummary,
                    bold: true,
                  ),

                  // order summary card
                  if (widget.isPurchase)
                    purchaseOrderSummaryCard(
                      purchaseOrderModelList: _purchaseOrderList,
                      orderPlacedDate:
                          "14 June, 2023", //TODO: need to add to model
                    ).cornerRadius(10),
                  if (!widget.isPurchase)
                    rentalOrderSummaryCard(
                      orderPlacedDate:
                          "14 June, 2023", //TODO: need to add to model
                      rentalOrderModelList: _rentalOrderList,
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
                          paymentMode: widget.isPurchase
                              ? widget.purchaseOrderModel.modeofPayment
                              : _rentalOrderList[0]
                                  .modeofPayment) // TODO: To be passed through UI
                    ],
                  ).p(10).w(width).color(AppColors.white).cornerRadius(10),

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
                      value: widget.isPurchase
                          ? _purchaseStoreList[0].address
                          : _rentalStoreList[0].address),

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
                      value: widget.isPurchase
                          ? _purchaseStoreList[0].contact
                          : _rentalStoreList[0].contact),

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
                      ).p(5).w(width).box.make().color(AppColors.grayLight).p(8)
                    ],
                  ).w(width).color(AppColors.white).cornerRadius(10),
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
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
                ),
                label: CustomText(
                  size: 10,
                  textKey: AppStrings.call,
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
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
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
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

  Widget rentalOrderSummaryCard(
      {required String orderPlacedDate,
      required List<RentalOrderModel> rentalOrderModelList}) {
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
              textKey: rentalOrderModelList[0].delivery
                  ? ' ${AppStrings.deliveryOrder} '
                  : ' ${AppStrings.pickupOrder} ',
              size: 10,
            ).box.make().color(AppColors.orange).cornerRadius(5)
          ],
        ),

        10.heightBox,

        // No of items for rent
        CustomText(
            size: 10,
            color: AppColors.gray,
            textKey:
                '${rentalOrderModelList[0].products.length} ${AppStrings.itemsForRent}'),

        // some spacing
        10.heightBox,

        // product info
        ListView.builder(
            itemCount: rentalOrderModelList[0].products.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  // image
                  Image.asset(rentalOrderModelList[0].products[index].image)
                      .p(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // product name
                          CustomText(
                              size: 10,
                              color: AppColors.gray,
                              textKey:
                                  rentalOrderModelList[0].products[index].name),

                          // price
                          CustomText(
                              size: 10,
                              bold: true,
                              textKey:
                                  '\$${rentalOrderModelList[0].products[index].amount}'),
                        ],
                      ).w(width * 0.6),

                      // rent duration text
                      CustomText(
                          size: 10,
                          color: AppColors.gray,
                          textKey: AppStrings.rentDuration),

                      // pickup/dropoff date/time text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // pickup date/time text
                          CustomText(
                              size: 10,
                              color: AppColors.gray,
                              textKey: AppStrings.pickupDate.toUpperCase()),

                          // forward arrow icon
                          Icon(
                            Icons.arrow_forward_sharp,
                            color: AppColors.gray,
                          ),

                          // dropoff date/time text
                          CustomText(
                              color: AppColors.gray,
                              size: 10,
                              textKey:
                                  AppStrings.dropoffDateTime.toUpperCase()),
                        ],
                      ).w(width * 0.6),

                      // pickup/dropoff date/time value
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // pickup date/time text
                          CustomText(
                              size: 10,
                              color: AppColors.orange,
                              textKey: DateFormat('d MMMM, y').format(
                                  rentalOrderModelList[0].pickupDateTime)),

                          // dropoff date/time text
                          CustomText(
                              color: AppColors.orange,
                              size: 10,
                              textKey: DateFormat('d MMMM, y').format(
                                  rentalOrderModelList[0].dropoffDateTime)),
                        ],
                      ).w(width * 0.6),
                    ],
                  ),
                ],
              );
            }).w(width).h(height * 0.2)
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

  void _cancelorderconfirmation() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // order cancellation text
              CustomText(
                bold: true,
                color: AppColors.orange,
                textKey: '${AppStrings.orderCancellation.toUpperCase()} ?',
              ),

              //some spacing
              20.heightBox,

              // order cancellation message
              CustomText(
                textKey: '${AppStrings.areYouSureYouWantToCancelOrder} ?',
              ),

              //some spacing
              20.heightBox,

              // back yes button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // back button
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            WidgetStateProperty.all(Size(width * 0.45, 50)),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.white,
                        )),
                    onPressed: () {},
                    child: CustomText(
                      size: 10,
                      color: AppColors.invert,
                      textKey: AppStrings.back,
                    ),
                  ),

                  // yes button
                  ElevatedButton(
                    style: ButtonStyle(
                        fixedSize:
                            WidgetStateProperty.all(Size(width * 0.45, 50)),
                        shape: WidgetStateProperty.all(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.pinkLight,
                        )),
                    onPressed: () {
                      _givereason();
                    },
                    child: CustomText(
                      size: 10,
                      textKey: AppStrings.yes,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),

              //some spacing
              10.heightBox,
            ],
          ).w(width).p(10);
        });
  }

  void _givereason() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              CustomText(
                textKey: "Let us Know the Reason for Order Cancellation",
                size: 16,
              ),
              10.heightBox,
              SizedBox(
                child: TextField(
                  controller: cancellationReasonController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.gray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.gray), //<-- SEE HERE
                    ),
                    hintText: 'Write Here',
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1, // <-- SEE HERE
                  maxLines: 5, // <-- SEE HERE
                ),
              ),
              10.heightBox,
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize:
                        WidgetStateProperty.all(Size(width * 0.95, 40)),
                    shape: WidgetStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.red,
                    )),
                onPressed: () {
                  _purchaseOrderList[0].status = "cancellation request sent";
                  setState(() {
                    orderconfirmed = false;
                  });
                  updateProgressState();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(''),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              ImageRoutes.ordercancellationimage,
                              height: 100,
                              width: 100,
                            ), // Replace with your image path
                            SizedBox(height: 25.0),
                            Text(
                              'CANCELLATION REQUEST SENT',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.red),
                            ),
                          ],
                        ),
                        actions: [],
                      );
                    },
                  );
                },
                child: CustomText(
                  size: 10,
                  textKey: "Send Cancellation Request",
                  color: AppColors.white,
                ),
              ),
            ],
          ).hPCT(context: context, heightPCT: 20).p(10);
        });
  }
}
