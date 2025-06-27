import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../themeFiles/app_typography.dart';
import '../../../base_screen.dart';
import '../../../../Constants/arrays.dart';
import '../../../../Models/SupportPlace/farmscout/farm_scouting.dart';
import './query_sent.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';

class AddQueryDetails extends BaseScreen {
  static const String routeName = "/add-query-details-screen";
  const AddQueryDetails({super.key});

  @override
  BaseScreenState<AddQueryDetails> createState() => _AddQueryDetailsState();
}


class _AddQueryDetailsState extends BaseScreenState<AddQueryDetails> {
  FarmScouting? farmScouting;
  File? image;

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

  TextEditingController addQueryTitleEditingController =
      TextEditingController();
  TextEditingController writeYourQueryEditingController =
      TextEditingController();

  @override

  Widget buildWidget(BuildContext context) {
    TextEditingController addQueryTitleEditingController = TextEditingController();
    TextEditingController writeYourQueryEditingController = TextEditingController();

 


    Future openDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // select method text
            title: CustomText(
              color: AppColors.invert,
              textKey: AppStrings.selectMethod,
              bold: true,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
          ),
        );
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleAndIconButton(
        // app bar title
        AppStrings.raiseAQuery,

        // send button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // send text
            CustomText(
              textKey: AppStrings.send,
              color: AppColors.white,
            ),

            // some space
            5.widthBox,

            // send icon
            Icon(
              Icons.send,
              color: AppColors.white,
            )
          ],
        )
            .pSymmetric(v: 5, h: 10)
            .box
            .make()
            .color(AppColors.primary)
            .cornerRadius(15)
            .pOnly(right: 5)
            .onInkTap(() {
          navigateToPageWithoutReplaceMent(const QuerySent());
        }),

        // app bar color
        backgroundColor: AppColors.white,
      ),

      // background color
      backgroundColor: AppColors.textFieldLintBackground,

      // body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image != null
                ? Stack(
                    children: [
                      // image
                      Image.file(image!)
                          .box
                          .make()
                          .hPCT(context: context, heightPCT: 30)
                          .wFull(context),

                      //cancel icon
                      Positioned(
                        right: 5,
                        top: 5,
                        child: Icon(
                          Icons.cancel_outlined,
                          color: AppColors.white,
                        ),
                      ),

                      // circle with opacity
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 180,
                        bottom: 0,
                        child: Icon(
                          size: 70,
                          Icons.circle,
                          color: AppColors.white.withOpacity(0.30),
                        ),
                      ),

                      // circle
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 190,
                        bottom: 0,
                        child: Icon(
                          size: 50,
                          Icons.circle,
                          color: AppColors.white,
                        ),
                      ),

                      // + icon button
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 188,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {
                            openDialog();
                          },
                          icon: Icon(
                            size: 40,
                            Icons.add,
                            color: AppColors.primary,
                          ),
                        ),
                      ),

                      // image number tag
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CustomText(
                                textKey: "1/1",
                                style: AppTextStyle.bodySmall
                                    .copyWith(color: AppColors.white))
                            .pSymmetric(v: 5, h: 10)
                            .box
                            .make()
                            .color(AppColors.invert.withOpacity(0.4))
                            .cornerRadius(15)
                            .centered(),
                      )
                    ],
                  )
                :
                // image adding button
                DottedBorder(
                    // border color
               //     color: AppColors.primary,

                    // icon button
                    child: TextButton.icon(
                      onPressed: () {
                        openDialog();
                      },

                      // add icon
                      icon: Icon(
                        Icons.add,
                        color: AppColors.invert,
                      ),

                      // add image text
                      label: CustomText(
                        textKey: AppStrings.addImage,
                        color: AppColors.invert,
                      ),
                    )
                        .wFull(context)
                        .hPCT(context: context, heightPCT: 40)
                        .box
                        .make()
                        .color(AppColors.primary.withOpacity(0.30)),
                  ),

            // some spacing
            10.heightBox,

            // add query title input field
            WidgetHelper.getNameAndInputField(
              // input field width
              width: double.infinity,

              // input field color
              fillColor: AppColors.white,

              // hint text
              AppStrings.addQueryTitle,

              // input field controller
              addQueryTitleEditingController,
              context,
            )[2],

            // some spacing
            10.heightBox,

            // select crop drop down
            headingAndDropdown(
              heading: AppStrings.selectCrop,
              dropDownList: selectCropDropDownList,
            ),

            // some spacing
            10.heightBox,

            // select plant part drop down
            headingAndDropdown(
              heading: AppStrings.selectPlantPart,
              dropDownList: selectPlantPartDropDownList,
            ),

            // some spacing
            10.heightBox,

            // growth stage drop down
            headingAndDropdown(
              heading: AppStrings.growthStage,
              dropDownList: growthStageDropDownList,
            ),

            // some spacing
            10.heightBox,

            // write your query
            CustomText(textKey: AppStrings.writeYourQuery),

            // some spacing
            5.heightBox,

            // write your query input field
            WidgetHelper.getNameAndInputField(
              // input field width
              width: double.infinity,

              // input field color
              fillColor: AppColors.white,

              // hint text
              AppStrings.typeHere,

              // input field controller
              writeYourQueryEditingController,
              context,
            )[2],
          ],
        ).p12(),
      ),
    );
  }

// heading and drop down widget
  Widget headingAndDropdown(
      {required String heading, required List<String> dropDownList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // drop down

        //heading
        CustomText(textKey: heading),

        //some spacing
        5.heightBox,

        //dropdown
        WidgetHelper.getDropDown("", 0, () {}, dropDownList,
                showBackgroundColor: true, backgroundColor: AppColors.white)
            .color(AppColors.white),
      ],
    );
  }
}
