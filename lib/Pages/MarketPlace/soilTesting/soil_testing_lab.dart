
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/MarketPlace/soilTesting/soil_testing_booking_request.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:flutter/material.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../base_screen.dart';
import '../product_detail_page.dart';
import 'lab_test_detail_page.dart';


class SoilTestingLab extends BaseScreen {

  const SoilTestingLab({Key? key}) : super(key: key);

  @override
  BaseScreenState<SoilTestingLab> createState() => _SoilTestingLabState();
}

class _SoilTestingLabState extends BaseScreenState<SoilTestingLab> {

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      //TODO: change need in appbar
      appBar: AppBarDesigns.getAppTitleOnly("title"),

      body: Column(
        children: [
          Column(
            children: [
              Card(
                color: AppColors.white,
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Image(image: AssetImage(ImageRoutes.labImage2),width: 0.17*width,).p2(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(textKey: "Soil Testing Lab"),
                        10.heightBox,
                        WidgetHelper.ratingReviewTag(rating: 4.5, noOfReviewsInK: 12),
                        10.heightBox,
                        titleIconRowWidget(
                            titleColor: AppColors.gray,
                            icon: Icon(
                              Icons.location_on,
                              size: 15,
                              color: AppColors.soilTestPrimary,
                            ),
                            title: "Village Market Road"),
                      ],
                    ).p4(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.textFieldBackground,
                          child: Icon(
                            Icons.bookmark_border,
                            color:AppColors.soilTestPrimary,
                          ),
                        ).scale(scaleValue: 0.7, alignment: Alignment.centerRight),

                        Column(
                          children:[
                            CustomText(textKey: "5" + AppStrings.kmaway, color: AppColors.white,).p(3).box.make().color(AppColors.soilTestPrimary).cornerRadius(5).centered(),
                            CustomText(textKey: AppStrings.fromyourlocation, color: AppColors.gray, style: const TextStyle(fontSize: 1),).scale(scaleValue: 0.8)],
                        ).scale(scaleValue: 0.7, alignment: Alignment.centerRight)


                      ],
                    )

                  ],
                ).color(AppColors.white).cornerRadius(10),
              ),
              10.heightBox,
              Row(children: [
                CustomText(textKey: "Select Soil Collection Type: "),
                CustomText(textKey: "BY LAB EXPERT ".toUpperCase(), color: AppColors.soilTestPrimary, size: 16,),
              ],),
              10.heightBox,
              ListView(
                children: [
                  //list of stores
                  for (int i = 0; i < 1; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage(ImageRoutes.labImage2),width: 0.30*width,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(textKey: "Soil Testing Service",color: AppColors.soilTestPrimary, size: 16, bold: true,),
                            5.heightBox,
                            Row(
                              children: [
                                CustomText(textKey: "Price:" , color: AppColors.black,),
                                CustomText(textKey: "\$ 50/Sample" , color: AppColors.soilTestPrimary,)
                              ],
                            ),
                            5.heightBox,
                            CustomText(textKey: "Test Content : Ph Level, Minerals ...", color: AppColors.gray,),
                            5.heightBox,
                            CustomText(textKey: "Report  : 2 Days", color: AppColors.gray,),
                            5.heightBox,
                            //Book soil testing button
                            TextButton(
                                onPressed: () {
                                  _selectsamplenumber();
                                },
                                child: CustomText(
                                  textKey: "Send Booking Request",
                                  color: AppColors.white,
                                ))
                                .h(height * 0.04).w(width*0.50)
                                .color(AppColors.soilTestPrimary)
                                .cornerRadius(5),
                          ],
                        ).p2()
                      ],
                    ).p4().box.make().color(AppColors.grayLight).cornerRadius(10),

                ],
              ).h(height*0.7)
            ]
          ).px12()
        ],
      ),
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
          color:titleColor ?? AppColors.soilTestPrimary,
        )
      ],
    );
  }

  int item = 1;
  void _selectsamplenumber(){
    showModalBottomSheet(context: context, builder: (context){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(textKey: "No. of Samples (Min. 4 Samples for Expert Visit)", size: 16,),
          10.heightBox,

          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(color: AppColors.red, onPressed: () { setState(() {item--;}); }, icon: const Icon(Icons.remove),),
                CustomText(textKey: "$item", size: 20,),
                IconButton(color: AppColors.primary, onPressed: () { setState(() {item++;}); }, icon: const Icon(Icons.add),)
              ]
          ).box.make().color(AppColors.grayLight).cornerRadius(20),

          10.heightBox,
          TextButton(
              onPressed: () {
                _productdetailpage(context);
              },
              child: CustomText(
                textKey: "Send booking request",
                color: AppColors.white,
              ))
              .h(height * 0.04).w(width*0.50)
              .color(AppColors.soilTestPrimary)
              .cornerRadius(5),

        ],
      ).hPCT(context: context, heightPCT:18 ).p12().color(AppColors.white).cornerRadius(20);
    });
  }

  void _productdetailpage(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Column(
              children: [

                LabTestDetailPage().w(width).hPCT(context: context, heightPCT: 82),

                TextButton(
                    onPressed: () {
                      navigateToPageReplaceMent(SoilTestBookingRequest());
                    },
                    child: CustomText(
                  textKey: "Send Booking Request",
                  color: AppColors.white,
                )).w(width)
                    .h(height * 0.05)
                    .color(AppColors.soilTestPrimary)
                    .cornerRadius(5).p12(),
              ]

          ).w(width).hPCT(context: context, heightPCT: 90).cornerRadius(10);
        });
  }




}


