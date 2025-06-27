
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Functions/common.dart';
import '../../../Services/store_helper.dart';
import '../../../Widgets/classes/app_bar.dart';
import '../../../Widgets/classes/style_helper.dart';
import 'dart:io';

import '../../base_screen.dart';
import '../marketplace_checkout.dart';

class RentVerificationScreen extends BaseScreen {
  const RentVerificationScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<RentVerificationScreen> createState() =>
      _RentVerificationScreenState();
}

class _RentVerificationScreenState
    extends BaseScreenState<RentVerificationScreen> {
  File? image;
  bool pressAttention = true;
  bool isChecked = false;
  List guidlines = [
    "* Upload both sides of the DL in appropriate fields.",
    "* Original Driving license is to be deposited before picking up the vehicle and the same Will be returned once the vehicle is dropped.",
    "* Please upload the picture of the original DL and ID Proof.",
    "* Uploaded images of the documents are clear and visible for faster approval."
  ];

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly("Verification"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomText(
              textKey: "Upload Documents for your ID Verification",
              color: AppColors.rentalPrimary,
              size: 16,
              bold: true,
            ),
            10.heightBox,
            CustomText(textKey: "ID proof"),
            10.heightBox,
            Row(
              children: [
                CustomText(
                  textKey: "Aadhar Card",
                  color: AppColors.white,
                )
                    .p8()
                    .box
                    .make()
                    .color(pressAttention
                        ? AppColors.rentalPrimary
                        : AppColors.gray)
                    .cornerRadius(5)
                    .centered()
                    .onTap(() {
                  setState(() => pressAttention = !pressAttention);
                }),
                VerticalDivider(),
                CustomText(
                  textKey: "Passport",
                  color: AppColors.white,
                )
                    .p8()
                    .box
                    .make()
                    .color(!pressAttention
                        ? AppColors.rentalPrimary
                        : AppColors.gray)
                    .cornerRadius(5)
                    .centered()
                    .onTap(() {
                  setState(() => pressAttention = !pressAttention);
                }),
              ],
            ).p4(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    addimage(),
                    CustomText(
                      textKey: "Front Side",
                      color: AppColors.gray,
                    ),
                  ],
                ),
                Column(
                  children: [
                    addimage(),
                    CustomText(
                      textKey: "Back Side",
                      color: AppColors.gray,
                    ),
                  ],
                ),
              ],
            ),
            10.heightBox,
            CustomText(textKey: "Driving License"),
            Row(
              children: [
                Column(
                  children: [
                    addimage(),
                    CustomText(
                      textKey: "Front Side",
                      color: AppColors.gray,
                    ),
                  ],
                ),
                Column(
                  children: [
                    addimage(),
                    CustomText(
                      textKey: "Back Side",
                      color: AppColors.gray,
                    ),
                  ],
                ),
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  textKey: "Guidelines to Follow",
                  color: AppColors.rentalPrimary,
                  size: 16,
                  bold: true,
                ).p2(),
                for (int i = 0; i < guidlines.length; i++)
                  CustomText(
                    textKey: guidlines[i],
                    color: AppColors.gray,
                  ).p2(),
                CustomText(
                  textKey: "Read All",
                  color: AppColors.rentalPrimary,
                ).p2(),
                5.heightBox,
              ],
            ).p8().color(AppColors.grayLight).cornerRadius(10),
            5.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    CustomText(
                      textKey: "I Read & Accept all Terms & Conditions",
                      color: AppColors.black,
                    ),
                  ],
                )
              ],
            ).p2().color(AppColors.grayLight).cornerRadius(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // total payment text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textKey:
                          "${AppStrings.totalPayment} | \$${rentalOrderList[0].price}",
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
                        Icon(Icons.keyboard_arrow_down,
                                size: 10, color: AppColors.primary)
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
                    if (isChecked) {
                      navigateToPageWithoutReplaceMent(MarketPlaceCheckout(
                        isPurchase: false,
                        purchaseOrderModel:
                            StoreHelper.store.purchaseOrderList[0],
                        rentalOrderModel: rentalOrderList[0],
                      ));
                    } else {
                      showToast("please accept the terms and conditions");
                    }
                  },
                  child: CustomText(
                    textKey: "Payment",
                    color: AppColors.rentalPrimary,
                  ),
                ).color(AppColors.white).cornerRadius(5).p2()
              ],
            )
                .pSymmetric(h: 5, v: 8)
                .color(AppColors.rentalPrimary)
                .cornerRadius(5)
                .h(height * 0.07)
                .p8()
          ],
        ).p8(),
      ),
    );
  }

  // function to pick image
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        this.image = File(image.path);
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void _addPhoto() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              CustomText(
                color: AppColors.invert,
                textKey: AppStrings.selectMethod,
                bold: true,
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Camera icon button
                  TextButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: Icon(
                      Icons.camera,
                      color: AppColors.invert,
                    ),
                    label: CustomText(
                      textKey: AppStrings.camera,
                      color: AppColors.invert,
                      bold: true,
                    ),
                  ),

                  // Gallery icon button
                  TextButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: Icon(
                      Icons.browse_gallery,
                      color: AppColors.invert,
                    ),
                    label: CustomText(
                      textKey: AppStrings.gallery,
                      color: AppColors.invert,
                      bold: true,
                    ),
                  )
                ],
              )
            ],
          ).hPCT(context: context, heightPCT: 15).p12();
        });
  }

  Widget addimage() {
    return IconButton(
      onPressed: () {
        _addPhoto();
      },
      icon: Icon(Icons.add_circle_rounded),
      color: AppColors.rentalPrimary,
    )
        .p20()
        .box
        .make()
        .color(AppColors.lightpink)
        .cornerRadius(10)
        .centered()
        .p12();
  }
}
