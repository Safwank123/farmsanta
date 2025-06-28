import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/style_helper.dart';
import '/Widgets/classes/widget_helper_class.dart';

class MarketPlaceCancellationApproved extends BaseScreen {
  final bool isPurchase;
  const MarketPlaceCancellationApproved({super.key, required this.isPurchase});

  @override
  BaseScreenState<MarketPlaceCancellationApproved> createState() =>
      _MarketPlaceCancellationApprovedState();
}

class _MarketPlaceCancellationApprovedState
    extends BaseScreenState<MarketPlaceCancellationApproved> {
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

  @override
  Widget buildWidget(BuildContext context) {
    _purchaseOrderList[0].status = "cancellation request approved";
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        // My purchase/ Rent booking text
        AppStrings.myPurchase,
        titleSize: 15,
        backgroundColor: AppColors.red,
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
                  color: AppColors.red,
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
                    textKey: "❌CANCELLATION APPROVED",
                    color: AppColors.white,
                  ),

                  10.heightBox,

                  // Order status/ product name text
                  CustomText(
                    size: 14,
                    textKey:
                        "Your Order Cancelation Request is accepted and your payment will be refund within 3 Days according to the Refund Policy ",
                    color: AppColors.white,
                  ),

                  // Order/Rent id text
                  CustomText(
                    size: 10,
                    textKey:
                        '${AppStrings.orderID}: ', // TODO: Need to add in model
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

                  // some spacing
                  10.heightBox,

                  // map image
                  Image(
                    image: AssetImage(ImageRoutes.pickupMap),
                    fit: BoxFit.fitWidth,
                  ),

                  10.heightBox,

                  // direction button
                  TextButton(
                          onPressed: () {},
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
                      .color(AppColors.lightpink)
                      .cornerRadius(5),

                  CustomText(
                    color: AppColors.black,
                    size: 12,
                    textKey: "For any Query connect with Seller",
                  ),
                  5.heightBox,

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
                  TextButton(
                          onPressed: () {},
                          child: CustomText(
                            textKey: "Order Cancelled",
                            color: AppColors.white,
                          ))
                      .w(width)
                      .h(height * 0.05)
                      .color(AppColors.red)
                      .cornerRadius(5),

                  TextButton(
                      onPressed: () {},
                      child: CustomText(
                        textKey: "View Refund Policy",
                        color: AppColors.red,
                      )),

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
                          paymentMode:
                              AppStrings.gPay) // TODO: To be passed through UI
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
}
