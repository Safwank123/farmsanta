import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../../Models/MarketPlace/store_model.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/app_bar.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class RentTimeStarted extends BaseScreen {
  const RentTimeStarted({super.key});

  @override
  BaseScreenState<RentTimeStarted> createState() => _RentTimeStartedState();
}

class _RentTimeStartedState extends BaseScreenState<RentTimeStarted> {
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly(
        // Rent booking text
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // status and rent id
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Order Picked text
                      CustomText(
                        size: 20,
                        bold: true,
                        textKey: '✅ ${AppStrings.orderPicked.toUpperCase()}',
                        color: AppColors.white,
                      ),

                      //Rent ID text
                      //TODO: To be added in model
                      CustomText(
                        textKey: AppStrings.rentID,
                        color: AppColors.white,
                      ),
                    ],
                  ),

                  // Order status/ product name text
                  CustomText(
                    size: 18,
                    textKey:
                        "${_rentalStoreList[0].categories[0].name.toUpperCase()} ${AppStrings.forRent.toUpperCase()}",
                    color: AppColors.white,
                  ),

                  //some spacing
                  10.heightBox,

                  // on going rent duration with hr left tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ongoing rent duration
                      CustomText(
                          color: AppColors.white,
                          textKey:
                              '${AppStrings.ongoingRentDuration} : ${_rentalOrderList[0].rentalDuration} ${_rentalOrderList[0].rentalDurationUnit}'),

                      // hrs left tag
                      CustomText(
                        size: 12,
                        color: AppColors.white,
                        textKey:
                            ' ${AppStrings.hrsLeft}', // TODO: To be added in model
                      )
                          .p(3)
                          .box
                          .make()
                          .color(AppColors.orangeLight)
                          .cornerRadius(15),
                    ],
                  ),

                  //some spacing
                  10.heightBox,

                  // pickup/dropoff date/time text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // pickup date/time text
                      CustomText(
                              size: 10,
                              color: AppColors.white,
                              textKey: '✅${AppStrings.pickedUp.toUpperCase()}')
                          .scale(scaleValue: 0.9),

                      // forward arrow image
                      Image.asset(ImageRoutes.longForwardArrow),

                      // dropoff date/time text
                      CustomText(
                              color: AppColors.white,
                              size: 10,
                              textKey: AppStrings.dropoffDateTime.toUpperCase())
                          .scale(scaleValue: 0.9),
                    ],
                  ).w(width),

                  //some spacing
                  5.heightBox,

                  // pickup/dropoff date/time value
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // pickup date/time text
                      CustomText(
                              size: 10,
                              color: AppColors.white,
                              textKey: DateFormat('d MMMM, y')
                                  .format(_rentalOrderList[0].pickupDateTime))
                          .scale(scaleValue: 0.9),

                      // dropoff date/time text
                      CustomText(
                              color: AppColors.white,
                              size: 10,
                              textKey: DateFormat('d MMMM, y')
                                  .format(_rentalOrderList[0].dropoffDateTime))
                          .scale(scaleValue: 0.9),
                    ],
                  ).w(width),

                  //some spacing
                  10.heightBox,

                  // for rental

                  // store order info card
                  storeOrderInfoCard(storeModel: _rentalStoreList[0]),

                  // some spacing
                  10.heightBox,

                  // map image
                  Image.asset(ImageRoutes.pickupMap).pSymmetric(h: 10),

                  // direction button
                  TextButton(
                          onPressed: () {},
                          child: CustomText(
                            textKey: AppStrings.dropoffDirection,
                            color: AppColors.white,
                          ))
                      .w(width)
                      .h(height * 0.05)
                      .color(AppColors.orange)
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
                          .opacity50()
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
                          .opacity50()
                          .cornerRadius(10),
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
                  color: AppColors.gray,
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
                  color: AppColors.gray,
                )).h(height * 0.05).color(AppColors.grayLight).cornerRadius(20),
          ],
        ),
      ],
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
              color: AppColors.orange,
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
              color: AppColors.orange,
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
          color: titleColor ?? AppColors.orange,
        )
      ],
    );
  }
}
