
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/MarketPlace/marketplace_order_detail.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';

class MarketPlaceRequestSent extends BaseScreen {
  bool isPurchase;
  MarketPlaceRequestSent({super.key, required this.isPurchase});

  @override
  BaseScreenState<MarketPlaceRequestSent> createState() =>
      _MarketPlaceRequestSentState();
}

class _MarketPlaceRequestSentState
    extends BaseScreenState<MarketPlaceRequestSent> {
  @override
  Widget buildWidget(BuildContext context) {
    if (widget.isPurchase) {
      StoreHelper.store.purchaseOrderList[0].status = "order confirmed";
    } else if (rentalOrderList[0].delivery)
      rentalOrderList[0].status = "delivered";
    else
      rentalOrderList[0].status = "ready for pickup";

    return Scaffold(
      backgroundColor: widget.isPurchase ? AppColors.primary : AppColors.orange,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          Image.asset(widget.isPurchase
              ? ImageRoutes.purchaseClock
              : ImageRoutes.rentalClock),

          20.heightBox,
          // Request sent text
          CustomText(
              size: 18,
              color: AppColors.white,
              bold: true,
              textKey: widget.isPurchase
                  ? AppStrings.orderRequestSent
                  : AppStrings.bookingRequestSent),

          // some spacing
          10.heightBox,

          // request sent messsage text
          CustomText(
                  textAlign: TextAlign.center,
                  color: AppColors.white,
                  textKey: widget.isPurchase
                      ? AppStrings.orderRequestSentMessage
                      : AppStrings.bookingRequestSentMessage)
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
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
                    textKey: '  ${AppStrings.backHome}  ',
                  )).color(AppColors.white).cornerRadius(25),

              // view order/booking button
              TextButton(
                  onPressed: () {
                    navigateToPageWithoutReplaceMent(MarketPlaceOrderDetail(
                      isPurchase: widget.isPurchase,
                      isdelivery:
                          StoreHelper.store.purchaseOrderList[0].delivery,
                    ));
                  },
                  child: CustomText(
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
                    textKey: widget.isPurchase
                        ? '  ${AppStrings.viewOrder}  '
                        : '  ${AppStrings.viewBooking}  ',
                  )).color(AppColors.white).cornerRadius(25)
            ],
          ).pSymmetric(h: 20)
        ],
      ).centered().p(10),
    );
  }
}
