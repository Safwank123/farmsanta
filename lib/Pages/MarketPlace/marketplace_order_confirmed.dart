
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/style_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';
import './marketplace_order_confirmed_detail.dart';
import '/Functions/common.dart';
import './marketplace_home.dart';



class MarketPlaceOrderConfirmed extends BaseScreen {
  final bool isPurchase;
  const MarketPlaceOrderConfirmed({super.key, required this.isPurchase});

  @override
  BaseScreenState<MarketPlaceOrderConfirmed> createState() =>
      _MarketPlaceOrderConfirmedState();
}

class _MarketPlaceOrderConfirmedState
    extends BaseScreenState<MarketPlaceOrderConfirmed> {
  @override
  Widget buildWidget(BuildContext context) {
    if (widget.isPurchase)
      StoreHelper.store.purchaseOrderList[0].status = "order confirmed";
    else
      rentalOrderList[0].status = "Pending confirmation";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(widget.isPurchase
                    ? ImageRoutes.purchaseOrderConfirmed
                    : ImageRoutes.rentalOrderConfirmed),
                20.heightBox,
                CustomText(
                    size: 20,
                    color: AppColors.white,
                    bold: true,
                    textKey: widget.isPurchase
                        ? AppStrings.orderConfirmed
                        : AppStrings.bookingConfirmed)
              ],
            ).w(width).h(height * 0.75).color(
                widget.isPurchase ? AppColors.primary : AppColors.orange),
            Column(
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
                  textKey: AppStrings.orderRequestAcceptedMessage,
                ).pSymmetric(h: 20),
                5.heightBox,
                CustomText(
                  bold: true,
                  textAlign: TextAlign.center,
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
                  textKey: AppStrings.thanksForPlacingYourOrder,
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
                                color: widget.isPurchase
                                    ? AppColors.primary
                                    : AppColors.orange,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          navigateToPageWithoutReplaceMent(MarketPlaceHome(
                            isPurchase: widget.isPurchase,
                            purchaseOrderModel:
                                StoreHelper.store.purchaseOrderList.first,
                          ));
                        },
                        child: CustomText(
                          color: widget.isPurchase
                              ? AppColors.primary
                              : AppColors.orange,
                          textKey: '  ${AppStrings.backHome}  ',
                        )).color(AppColors.white).cornerRadius(25),

                    // view order/booking button
                    TextButton(
                            onPressed: () {
                              navigateToPageWithoutReplaceMent(
                                  MarketPlaceOrderConfirmedDetail(
                                isPurchase: widget.isPurchase,
                                purchaseOrderModel:
                                    StoreHelper.store.purchaseOrderList[0],
                                rentalOrderModel: rentalOrderList[0],
                              ));
                            },
                            child: CustomText(
                              color: AppColors.white,
                              textKey: widget.isPurchase
                                  ? '  ${AppStrings.viewOrder}  '
                                  : '  ${AppStrings.viewBooking}  ',
                            ))
                        .color(widget.isPurchase
                            ? AppColors.primary
                            : AppColors.orange)
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
