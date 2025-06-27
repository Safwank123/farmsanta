
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/MarketPlace/Purchase/purchase_order_model.dart';
import 'package:farmsanta_new/Pages/MarketPlace/marketplace_request_sent.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/style_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';

class MarketPlaceCheckout extends BaseScreen {
  bool isPurchase;
  PurchaseOrderModel purchaseOrderModel;
  RentalOrderModel rentalOrderModel;

  MarketPlaceCheckout(
      {super.key,
      required this.isPurchase,
      required this.purchaseOrderModel,
      required this.rentalOrderModel});

  @override
  BaseScreenState<MarketPlaceCheckout> createState() =>
      _MarketPlaceCheckoutState();
}

class _MarketPlaceCheckoutState extends BaseScreenState<MarketPlaceCheckout> {
  final List<StoreModel> _purchaseStoreList =
      StoreHelper.store.purchaseStoreList;
  final List<StoreModel> _rentalStoreList = rentalStoreList;
  final List<PurchaseOrderModel> _purchaseOrderList =
      StoreHelper.store.purchaseOrderList;
  final List<RentalOrderModel> _rentalOrderList = rentalOrderList;

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
                        widget.isPurchase
                            ? widget.purchaseOrderModel.modeofPayment =
                                paymentOptions[selectedPaymentOption]!
                            : widget.purchaseOrderModel.modeofPayment =
                                paymentOptions[selectedPaymentOption]!;
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
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
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
                heading: widget.isPurchase
                    ? '${_purchaseOrderList[0].products.length} ${AppStrings.itemsForPurchase}'
                    : '${_rentalOrderList[0].products.length} ${AppStrings.itemsForRent}',

                // delivery/pickup tag
                anyWidget: widget.isPurchase
                    ? CustomText(
                        color: AppColors.white,
                        textKey: _purchaseOrderList[0].delivery
                            ? ' ${AppStrings.deliveryOrder} '
                            : ' ${AppStrings.pickupOrder} ',
                        size: 10,
                      ).box.make().color(AppColors.orange).cornerRadius(5)
                    : CustomText(
                        color: AppColors.white,
                        textKey: _rentalOrderList[0].delivery
                            ? ' ${AppStrings.deliveryOrder} '
                            : ' ${AppStrings.pickupOrder} ',
                        size: 10,
                      ).box.make().color(AppColors.orange).cornerRadius(5),
              ),

              // store location - order details card
              orderDetailCard(
                  heading: '${AppStrings.storeLocation}:',
                  anyWidget: CustomText(
                    textKey: widget.isPurchase
                        ? _purchaseStoreList[0].address
                        : _rentalStoreList[0].address,
                    size: 10,
                    color: AppColors.gray,
                  )),

              // contact details - order details card
              orderDetailCard(
                  heading: '${AppStrings.contactDetails}:',
                  anyWidget: CustomText(
                    textKey: widget.isPurchase
                        ? _purchaseStoreList[0].contact
                        : _rentalStoreList[0].contact,
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
                    textKey: widget.isPurchase
                        ? "${AppStrings.totalPayment} | \$${_purchaseOrderList[0].price}"
                        : "${AppStrings.totalPayment} | \$${_rentalOrderList[0].price}",
                    color: AppColors.white,
                  ),

                  // pay now button
                  TextButton(
                    onPressed: () {
                      navigateToPageWithoutReplaceMent(MarketPlaceRequestSent(
                          isPurchase: widget.isPurchase ? true : false));
                    },
                    child: CustomText(
                      textKey: widget.isPurchase
                          ? _purchaseOrderList[0].delivery
                              ? AppStrings.placeOrder
                              : AppStrings.payNow
                          : AppStrings.payNow,
                      color: widget.isPurchase
                          ? AppColors.primary
                          : AppColors.orange,
                    ),
                  ).color(AppColors.white).cornerRadius(5)
                ],
              )
                  .pSymmetric(h: 5, v: 8)
                  .color(
                      widget.isPurchase ? AppColors.primary : AppColors.orange)
                  .cornerRadius(5)
                  .h(height * 0.07)
            ],
          ).p(10),
        ));
  }

  Widget orderDetailCard({required String heading, required Widget anyWidget}) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomText(
          color: widget.isPurchase ? AppColors.primary : AppColors.orange,
          textKey: heading,
          size: 10,
        ),
        anyWidget,
        Icon(
          Icons.keyboard_arrow_down_outlined,
          color: widget.isPurchase ? AppColors.primary : AppColors.orange,
        ),
      ]).p8().color(AppColors.white).cornerRadius(5).p4()
    ]);
  }
}
