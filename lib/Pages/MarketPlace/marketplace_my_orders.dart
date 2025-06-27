import 'package:dotted_border/dotted_border.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../Widgets/classes/style_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';

class MarketPlaceMyOrders extends BaseScreen {
  final bool isPurchase;
  const MarketPlaceMyOrders({super.key, required this.isPurchase});

  @override
  BaseScreenState<MarketPlaceMyOrders> createState() =>
      _MarketPlaceMyOrdersState();
}

class _MarketPlaceMyOrdersState extends BaseScreenState<MarketPlaceMyOrders> {
  final List<StoreModel> _purchaseStoreList =
      StoreHelper.store.purchaseStoreList;
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<PurchaseOrderModel> _purchaseOrderList =
      StoreHelper.store.purchaseOrderList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly(
        // My Purchase/ My Rent bookings text
        widget.isPurchase ? AppStrings.myPurchase : AppStrings.myRentBookings,
        titleSize: 15,
        toolbarHeight: 25,
        iconData: Icons.arrow_back,
        iconSize: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // horizontal grey divider
            VxDivider(
              width: 10,
              type: VxDividerType.horizontal,
              color: AppColors.grayLight,
            ),

            // current purchase/booking
            CustomText(
              textKey: widget.isPurchase
                  ? AppStrings.currentPurchase
                  : AppStrings.currentBookings,
              color: widget.isPurchase ? AppColors.primary : AppColors.orange,
            ).p(10),

            //order card
            // for purchase
            if (widget.isPurchase)
              if (_purchaseOrderList[0].status == "pending confirmation")
                purchaseOrderCard(
                  isHistory: false,
                  storeModel: _purchaseStoreList[0],
                  purchaseOrderModel: _purchaseOrderList[0],
                ).p(5).color(AppColors.greenLight).cornerRadius(10).p(10)
              else if (_purchaseOrderList[0].status == "order confirmed")
                purchaseOrderCard(
                  isHistory: false,
                  storeModel: _purchaseStoreList[0],
                  purchaseOrderModel: _purchaseOrderList[0],
                ).p(5).color(AppColors.primary).cornerRadius(10).p(10)
              else if (_purchaseOrderList[0].status ==
                  "cancellation request sent")
                purchaseOrderCard(
                  isHistory: false,
                  storeModel: _purchaseStoreList[0],
                  purchaseOrderModel: _purchaseOrderList[0],
                ).p(5).color(AppColors.lightpink).cornerRadius(10).p(10)
              else if (_purchaseOrderList[0].status ==
                  "cancellation request approved")
                purchaseOrderCard(
                  isHistory: false,
                  storeModel: _purchaseStoreList[0],
                  purchaseOrderModel: _purchaseOrderList[0],
                ).p(5).color(AppColors.red).cornerRadius(10).p(10),

            // for rental
            if (!widget.isPurchase)
              if (_rentalOrderList[0].status == "pending confirmation")
                rentalOrderCard(
                  isHistory: false,
                  storeModel: _rentalStoreList[0],
                  rentalOrderModel: _rentalOrderList[0],
                ).p(5).color(AppColors.orange).cornerRadius(10).p(10)
              else if (_rentalOrderList[0].status == "ready for pickup" ||
                  _rentalOrderList[0].status == "delivered")
                rentalOrderCard(
                  isHistory: false,
                  storeModel: _rentalStoreList[0],
                  rentalOrderModel: _rentalOrderList[0],
                ).p(5).color(AppColors.lightpink).cornerRadius(10).p(10)
              else if (_rentalOrderList[0].status == "ongoing")
                rentalOrderCard(
                  isHistory: false,
                  storeModel: _rentalStoreList[0],
                  rentalOrderModel: _rentalOrderList[0],
                ).p(5).color(AppColors.rentalPrimary).cornerRadius(10).p(10),

            // some spacing
            5.heightBox,

            // horizontal grey divider
            VxDivider(
              width: 10,
              type: VxDividerType.horizontal,
              color: AppColors.grayLight,
            ),

            // some spacing
            5.heightBox,

            // purchase/rent history
            CustomText(
              size: 18,
              textKey: widget.isPurchase
                  ? AppStrings.purchaseHistory
                  : AppStrings.rentHistory,
              color: AppColors.gray,
            ).p(10),

            // history list view
            DottedBorder(
              child: ListView.builder(
                  itemCount: widget.isPurchase
                      ? _purchaseOrderList[0]
                          .products
                          .length // TODO: history model needs to be added in model
                      : _rentalOrderList[0].products.length,
                  itemBuilder: (context, index) {
                    return widget.isPurchase
                        ? Column(
                            children: [
                              purchaseOrderCard(
                                isHistory: true,
                                storeModel: _purchaseStoreList[0],
                                purchaseOrderModel: _purchaseOrderList[0],
                              )
                                  .p(5)
                                  .color(AppColors.grayLight)
                                  .cornerRadius(10),

                              5.heightBox,

                              // rate your experience

                              Row(
                                children: [
                                  // rate your experience text
                                  CustomText(
                                      size: 10,
                                      color: AppColors.primary,
                                      textKey: AppStrings.rateYourExperience),

                                  // forward arrow icon
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ).color(AppColors.grayLight),
                              5.heightBox,
                            ],
                          )
                        : Column(
                            children: [
                              rentalOrderCard(
                                isHistory: true,
                                storeModel: _rentalStoreList[0],
                                rentalOrderModel: _rentalOrderList[0],
                              )
                                  .p(5)
                                  .color(AppColors.grayLight)
                                  .cornerRadius(10),

                              // rate your experience

                              Row(
                                children: [
                                  // rate your experience text
                                  CustomText(
                                      size: 10,
                                      color: AppColors.orange,
                                      textKey: AppStrings.rateYourExperience),

                                  // forward arrow icon
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: AppColors.orange,
                                  ),
                                ],
                              ),
                              5.heightBox,
                            ],
                          );
                  }).h(height * 0.5),
            ).pSymmetric(h: 10)
          ],
        ),
      ),
    );
  }

  Widget purchaseOrderCard({
    required bool isHistory,
    required StoreModel storeModel,
    required PurchaseOrderModel purchaseOrderModel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // row contain order id, ready for pickup and for puchase
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // order id text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.invert : AppColors.white,
              textKey:
                  '${AppStrings.orderID}: ', //TODO: need to be added in model
            ),

            //  ready for pickup text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.invert : AppColors.primary,
              textKey: isHistory
                  ? ' ✅ ${AppStrings.pickedUp} '
                  : ' ${AppStrings.readyForPickup} ',
            )
                .box
                .make()
                .color(isHistory ? AppColors.gray : AppColors.white)
                .cornerRadius(10),

            // for puchase text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.primary : AppColors.white,
              textKey: AppStrings.forPurchase.toUpperCase(),
            ),
          ],
        ),

        // some spacing
        15.heightBox,

        // Row contain store name and order confirmed
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // store name
            CustomText(
              bold: true,
              color: isHistory ? AppColors.primary : AppColors.white,
              textKey: isHistory
                  ? storeModel.name
                  : '${storeModel.name}  🚲 ${AppStrings.min}',
            ),

            // order confirmed
            isHistory
                ? Container()
                : CustomText(
                    size: 10,
                    textKey: '✅ ${AppStrings.orderConfirmed.toUpperCase()}',
                    color: AppColors.white,
                  ),
          ],
        ),

        // some spacing
        15.heightBox,

        // no. of product purchase and name of product
        CustomText(
          size: 10,
          color: isHistory ? AppColors.gray : AppColors.white,
          textKey: isHistory
              ? purchaseOrderModel.products[0].name
              : '${purchaseOrderModel.products.length} ${AppStrings.itemsPurchase}',
        ),

        // images
        Row(
          children: [
            for (int i = 0; i < purchaseOrderModel.products.length; i++)
              Image.asset(
                purchaseOrderModel.products[i].image,
                width: 80,
                height: 80,
              ).p2().box.make().color(AppColors.white).cornerRadius(10).p(5),
          ],
        ),

        // Row containing order placed on and
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // order placed on
            CustomText(
              size: 10,
              color: isHistory ? AppColors.gray : AppColors.white,
              textKey: isHistory
                  ? '${AppStrings.pickedUpOn}: '
                  : '${AppStrings.orderPlacedOn}: ', //TODO: need to be added in model
            ),

            if (isHistory)
              // buy again order
              CustomText(
                color: AppColors.orange,
                textKey: AppStrings.buyAgain,
              ),

            // view order
            CustomText(
              color: isHistory ? AppColors.primary : AppColors.white,
              textKey: AppStrings.viewOrder.upperCamelCase,
            ),
          ],
        ),
      ],
    );
  }

  Widget rentalOrderCard({
    required bool isHistory,
    required StoreModel storeModel,
    required RentalOrderModel rentalOrderModel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // row contain order id, ready for pickup and for puchase
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // order id text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.invert : AppColors.white,
              textKey:
                  '${AppStrings.orderID}: ', //TODO: need to be added in model
            ),

            //  ongoing text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.white : AppColors.orange,
              textKey: isHistory
                  ? ' ${AppStrings.rentEnded} '
                  : ' ✅ ${AppStrings.ongoing} ',
            )
                .box
                .make()
                .color(isHistory ? AppColors.gray : AppColors.white)
                .cornerRadius(10),

            // for rent text
            CustomText(
              size: 10,
              color: isHistory ? AppColors.orange : AppColors.white,
              textKey: AppStrings.forRent.toUpperCase(),
            ),
          ],
        ),

        // some spacing
        15.heightBox,

        // Row contain store name and days left
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // store name
            CustomText(
              bold: true,
              color: isHistory ? AppColors.orange : AppColors.white,
              textKey: isHistory
                  ? storeModel.name
                  : '${storeModel.name}  🚲 ${AppStrings.min}',
            ),

            // days left text
            isHistory
                ? Container()
                : CustomText(
                    bold: true,
                    size: 10,
                    textKey:
                        ' ${AppStrings.daysLeft} ', //TODO: need to be added in model
                    color: AppColors.orange,
                  ).box.make().color(AppColors.white).cornerRadius(10),
          ],
        ),

        // some spacing
        15.heightBox,

        // no. of product purchase
        CustomText(
          size: 10,
          color: isHistory ? AppColors.gray : AppColors.white,
          textKey:
              '${rentalOrderModel.products.length} ${AppStrings.itemForRent}',
        ),

        // images and product pickup/ dropoff info
        Row(
          children: [
            // image
            Image.asset(rentalOrderModel.products[0].image).p(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // product name
                CustomText(
                    size: 10,
                    color: isHistory ? AppColors.invert : AppColors.white,
                    textKey: rentalOrderModel.products[0].name),

                //  ongoing rent duration text
                CustomText(
                    size: 10,
                    color: isHistory ? AppColors.gray : AppColors.white,
                    textKey: isHistory
                        ? AppStrings.rentDuration
                        : '${AppStrings.ongoing} ${AppStrings.rentDuration}'),

                // pickup/dropoff date/time text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // pickup date/time text
                    CustomText(
                        size: 10,
                        color: isHistory ? AppColors.invert : AppColors.white,
                        textKey: AppStrings.pickupDate.toUpperCase()),

                    // forward arrow icon
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: isHistory ? AppColors.gray : AppColors.white,
                    ),

                    // dropoff date/time text
                    CustomText(
                        color: isHistory ? AppColors.invert : AppColors.white,
                        size: 10,
                        textKey: AppStrings.dropoffDateTime.toUpperCase()),
                  ],
                ).w(width * 0.6),

                // pickup/dropoff date/time value
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // pickup date/time text
                    CustomText(
                        size: 10,
                        color: isHistory ? AppColors.gray : AppColors.white,
                        textKey: DateFormat('d MMMM, y')
                            .format(rentalOrderModel.pickupDateTime)),

                    // dropoff date/time text
                    CustomText(
                        color: isHistory ? AppColors.gray : AppColors.white,
                        size: 10,
                        textKey: DateFormat('d MMMM, y')
                            .format(rentalOrderModel.dropoffDateTime)),
                  ],
                ).w(width * 0.6),
              ],
            ),
          ],
        ),

        // Row containing order placed on and
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // rent placed/ completed on
            CustomText(
              size: 10,
              color: isHistory ? AppColors.gray : AppColors.white,
              textKey: isHistory
                  ? '${AppStrings.rentCompletedOn}: '
                  : '${AppStrings.rentPlacedOn}: ', //TODO: need to be added in model
            ),

            // view order
            CustomText(
              color: isHistory ? AppColors.orange : AppColors.white,
              textKey: AppStrings.viewBooking.upperCamelCase,
            )
          ],
        ),
      ],
    );
  }
}
