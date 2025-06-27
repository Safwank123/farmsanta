
import 'package:farmsanta_new/Pages/MarketPlace/soilTesting/soil_testing_booking_request_sent.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Functions/common.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class SoilTestBookingRequest extends BaseScreen {
  const SoilTestBookingRequest({Key? key}) : super(key: key);

  @override
  State<SoilTestBookingRequest> createState() => _SoilTestBookingRequestState();
}

class _SoilTestBookingRequestState extends State<SoilTestBookingRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly("Booking Request"),
      body:  SingleChildScrollView(
    child: Column(
    children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: "Soil Collection Mode",
          color: AppColors.gray,
          size: 10,
        ).p2(),
        CustomText(
          textKey: "By Lab Expert",
          color: AppColors.white,
          size: 14,
        )
            .pSymmetric(h: 10, v: 3)
            .box
            .make()
            .color(AppColors.soilTestPrimary)
            .cornerRadius(5),
        10.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: "Your Farm Location".toUpperCase(),
              size: 14,
            ).py4(),
            CustomText(
              textKey: AppStrings.change,
              size: 14,
              color: AppColors.primary,
            ).py4(),
          ],
        ).p4(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              textKey: "Farm".toUpperCase(),
              color: AppColors.soilTestPrimary,
            ).p2(),
            CustomText(
              textKey: "#350 Farm No.,Village Name, Street Address,State, City, Pincode",
              color: AppColors.gray,
            ).p2(),
          ],
        ).p8().color(AppColors.white),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey:
              "SELECTED SOIL TEST SERVICE(${rentalOrderList[0].products.length})",
              size: 10,
            ),
            CustomText(
              textKey:
              "${AppStrings.totalPayment} | \$${rentalOrderList[0].price}",
              size: 10,
            ),
          ],
        ).p8(),
        for (int i = 0; i < 1; i++)
          for (int j = 0; j < 1; j++)
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      image: AssetImage( rentalOrderList[i].products[j].image)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textKey: rentalOrderList[i].products[j].name,
                        size: 4,
                        color: AppColors.gray,
                      ),

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
                                30.widthBox,
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
                        "\$${rentalOrderList[i].products[j].amount}",
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
              textKey: "+ Add more Soil Testing Service",
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
              color: AppColors.soilTestPrimary,
            ).py4(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              color: AppColors.soilTestPrimary,
            )
          ],
        ).p4().color(AppColors.white),
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
              color: AppColors.soilTestPrimary,
            ).py4(),
          ],
        ).p4(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(textKey: AppStrings.HOME, color: AppColors.soilTestPrimary).p2(),
            CustomText(
              textKey:
              'House no., village name, street address, state, city , pincode',
              color: AppColors.gray,
            ).p2(),
          ],
        ).p8().color(AppColors.white),

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
                          image: AssetImage(ImageRoutes.purchaseStoreIcon),
                          height: 20,
                          width: 20,
                        ),

                        //store name
                        3.widthBox,
                        CustomText(
                          bold: true,
                          textKey: rentalStoreList[0].name,
                        ),
                      ]),
                      Row(children: [
                        //store profile image
                        Icon(
                          Icons.location_on,
                          color: AppColors.soilTestPrimary,
                          size: 20,
                        ),
                        // store name
                        3.widthBox,
                        CustomText(
                            bold: true,
                            textKey: rentalStoreList[0].address,
                            color: AppColors.soilTestPrimary),
                      ])
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      textKey: "5" +
                          AppStrings.kmaway,
                      color: AppColors.white,
                    )
                        .p(3)
                        .box
                        .make()
                        .color(AppColors.soilTestPrimary)
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
              textKey: "Lab Location and contact details with owner will be shared after buying",
              style: const TextStyle(fontSize: 1),
              color: AppColors.soilTestPrimary,
              size: 1,
            )
                .p(3)
                .box
                .make()
                .color(AppColors.lightpink)
                .cornerRadius(5)
                .centered(),
          ],
        ).p8().color(AppColors.white).cornerRadius(5),


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
              color: AppColors.soilTestPrimary,
            ).py4(),
          ],
        ).p4(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              textKey: AppStrings.name,
              color: AppColors.soilTestPrimary,
            ).p2(),
            CustomText(
              textKey: '+919333964443',
              color: AppColors.gray,
            ).p2(),
          ],
        ).p8().color(AppColors.white),


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
              color: AppColors.soilTestPrimary,
              size: 12,
              bold: true,
            ).p4().box.make().color(AppColors.grayLight),
          ],
        ).p8().color(AppColors.white),
      ],
    ).p8().color(AppColors.grayLight),

    // row of total payment with pay now button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // total payment text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textKey: "${AppStrings.totalPayment} | \$${rentalOrderList[0].price}",
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
                    color: AppColors.soilTestPrimary,
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
                navigateToPageReplaceMent(SoilTestingBookingRequestSent());
              },
              child: CustomText(
                textKey: "Send Request",
                color:  AppColors.soilTestPrimary,
              )).color(AppColors.white).cornerRadius(5).p2()
        ],
      )
          .pSymmetric(h: 5, v: 8)
          .color(AppColors.soilTestPrimary)
          .cornerRadius(5)
          .h(height * 0.07)
          .p8()

    ],))
    );
  }
}


