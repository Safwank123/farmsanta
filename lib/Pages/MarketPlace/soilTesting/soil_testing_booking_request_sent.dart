
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../base_screen.dart';


class SoilTestingBookingRequestSent extends BaseScreen {
  const SoilTestingBookingRequestSent({super.key});

  @override
  BaseScreenState<SoilTestingBookingRequestSent> createState() => _SoilTestingBookingRequestSentState();
}

class _SoilTestingBookingRequestSentState extends BaseScreenState<SoilTestingBookingRequestSent> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.soilTestPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          Image.asset( ImageRoutes.soilTestingClock, height: 200, width: 200,),

          20.heightBox,
          // Request sent text
          CustomText(
              size: 18,
              color: AppColors.white,
              bold: true,
              textKey: "Booking Request Sent"),

          // some spacing
          20.heightBox,

          // request sent messsage text
          CustomText(
              textAlign: TextAlign.center,
              color: AppColors.white,
              textKey: "Your Request for booking is successfully send to the Lab . Booking Approval will be Notified ")
              .pSymmetric(h: 25),

          20.heightBox,

          CustomText(
              textAlign: TextAlign.center,
              color: AppColors.white,
              textKey: "Pay once Booking Is Confirmed")
              .pSymmetric(h: 25),


          (height * 0.15).heightBox,

          // buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // back home button
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CustomText(
                    color: AppColors.soilTestPrimary,
                    textKey: '  ${AppStrings.backHome}  ',
                  )).color(AppColors.white).cornerRadius(25),

              // view order/booking button
              TextButton(
                  onPressed: () {},
                  child: CustomText(
                    color: AppColors.soilTestPrimary,
                    textKey: AppStrings.viewBooking,
                  )).color(AppColors.white).cornerRadius(25)
            ],
          ).pSymmetric(h: 30)
        ],
      ).centered().p(10),
    );
  }
}



