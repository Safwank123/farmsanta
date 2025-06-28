import 'package:dotted_border/dotted_border.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/MarketPlace/SoilTesting/lab_model.dart';
import 'package:farmsanta_new/Pages/MarketPlace/soilTesting/soil_testing_lab.dart';

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Models/MarketPlace/SoilTesting/soil_test_booking_model.dart';
import '../../../Models/MarketPlace/category_model.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class SoilTestingHome extends BaseScreen {
  final LabModel labmodel;
  final SoilTestBookingModel booking;
  const SoilTestingHome( {super.key, required this.labmodel, required this.booking,});

  @override
  BaseScreenState<SoilTestingHome> createState() => _SoilTestingHomeState();
}

TextEditingController searchTextEditingController = TextEditingController();

class _SoilTestingHomeState extends BaseScreenState<SoilTestingHome> {
  bool isSelfSoilCollection = false;
  List category = ["Sort By", "Filters", "Price", "Rating", "Distance"];

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      // Expanded App Bar
      SliverAppBar(
        // App Bar background color
        backgroundColor: AppColors.soilTestPrimary,

        // App Bar text
        title: CustomText(
          textKey: AppStrings.soilTesting,
          color: AppColors.white,
        ),

        pinned: true,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, height * 0.15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar with icon
              Row(children: [
                CustomInputField(
                  textEditingController: searchTextEditingController,
                  prefixWidget: Icon(
                    MaterialSymbols.search,
                    color: AppThemeColors.getColor(
                        AppThemeColorsEnum.textColorTextField),
                  ),
                  hint: AppStrings.searchProductsForRent,
                ).w(width * 0.77).h(height * 0.05),
                5.widthBox,

                //Save Icon
                CircleAvatar(
                  backgroundColor: AppColors.textFieldBackground,
                  child: Icon(
                    Icons.bookmark_border,
                    color: AppColors.soilTestPrimary,
                  ),
                )
              ]).pSymmetric(h: 15).w(width),

              //some spacing
              5.heightBox,

              //select soil Collection type text
              CustomText(
                textKey: AppStrings.selectSoilCollectionType,
                color: AppColors.white,
                size: 5,
              ).pSymmetric(h: 15),

              // checkbox
              Row(
                children: [
                  // checkbox
                  Checkbox(
                      activeColor: AppColors.red,
                      value: !isSelfSoilCollection,
                      onChanged: ((bool? value) {
                        setState(() {
                          isSelfSoilCollection = !value!;
                          widget.booking.isSelfSoilCollection = isSelfSoilCollection;
                        });
                      })),

                  // selfsoil Collection text
                  CustomText(
                    textKey: AppStrings.selfSoilCollection,
                    color: AppColors.white,
                  ),

                  //checkbox
                  Checkbox(
                      activeColor: AppColors.red,
                      value: isSelfSoilCollection,
                      onChanged: ((bool? value) {
                        setState(() {
                          isSelfSoilCollection = value!;
                          widget.booking.isSelfSoilCollection = isSelfSoilCollection;
                        });
                      })),

                  // by Lab Expertf text
                  CustomText(
                    textKey: AppStrings.byLabExpert,
                    color: AppColors.white,
                  )
                ],
              ),

              //add farm location
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.white,
                  ),
                  CustomText(
                    textKey: AppStrings.addressText,
                    color: AppColors.white,
                  ),
                ],
              )
                  .p4()
                  .box
                  .make()
                  .color(AppColors.LightsoilTestPrimary)
                  .cornerRadius(5)
                  .pSymmetric(h: 20)
                  .onTap(() {_confirmFarmLocation();}),
            ],
          ).h(height * 0.18),
        ),
      ),

      //4 star rated labs horizontal list
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //offer Zone tag
            CustomText(
              textKey: "🎁 ${AppStrings.offerZone}",
              color: AppColors.white,
            ).p(6).box.make().color(AppColors.soilTestPrimary).cornerRadius(15),

 
            //4 star rated text
            10.heightBox,
            CustomText(textKey: '⭐ ${AppStrings.fourstarRatedLab}'),
 

            // list of labs
            5.heightBox,
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < labModel.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sellerStoreCard(
                        image: widget.labmodel.image,
                        rating: widget.labmodel.rating,
                        noOfReviewsInK: widget.labmodel.reviewModel.length,
                        storeName: widget.labmodel.name,
                        address: widget.labmodel.address,
                      ).w(width * 0.45).pSymmetric(h: 4),

                      7.heightBox,

                      //Book soil testing button
                      TextButton(
                              onPressed: () { navigateToPageReplaceMent(SoilTestingLab());},
                              child: CustomText(
                                textKey: AppStrings.bookSoilTesting,
                                color: AppColors.white,
                              ))
                          .h(height * 0.04)
                          .w(width * 0.45)
                          .color(AppColors.soilTestPrimary)
                          .cornerRadius(5)
                    ],
                  )
              ],
            ).h(height * 0.35),
          ],
        ).p(10).color(AppColors.grayLight),
      ),

      // Explore all stores
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textKey: "${AppStrings.exploreAllLabs} (12)",
              color: AppColors.black,
            ),
            10.heightBox,

            // sort by options
            Row(
              children: [
                for (int i = 0; i < category.length; i++)
                  chip(text: category[i]) // TODO: To be changed
                      .scale(scaleValue: 1.1)
                      .p(5),
              ],
            ),

            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return storeInfoCard(
                  image: widget.labmodel.image,
                  rating: widget.labmodel.rating,
                  address: widget.labmodel.name,
                  storeName: widget.labmodel.address,
                ).pOnly(bottom: 5);
              },
            ).h(height * 0.3)
          ],
        ).p(6).color(AppColors.grayLight),
      ),
    ]));
  }

  Widget sellerStoreCard({
    required String image,
    required double rating,
    required int noOfReviewsInK,
    required String storeName,
    required String address,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //image
        Stack(
          children: [
            Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
            // Image.asset(image,height: 150, width: 180,),

            // rating and reviews tag
            Positioned(
                right: 2,
                bottom: 2,
                child: WidgetHelper.ratingReviewTag(
                        rating: rating, noOfReviewsInK: noOfReviewsInK)
                    .color(AppColors.white)
                    .cornerRadius(15))
          ],
        ),

        5.heightBox,

        // store name with icon
        storeNameAndIcon(storeName: storeName),

        10.heightBox,
        // store address with icon
        titleIconRowWidget(
            icon: Icon(
              Icons.location_on,
              size: 15,
              color: AppColors.soilTestPrimary,
            ),
            title: address),

        //soil collection date
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              textKey: "${AppStrings.soilCollection.toUpperCase()}: ",
              color: AppColors.gray,
              size: 1,
            ),
            CustomText(
              textKey: "13 May",
              color: AppColors.soilTestPrimary,
              size: 1,
            ),
          ],
        ).scale(scaleValue: 0.8, alignment: Alignment.centerLeft),

        //report date
        Row(
          children: [
            CustomText(
              textKey: "${AppStrings.report.toUpperCase()}: ",
              color: AppColors.gray,
              size: 8,
            ),
            CustomText(
              textKey: "${widget.labmodel.reportingDays} Working Days",
              color: AppColors.soilTestPrimary,
              size: 8,
            ),
          ],
        ).scale(scaleValue: 0.8, alignment: Alignment.centerLeft),
      ],
    ).p2().color(AppColors.white).cornerRadius(5);
  }

  Widget chip({required String text}) {
    return Container(
      height: 22,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(15)),
      child: CustomText(
        textKey: text,
        color: AppColors.black,
      ).scale(scaleValue: 0.8).p(2),
    );
  }

  Widget storeNameAndIcon(
      {required String storeName, Color? storeNameColor, bool? isBold}) {
    return Row(
      children: [
        // image icon
        Image.asset(ImageRoutes.rentalStoreIcon),
        5.widthBox,

        // store name
        CustomText(
          textKey: storeName,
          size: 10,
          color: storeNameColor ?? AppColors.gray,
          bold: isBold ?? true,
        )
      ],
    );
  }

  // title icon widget in row fashion
  Widget titleIconRowWidget(
      {required Icon icon, required String title, Color? titleColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // icon
        icon,
        5.widthBox,

        // store name
        CustomText(
          textKey: title,
          size: 10,
          color: titleColor ?? AppColors.soilTestPrimary,
        )
      ],
    );
  }

  // store info card widget with image, storename, ratingreviewtag, address, noOfproducts and categories
  Widget storeInfoCard({
    required String image,
    required String storeName,
    required String address,
    required double rating,
  }) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      child: Row(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(image),
                width: 0.20 * width,
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: WidgetHelper.ratingReviewTag(rating: rating)
                      .color(AppColors.white)
                      .cornerRadius(15)),
            ],
          ).p4(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(textKey: "Soil Testing Lab"),
                  CustomText(textKey: "Nearest")
                ],
              ).scale(scaleValue: 0.8, alignment: Alignment.centerLeft),
              titleIconRowWidget(
                  titleColor: AppColors.gray,
                  icon: Icon(
                    Icons.location_on,
                    size: 15,
                    color: AppColors.soilTestPrimary,
                  ),
                  title: address),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: "Soil Collection".toUpperCase(),
                    size: 10,
                    color: AppColors.gray,
                  ),
                  10.widthBox,
                  CustomText(
                    textKey: "Soil Test Report".toUpperCase(),
                    size: 10,
                    color: AppColors.gray,
                  ),
                ],
              ).scale(scaleValue: 0.8, alignment: Alignment.centerLeft),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: "13 May, 2023",
                    color: AppColors.soilTestPrimary,
                  ),
                  10.widthBox,
                  CustomText(
                    textKey: "2-3 Working Days",
                    color: AppColors.soilTestPrimary,
                  ),
                ],
              ).scale(scaleValue: 0.8, alignment: Alignment.centerLeft),
            ],
          ).p4()
        ],
      ).color(AppColors.white).cornerRadius(10),
    );
  }

  void _confirmFarmLocation() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                textKey: "Confirm Farm Location",
                size: 16,
                color: AppColors.soilTestPrimary,
              ),
              10.heightBox,

              // select farm location message
              Row(
                children: [
                  Icon(
                    size: 15,
                    Icons.info_outlined,
                    color: AppColors.soilTestPrimary,
                  ),
                  5.widthBox,
                  CustomText(
                    color: AppColors.gray,
                    size: 10,
                    textKey: "Select Farm Location for soil Testing ",
                  )
                ],
              ),

              10.heightBox,

              //selected farm
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    textKey: "✅farm".toUpperCase(),
                    color: AppColors.soilTestPrimary,
                    bold: true,
                    size: 14,
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        textKey: "#3 Farm no.",
                      ),
                      CustomText(
                        textKey: "Village Name, Street Address",
                      ),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        textKey: "State, City",
                      ),
                      CustomText(
                        textKey: "Pincode",
                      ),
                    ],
                  ),
                ],
              ).p12().box.make().color(AppColors.lightpink).cornerRadius(10),

              10.heightBox,

              CustomText(
                textKey: "Confirm Farm Location",
                size: 16,
                color: AppColors.soilTestPrimary,
              ),
              10.heightBox,

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 2; i++)
                      Container(
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textKey: "farm".toUpperCase(),
                                color: AppColors.soilTestPrimary,
                                size: 16,
                                bold: true,
                              ).p4(),
                              CustomText(textKey: "#350 Farm No.").p4(),
                              CustomText(
                                      textKey: "Village Name, Street Address")
                                  .p4(),
                              CustomText(textKey: "State, City").p4(),
                              CustomText(textKey: "Pincode").p4(),
                            ],
                          ).p4()),
                    DottedBorder(
                        child: Center(
                      child: CustomText(
                        textKey: "+ Add New Farm",
                        color: AppColors.soilTestPrimary,
                      ),
                    )).wh(160, 160).p4(),
                  ],
                ),
              ),

              20.heightBox,

              //confirm farm location button
              TextButton(
                      onPressed: () {},
                      child: CustomText(
                        textKey: "Confirm Farm Location",
                        color: AppColors.white,
                      ))
                  .h(height * 0.04)
                  .w(width * 0.45)
                  .color(AppColors.soilTestPrimary)
                  .cornerRadius(5),
            ],
          ).p16();
        });
  }
}
