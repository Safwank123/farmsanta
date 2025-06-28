
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../../Models/MarketPlace/store_model.dart';
import '../../../Routes/image_routes.dart';
import '../../../Services/store_helper.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/app_bar.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class RentOrderPicked extends BaseScreen {
  bool isPurchase;
  RentOrderPicked({super.key, required this.isPurchase});

  @override
  BaseScreenState<RentOrderPicked> createState() => _RentOrderPickedState();
}

class _RentOrderPickedState extends BaseScreenState<RentOrderPicked> {
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<PurchaseOrderModel> _purchaseOrderList =
      StoreHelper.store.purchaseOrderList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        // My purchase/ Rent booking text
        AppStrings.rentBooking,
        titleSize: 15,
        backgroundColor: AppColors.orange,
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
                  color: AppColors.orange,
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
                    textKey: '✅ ORDER PICKED',
                    color: AppColors.white,
                  ),

                  // Order status/ product name text
                  CustomText(
                    size: 18,
                    textKey:
                        "${rentalStoreList[0].categories[0].name.toUpperCase()} FOR RENT",
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
                          .opacity(value: 0.5)
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
                          .opacity(value: 0.5)
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
}
