import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../../../themeFiles/app_typography.dart';
import '../../../Models/message/message.dart';
import '../../base_screen.dart';

class CreateNewPost extends BaseScreen {
  static String routeName = '/farm-talk-create-new-post';
  final Message message;
  const CreateNewPost({super.key, required this.message});

  @override
  BaseScreenState<CreateNewPost> createState() => _CreateNewPostState();
}

class _CreateNewPostState extends BaseScreenState<CreateNewPost> {
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

  @override
  Widget buildWidget(BuildContext context) {
    TextEditingController postTitleEditingController = TextEditingController();
    TextEditingController addYourFarmTalkDetailEditingController = TextEditingController();
    TextEditingController addTagsEditingController = TextEditingController();
    Future postSentDialog() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CustomText(
                  textKey: AppStrings.OK,
                  bold: true,
                ),
              ),
            ],
            backgroundColor: AppColors.white,
            // select method text
            title: CustomText(
              color: AppColors.invert,
              textKey: AppStrings.farmSanta,
              bold: true,
            ),
            content: CustomText(
              color: AppColors.invert,
              textKey: AppStrings.postAddedSuccessMessage,
            ),
          ),
        );
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
      appBar: AppBarDesigns.getAppTitleOnly(
        // app bar title
        AppStrings.createNewPost,
      ),

      // body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image != null
                ? Stack(
                    children: [
                      // image
                      Image.file(image!).box.make().hPCT(context: context, heightPCT: 30).wFull(context),

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
                        child: CustomText(textKey: "2/2", style: AppTextStyle.bodySmall.copyWith(color: AppColors.white))
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
                //    color: AppColors.primary,

                    // icon button
                    child: TextButton.icon(
                      onPressed: () {
                        openDialog();
                      },

                      // add icon
                      icon: Icon(
                        fill: 1.0,
                        Icons.add,
                        color: AppColors.gray,
                      ),

                      // add image text
                      label: CustomText(
                        textKey: AppStrings.addImage,
                        color: AppColors.gray,
                        size: 20,
                        bold: true,
                      ),
                    ).wFull(context).hPCT(context: context, heightPCT: 40).box.make().color(AppColors.primary.withOpacity(0.15)),
                  ),

            // some spacing
            10.heightBox,

            // add post details text
            CustomText(
              textKey: AppStrings.addPostDetails,
              size: 16,
            ),

            // some spacing
            10.heightBox,

            // post title text
            CustomText(
              size: 10,
              textKey: AppStrings.postTitle,
              color: AppColors.gray,
            ),

            // some spacing
            5.heightBox,

            // post title input field
            WidgetHelper.getNameAndInputField(
              // input field width
              width: double.infinity,

              // input field color
              fillColor: AppColors.grayLight,

              // hint text
              "",

              // input field controller
              postTitleEditingController,
              context,
            )[2],

            // some spacing
            10.heightBox,

            // add your farm talk detail text
            CustomText(
              size: 10,
              textKey: AppStrings.addYourFarmTalkDetail,
              color: AppColors.gray,
            ),

            // some spacing
            5.heightBox,

            // add your farm talk detail input field
            WidgetHelper.getNameAndInputField(
              // input field width
              width: double.infinity,

              // input field color
              fillColor: AppColors.grayLight,

              // hint text
              "",

              // input field controller
              addYourFarmTalkDetailEditingController,
              context,
            )[2],

            // some spacing
            10.heightBox,

            // add tags text
            CustomText(
              size: 10,
              textKey: AppStrings.addTags,
              color: AppColors.gray,
            ),

            // some spacing
            5.heightBox,

            Stack(
              children: [
                // add tags input field
                WidgetHelper.getNameAndInputField(
                  // input field width
                  width: double.infinity,

                  // input field color
                  fillColor: AppColors.grayLight,

                  // hint text
                  "",

                  // input field controller
                  addTagsEditingController,
                  context,
                )[2],

                Positioned(
                  right: 0,
                  child: CustomText(
                    textKey: AppStrings.add,
                    color: AppColors.white,
                  ).pSymmetric(v: 5, h: 10).box.make().color(AppColors.primary).cornerRadius(15).centered().onInkTap(() {
                    widget.message.tags.add(addTagsEditingController.text);
                  }),
                ),
              ],
            ),

            // some spacing
            30.heightBox,

            // Add Post Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Add Post button
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Add Post text
                    CustomText(
                      bold: true,
                      textKey: AppStrings.addPost,
                      color: AppColors.white,
                    ),
                  ],
                ).pSymmetric(h: 20, v: 10).box.make().color(AppColors.primary).cornerRadius(25).centered().onInkTap(() {
                  widget.message.images[0].fileName = image.toString();
                  widget.message.tags.add(addTagsEditingController.text);
                  widget.message.title = postTitleEditingController.text;
                  widget.message.description = addYourFarmTalkDetailEditingController.text;
                  postSentDialog();
                }),
              ],
            ),
          ],
        ).p12(),
      ),
    );
  }
}
