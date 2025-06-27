
import 'package:farmsanta_new/Pages/MarketPlace/Rental/rent_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/Widgets/custom_text.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../Widgets/classes/style_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';
import 'marketplace_checkout.dart';

class CartPageHomeDeliveryOrder extends BaseScreen {
  final bool isPurchase;
  final int initialIndex;
  const CartPageHomeDeliveryOrder(
      {Key? key, required this.isPurchase, required this.initialIndex})
      : super(key: key);

  @override
  BaseScreenState<CartPageHomeDeliveryOrder> createState() =>
      _CartPageHomeDeliveryOrderState();
}

class _CartPageHomeDeliveryOrderState
    extends BaseScreenState<CartPageHomeDeliveryOrder>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 2, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int item = 1;

  //TODO: add comments
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly("My Cart"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: AppColors.primary,
            indicatorColor: AppColors.primary,
            controller: tabController,
            tabs: tabs(),
          ).hPCT(context: context, heightPCT: 5),

          10.heightBox,
          // Tab Bar View
          Expanded(
            child: TabBarView(controller: tabController, children: [
              tabContentHomeDelivery(AppColors.primary),
              tabContentHomeDelivery(AppColors.rentalPrimary),
            ]),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // total payment text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey: tabController.index == 0
                        ? "${AppStrings.totalPayment} | \$${StoreHelper.store.purchaseOrderList[0].price}"
                        : "${AppStrings.totalPayment} | \$${rentalOrderList[0].price}",
                    color: AppColors.white,
                  ),
                  Row(
                    children: [
                      CustomText(
                        textKey: AppStrings.viewbill,
                        color: AppColors.white,
                        size: 10,
                      ),
                      5.widthBox,
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 10,
                        color: tabController.index == 0
                            ? AppColors.primary
                            : AppColors.rentalPrimary,
                      )
                          .p2()
                          .box
                          .make()
                          .color(AppColors.white)
                          .cornerRadius(100)
                          .onTap(() {}),
                    ],
                  ),
                ],
              ),

              // pay now button
              TextButton(
                  onPressed: () {
                    if (tabController.index == 1)
                      navigateToPageReplaceMent(RentVerificationScreen());
                    else
                      navigateToPageReplaceMent(MarketPlaceCheckout(
                        isPurchase: true,
                        purchaseOrderModel:
                            StoreHelper.store.purchaseOrderList[0],
                        rentalOrderModel: rentalOrderList[0],
                      ));
                  },
                  child: CustomText(
                    textKey: tabController.index == 0
                        ? AppStrings.checkout
                        : AppStrings.verification,
                    color: tabController.index == 0
                        ? AppColors.primary
                        : AppColors.rentalPrimary,
                  )).color(AppColors.white).cornerRadius(5).p2()
            ],
          )
              .pSymmetric(h: 5, v: 8)
              .color(tabController.index == 0
                  ? AppColors.primary
                  : AppColors.rentalPrimary)
              .cornerRadius(5)
              .h(height * 0.07)
              .p8()
        ],
      ),
    );
  }

  // list of tab widgets
  List<Widget> tabs() {
    return tabNames.map((e) => tabWidget(e)).toList();
  }

  // list of tab names
  List<String> tabNames = [AppStrings.buy, AppStrings.forrent];

  // Tab Widget
  Widget tabWidget(String title) {
    return CustomText(
      textKey: title,
      size: 16,
    );
  }

  Widget tabContentHomeDelivery(Color color) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textKey: AppStrings.ordertype,
              color: AppColors.gray,
              size: 10,
            ).p2(),
            CustomText(
              textKey: AppStrings.homedelivery,
              color: AppColors.white,
              size: 16,
            )
                .pSymmetric(h: 10, v: 3)
                .box
                .make()
                .color(AppColors.orange)
                .cornerRadius(5),
            5.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: AppStrings.deliveryAddress,
                  size: 14,
                ).py4(),
                CustomText(
                  textKey: AppStrings.change,
                  size: 14,
                  color: color,
                ).py4(),
              ],
            ).p4(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(textKey: AppStrings.HOME, color: color).p2(),
                CustomText(
                  textKey:
                      'House no., village name, street address, state, city , pincode',
                  color: AppColors.gray,
                ).p2(),
              ],
            ).p8().color(AppColors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey:
                      "${AppStrings.addeditemsforpurchase} (${widget.isPurchase ? StoreHelper.store.purchaseOrderList[0].products.length : rentalOrderList[0].products.length})",
                  size: 10,
                ),
                CustomText(
                  textKey:
                      "${AppStrings.totalPayment} | \$${widget.isPurchase ? StoreHelper.store.purchaseOrderList[0].price : rentalOrderList[0].price}",
                  size: 10,
                ),
              ],
            ).p8(),
            for (int i = 0; i < StoreHelper.store.purchaseOrderList.length; i++)
              for (int j = 0;
                  j < StoreHelper.store.purchaseOrderList[i].products.length;
                  j++)
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: AssetImage(widget.isPurchase
                              ? StoreHelper
                                  .store.purchaseOrderList[i].products[j].image
                              : rentalOrderList[i].products[j].image)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textKey: widget.isPurchase
                                ? StoreHelper
                                    .store.purchaseOrderList[i].products[j].name
                                : rentalOrderList[i].products[j].name,
                            size: 4,
                            color: AppColors.gray,
                          ),
                          if (widget.isPurchase)
                            Column(
                              children: [
                                5.heightBox,
                                CustomText(
                                  textKey: AppStrings.noOfUnits,
                                  color: AppColors.gray,
                                ),
                                5.heightBox,
                                Row(children: [
                                  IconButton(
                                    color: AppColors.red,
                                    onPressed: () {
                                      setState(() {
                                        item--;
                                      });
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  CustomText(
                                    textKey: "$item",
                                    size: 20,
                                  ),
                                  IconButton(
                                    color: AppColors.primary,
                                    onPressed: () {
                                      setState(() {
                                        item++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                  )
                                ])
                                    .box
                                    .make()
                                    .color(AppColors.grayLight)
                                    .cornerRadius(20),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.heightBox,
                                CustomText(
                                  textKey: 'Rent Duration : 1 Day',
                                  color: AppColors.gray,
                                  size: 10,
                                ),
                                10.heightBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      textKey: "Pickup Date/Time",
                                      size: 1,
                                      style: TextStyle(fontSize: 1),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 10,
                                      color: AppColors.black,
                                    ),
                                    CustomText(
                                      textKey: "Dropoff Date/Time",
                                      size: 1,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      textKey: "13 April,2023",
                                      size: 1,
                                      color: AppColors.rentalPrimary,
                                    ),
                                    20.widthBox,
                                    CustomText(
                                      textKey: "15 April,2023",
                                      size: 1,
                                      color: AppColors.rentalPrimary,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            textKey:
                                "\$${widget.isPurchase ? StoreHelper.store.purchaseOrderList[i].products[j].amount : rentalOrderList[i].products[j].amount}",
                            color: AppColors.black,
                            bold: true,
                          ).p2(),
                          40.heightBox,
                          IconButton(
                            color: AppColors.red,
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      )
                    ],
                  ).p12(),
                ]).color(AppColors.white),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: AppStrings.addmoreitems,
                )
                    .pSymmetric(v: 8, h: 30)
                    .box
                    .make()
                    .color(AppColors.grayLight)
                    .cornerRadius(10)
                    .p4(),
              ],
            ).px8().color(AppColors.white).wFull(context),
            CustomText(
              textKey: AppStrings.coupons,
              size: 14,
            ).p4(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: AppStrings.applycoupon,
                  size: 12,
                  color: color,
                ).py4(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  color: color,
                )
              ],
            ).p4().color(AppColors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: AppStrings.contactDetails,
                  size: 14,
                ).py4(),
                CustomText(
                  textKey: AppStrings.change,
                  size: 14,
                  color: color,
                ).py4(),
              ],
            ).p4(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  textKey: AppStrings.name,
                  color: color,
                ).p2(),
                CustomText(
                  textKey: '+919333964443',
                  color: AppColors.gray,
                ).p2(),
              ],
            ).p8().color(AppColors.white),
            10.heightBox,
            CustomText(
              textKey: AppStrings.sharelocation,
              size: 16,
            ).py4(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            //store profile image
                            Image(
                              image: AssetImage(ImageRoutes.farmerstoreimage),
                              height: 20,
                              width: 20,
                            ),

                            //store name
                            3.widthBox,
                            CustomText(
                              bold: true,
                              textKey: widget.isPurchase
                                  ? StoreHelper.store.purchaseStoreList[0].name
                                  : rentalStoreList[0].name,
                            ),
                          ]),
                          Row(children: [
                            //store profile image
                            Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            // store name
                            3.widthBox,
                            CustomText(
                                bold: true,
                                textKey: widget.isPurchase
                                    ? StoreHelper
                                        .store.purchaseStoreList[0].address
                                    : rentalStoreList[0].address,
                                color: AppColors.primary),
                          ])
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          textKey: widget.isPurchase
                              ? StoreHelper.store.purchaseStoreList[0].kmAway
                                  .toString()
                              : rentalStoreList[0].kmAway.toString() +
                                  AppStrings.kmaway,
                          color: AppColors.white,
                        )
                            .p(3)
                            .box
                            .make()
                            .color(color)
                            .cornerRadius(5)
                            .centered(),
                        CustomText(
                          textKey: AppStrings.fromyourlocation,
                          color: AppColors.gray,
                          style: const TextStyle(fontSize: 1),
                        )
                      ],
                    ),
                  ],
                ),
                10.heightBox,
                Image(image: AssetImage(ImageRoutes.map)),
                10.heightBox,
                CustomText(
                  textKey: widget.isPurchase
                      ? AppStrings.homedeliveryconditionforpurchase
                      : AppStrings.homedeliveryconditionforrent,
                  style: TextStyle(fontSize: 1),
                  color: color,
                )
                    .p(3)
                    .box
                    .make()
                    .color(widget.isPurchase
                        ? AppColors.white
                        : AppColors.lightpink)
                    .cornerRadius(5)
                    .centered(),
              ],
            ).p8().color(AppColors.white).cornerRadius(5),
            CustomText(
              textKey: AppStrings.billDetails,
              size: 14,
            ).p8(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  textKey: AppStrings.mrpPrice,
                  color: AppColors.gray,
                ).p2(),
                CustomText(
                  textKey: AppStrings.discount,
                  color: AppColors.gray,
                ).p2(),
                CustomText(
                  textKey: AppStrings.deliveryCharges,
                  color: AppColors.gray,
                ).p2(),
                CustomText(
                  textKey: AppStrings.gstCharges,
                  color: AppColors.gray,
                ).p2(),
                5.heightBox,
                CustomText(
                  textKey: AppStrings.totalAmount,
                  color: color,
                  size: 12,
                  bold: true,
                ).p4().box.make().color(AppColors.grayLight),
              ],
            ).p8().color(AppColors.white),
          ],
        ).p8().color(AppColors.grayLight),
        // row of total payment with pay now button
      ],
    ));
  }
}
