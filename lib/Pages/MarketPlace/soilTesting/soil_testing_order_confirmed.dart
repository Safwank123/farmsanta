
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';


import '../../base_screen.dart';

class SoilTestingOrderConfirmed extends BaseScreen {
  const SoilTestingOrderConfirmed({Key? key}) : super(key: key);

  @override
  BaseScreenState<SoilTestingOrderConfirmed> createState() => _SoilTestingOrderConfirmedState();
}

class _SoilTestingOrderConfirmedState extends BaseScreenState<SoilTestingOrderConfirmed> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageRoutes.soilTestingOrderConfirmed, height: 200, width: 200,),
                20.heightBox,
                CustomText(
                    size: 20,
                    color: AppColors.white,
                    bold: true,
                    textKey: AppStrings.orderConfirmed)
              ],
            )
                .w(width)
                .h(height * 0.75)
                .color(AppColors.soilTestPrimary),
            Column(
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  color: AppColors.soilTestPrimary,
                  textKey: "Your Booking Request Is Accepted ",
                  size: 16,
                ).pSymmetric(h: 20),
                5.heightBox,
                CustomText(
                  bold: true,
                  textAlign: TextAlign.center,
                  color: AppColors.soilTestPrimary,
                  textKey: "THANKS for Selecting our soil Test Service",
                  size: 18,
                ),

                // some spacing
                30.heightBox,

                // buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back home button
                    TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                color: AppColors.soilTestPrimary,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: CustomText(
                          color:AppColors.soilTestPrimary,
                          textKey: '  ${AppStrings.backHome}  ',
                        )).color(AppColors.white).cornerRadius(25),

                    // view order/booking button
                    TextButton(
                        onPressed: () {},
                        child: CustomText(
                          color: AppColors.white,
                          textKey: '  ${AppStrings.viewBooking}  ',
                        ))
                        .color(AppColors.soilTestPrimary)
                        .cornerRadius(25)
                  ],
                )
              ],
            ).p(20),
          ],
        ),
      ),
    );
  }
}





