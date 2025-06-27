
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';


import '../../base_screen.dart';

class SoilTestingCheckout extends BaseScreen {
  const SoilTestingCheckout({Key? key}) : super(key: key);

  @override
  BaseScreenState<SoilTestingCheckout> createState() => _SoilTestingCheckoutState();
}

class _SoilTestingCheckoutState extends BaseScreenState<SoilTestingCheckout> {

  var paymentOptions = {
    1: AppStrings.phnPay,
    2: AppStrings.debitCreditCard,
    3: AppStrings.paytm,
    4: AppStrings.gPay,
    5: AppStrings.netBanking,
  };

  var billDetails = {
    1: AppStrings.mrpPrice,
    2: AppStrings.discount,
    3: AppStrings.deliveryCharges,
    4: AppStrings.gstCharges,
  };

  int selectedPaymentOption = 0;

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      // app bar
        appBar: AppBarDesigns.getAppTitleOnly(
          // checkout text
          AppStrings.checkout,
          titleSize: 15,
          backgroundColor: AppColors.grayLight,
          color: AppColors.black,
          toolbarHeight: 30,
        ),

        // background color
        backgroundColor: AppColors.grayLight,

        // main body
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // select payment method text
              CustomText(
                textKey: AppStrings.selectPaymentMethod,
                size: 12,
                color: AppColors.black,
              ),

              // some spacing
              5.heightBox,

              // payment option radio buttons
              for (int i = 1; i <= 5; i++)
                RadioListTile(
                    title: CustomText(
                      textKey: paymentOptions[i]!,
                    ),
                    value: i,
                    groupValue: selectedPaymentOption,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentOption = value!;
                      });
                    }).h(60).color(AppColors.white).cornerRadius(5),

              // some spacing
              10.heightBox,

              // bill details text
              CustomText(
                textKey: AppStrings.billDetails,
                color: AppColors.black,
              ).p4(),

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
                    color: AppColors.soilTestPrimary,
                    bold: true,
                  ).p(5).w(width).box.make().color(AppColors.grayLight).p(8)
                ],
              ).w(width).color(AppColors.white).cornerRadius(5),

              // some spacing
              10.heightBox,

              // your order details text
              CustomText(
                textKey: AppStrings.yourOrderDetail,
                color: AppColors.black,
              ).p4(),

              // order details card
              // items for purchase - order details card
              orderDetailCard(
                // card heading
                heading: "2 SOIL TEST SERVICE",

                // delivery/pickup tag
                anyWidget: CustomText(
                  color: AppColors.white,
                  textKey: "Experts Visit",
                  size: 10,
                ).p(4).box.make().color(AppColors.soilTestPrimary).cornerRadius(5),
              ),

              // store location - order details card
              orderDetailCard(
                  heading: '${AppStrings.storeLocation}:',
                  anyWidget: CustomText(
                    textKey: "#350 Farm No., Village Name, Street......",
                    size: 10,
                    color: AppColors.gray,
                  )),

              // contact details - order details card
              orderDetailCard(
                  heading: '${AppStrings.contactDetails}:',
                  anyWidget: CustomText(
                    textKey:"Name., 9191222345 ",
                    color: AppColors.gray,
                    size: 10,
                  )),

              5.heightBox,

              // row of total payment with pay now button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // total payment text
                  CustomText(
                    textKey: "${AppStrings.totalPayment} | \$80 ",
                    color: AppColors.white,
                  ),

                  // pay now button
                  TextButton(
                    onPressed: () {
                    },
                    child: CustomText(
                      textKey:AppStrings.payNow,
                      color:AppColors.soilTestPrimary,
                    ),
                  ).color(AppColors.white).cornerRadius(5)
                ],
              )
                  .pSymmetric(h: 5, v: 8)
                  .color(AppColors.soilTestPrimary)
                  .cornerRadius(5)
                  .h(height * 0.07)
            ],
          ).p(10),
        )

    );
  }

  Widget orderDetailCard({required String heading, required Widget anyWidget}) {
    return Column(
        children:[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
              color: AppColors.soilTestPrimary,
              textKey: heading,
              size: 10,
            ),
            anyWidget,
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.soilTestPrimary,
            ),
          ]).p8().color(AppColors.white).cornerRadius(5).p4()
        ]
    );
  }

}



