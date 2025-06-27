
import 'package:farmsanta_new/Constants/colors.dart';
import 'package:farmsanta_new/Constants/padding.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/app_functions.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Models/message/message.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text_string.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../../Models/SupportPlace/CropCalender/CropCalender.dart';
import '../../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../../themeFiles/custom_icons.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_edit_text_white_back.dart';
import '../Widgets/custom_text.dart';

//all cards
class CardHelper {
  static Widget farmCard(
    BuildContext context,
    Function onTap,
    bool editFarm,
    String? title,
    String? subtitle,
  ) {
    return Card(
      color: cardBackgroundColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: getBorderRadiusTop(15),
          child: Container(
            height: 80,
            color: textFieldLightColor,
            width: MediaQuery.of(context).size.width,
            child: VStack(
              [
                const Icon(
                  Icons.location_history,
                  color: primaryColor,
                ),
                CustomButtonElevated(
                    text: editFarm ? AppStrings.edit : AppStrings.viewFarm,
                    onTap: onTap)
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
        10.heightBox,
        CustomTextString(
          text: title!,
          color: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.titleMedium,
        ).pSymmetric(h: 15),
        CustomTextString(
          text: subtitle!,
          color: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.bodySmall,
        ).pSymmetric(h: 15),
        10.heightBox
      ]).wFull(context),
    );
  }

  static Widget cropCard(
      BuildContext context, CropModelShort model, Color color,
      {Function? remove}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            WidgetHelper.getCircularAvatar('', maxRadius: 32)
                .pOnly(top: 10, right: 10),
            if (remove != null)
              Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: color)),
                child: Icon(
                  Icons.close,
                  size: 20,
                ).p(2),
              ).pOnly(left: 50).onInkTap(() {
                remove();
              }),
            Container(
              decoration: BoxDecoration(
                  color: AppThemeColors.getColor(AppThemeColorsEnum.background),
                  borderRadius:
                      remove == null ? BorderRadius.circular(30) : null,
                  border: remove == null ? Border.all(color: color) : null),
              child: CustomText(
                textKey:
                    AppFunctions.getParsedString(model.cropName, length: 7),
                color: color,
              ).py4().centered(),
            ).pOnly(top: 50).w(64)
          ],
        ),
      ],
    ).pOnly(right: 16);
  }

  static Widget cropCalenderCard(
    BuildContext context,
    CropCalendar model,
    Color color, {
    Function? remove,
    bool selected = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 3,
                    color: !selected ? AppColors.white : color,
                  )),
              child: WidgetHelper.getCircularAvatar(
                  "https://images.unsplash.com/photo-1511735643442-503bb3bd348a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3JvcHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                  maxRadius: 32),
            ).pOnly(top: 10, right: 10),
            if (remove != null)
              Container(
                decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: selected ? color : AppColors.white,
                        strokeAlign: 4)),
                child: Icon(
                  Icons.close,
                  size: 20,
                ).p(2),
              ).pOnly(left: 50).onInkTap(() {
                remove();
              }),
            Container(
              decoration: BoxDecoration(
                  color: !selected
                      ? AppThemeColors.getColor(AppThemeColorsEnum.background)
                      : color,
                  borderRadius:
                      remove == null ? BorderRadius.circular(30) : null,
                  border: remove == null
                      ? Border.all(color: !selected ? AppColors.primary : color)
                      : null),
              child: CustomText(
                textKey: AppFunctions.getParsedString("Name",
                    length: 7), // TODO:// Not sure a
                color: !selected ? AppColors.primary : AppColors.background,
              ).py4().centered(),
            ).pOnly(top: 60).w(64)
          ],
        ),
      ],
    ).pOnly(right: 16);
  }

  static Widget popCard(BuildContext context, PoPModel model, Color color,
      {dynamic onTap,
      dynamic onTapMore,
      dynamic onTapShare,
      dynamic onTapSave}) {
    String formattedOrdered =
        DateFormat('dd/MM/yyyy').format(model.updatedTimestamp!.toDate()!);

    //Bottom Sheet
    void _menuOptions() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetHelper.iconButton(
                  CustomIcons.file, AppStrings.viewPop, onTap),
              WidgetHelper.iconButton(
                  CustomIcons.save, AppStrings.save, onTapSave),
              WidgetHelper.iconButton(
                  CustomIcons.share, AppStrings.share, onTapShare),
            ],
          ).hPCT(context: context, heightPCT: 15).box.make().cornerRadius(15);
        },
      );
    }

    return Column(
      children: [
        //crop name and more button
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomText(
            textKey: model.cropName!,
            style: AppTextStyle.titleMedium,
          ),
          Icon(
            CustomIcons.menu,
            color: AppColors.gray,
          ).onTap(() => _menuOptions())
        ]).w(width),
        10.heightBox,

        //Image and Icons
        Stack(
          children: [
            //background image
            WidgetHelper().getCachedImage(
                getImagePath(model.photos![0].fileName ?? ""),
                height * 0.4,
                width,
                boxFit: BoxFit.fitHeight),

            //save button
            Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  CustomIcons.save,
                  color: AppColors.white,
                )
                    .p8()
                    .glassMorphic(blur: 2)
                    .box
                    .make()
                    .color(AppColors.invert.withOpacity(0.1))
                    .cornerRadius(100)
                    .centered()
                    .onTap(onTapSave)),

            //share button
            Positioned(
                top: 60,
                right: 10,
                child: Icon(
                  CustomIcons.share,
                  color: AppColors.white,
                )
                    .p8()
                    .glassMorphic(blur: 2)
                    .box
                    .make()
                    .color(AppColors.invert.withOpacity(0.1))
                    .cornerRadius(100)
                    .centered()
                    .onTap(onTapShare)),

            //date
            Positioned(
              bottom: 10,
              left: 10,
              child: CustomText(
                      textKey: formattedOrdered,
                      style: AppTextStyle.bodyMedium
                          .copyWith(color: AppColors.white))
                  .pSymmetric(v: 5, h: 10)
                  .glassMorphic(blur: 4)
                  .box
                  .make()
                  .color(AppColors.invert.withOpacity(0.1))
                  .cornerRadius(15)
                  .centered(),
            )
          ],
        ).hPCT(context: context, heightPCT: 40).onInkTap(onTap),
      ],
    ).p(15).box.make().color(AppColors.background);
  }

  static Widget FarmTalkExploreCard(
    BuildContext context,
    Message message, {
    dynamic onTap,
  }) {
    //Bottom Sheet
    void _comments() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(
                prefixWidget: Icon(
                  MaterialSymbols.search,
                  size: 25,
                  color: AppColors.primary,
                ).onTap(() {}),

                showIcon: true,
                hint: AppStrings.comment,
                textEditingController: TextEditingController(),
                borderRadius: 25,
                fillColor: AppColors.grayLight,

                //filter icon
                suffixWidget: Icon(
                  MaterialSymbols.send,
                  size: 25,
                  color: AppColors.primary,
                ).onTap(() {}),
              ).p4(),

              //CommentSection
              CustomText(
                textKey: "View ${message.comments.length} Comments",
                size: 18,
              ).pSymmetric(v: 8, h: 2),

              for (int i = 0; i < message.comments.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 34,
                            ),
                            5.widthBox,
                            CustomText(
                              textKey: message.comments[i].createdBy,
                              color: AppColors.subHeading,
                            ),
                          ],
                        ),
                        CustomText(
                          textKey: message.comments[i].createdTimestamp,
                          color: AppColors.subHeading,
                        ),
                        Icon(
                          CustomIcons.menu,
                          color: AppColors.subHeading,
                          size: 16,
                        ),
                      ],
                    ),
                    CustomText(
                      textKey: message.comments[i].comment,
                      size: 18,
                      color: AppColors.subHeading,
                    ).pSymmetric(v: 2, h: 8),
                    Divider(
                      color: AppColors.gray,
                    ),
                  ],
                ).p2(),
            ],
          )
              .p4()
              .hPCT(context: context, heightPCT: 50)
              .box
              .make()
              .cornerRadius(5);
        },
      );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Stack(
        children: [
          //image of card

          WidgetHelper()
              .getCachedImage(message.images[0].fileName, height * 0.5, width,
                  boxFit: BoxFit.fitHeight)
              .onTap(onTap),

          // mascot and farmSanta on left top
          WidgetHelper.mascotImageWithFarmSanta(),

          //date on left bottom Corner
          Positioned(
            bottom: 10,
            left: 10,
            child: CustomText(
              textKey: message.createdTimestamp,
              color: AppColors.white,
            )
                .p8()
                .box
                .make()
                .color(AppColors.black.withOpacity(0.5))
                .cornerRadius(100)
                .centered(),
          ),

          //like button
          Positioned(
              top: 15,
              right: 10,
              child: Icon(
                CustomIcons.like,
                color: AppColors.white,
                size: 22,
              )
                  .p8()
                  .box
                  .make()
                  .color(AppColors.black.withOpacity(0.5))
                  .cornerRadius(100)
                  .centered()
                  .onTap(null)),

          //comment button
          Positioned(
              top: 65,
              right: 10,
              child: Icon(
                Icons.comment,
                color: AppColors.white,
                size: 22,
              )
                  .p8()
                  .box
                  .make()
                  .color(AppColors.black.withOpacity(0.5))
                  .cornerRadius(100)
                  .centered()
                  .onTap(() {
                _comments();
              })),
        ],
      ).p(15).box.make().color(AppColors.background),

      // like and comment button after image
      Row(
        children: [
          Icon(
            CustomIcons.like,
            size: 18,
            color: Colors.black,
          ),
          4.widthBox,
          CustomText(
            textKey: "${message.likes} likes",
            size: 18,
          ),
          20.widthBox,
          Icon(
            Icons.comment,
            size: 18,
            color: Colors.black,
          ),
          3.widthBox,
          CustomText(
            textKey: "${message.comments.length} comments",
            size: 18,
          ),
        ],
      ).pSymmetric(h: 34, v: 12),

      //text below image
      CustomText(
        textKey: message.title,
        size: 16,
      ).pSymmetric(h: 12),
      Text(
        message.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ).pSymmetric(h: 12),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomText(
          textKey: AppStrings.readmore,
          color: AppColors.primary,
        ),
        Icon(
          Icons.arrow_forward_sharp,
          color: AppColors.primary,
          size: 12,
        ),
      ]).onTap(onTap).pSymmetric(h: 12),

      Row(
        children: [
          for (int i = 0; i < message.tags.length; i++)
            CustomText(
              textKey: "#${message.tags[i]}",
              color: Colors.blueAccent,
            ).pSymmetric(h: 2),
        ],
      ).pSymmetric(h: 12)
    ]);
  }

  static Widget cropAdvisoryCard(
    BuildContext context,
    CropAdvisoryModel model,
    Color color, {
    dynamic onTap,
    dynamic TapMore,
  }) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        //topleft logo with Text
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image(
                  image: AssetImage(ImageRoutes.mascotIntroImage),
                  height: 45,
                  width: 45,
                ),
                10.widthBox,
                CustomText(
                  textKey: AppStrings.farmsanta,
                  bold: true,
                ),
              ],
            ),
            CustomText(textKey: getFormatedDateTime1(model.updatedTimestamp)),
          ]).w(width).p8(),

          5.heightBox,

          Stack(
            children: [
              //filter tabs with arrow button
              WidgetHelper()
                  .getCachedImage(getImagePath(model.photos[0].fileName ?? ""),
                      height * 0.4, width,
                      boxFit: BoxFit.fitHeight)
                  .cornerRadius(10.0),
              Positioned(
                top: 10,
                left: 10,
                child: WidgetHelper.filterTab(AppStrings.plant,
                    model.cropName ?? "", AppColors.invert.withOpacity(0.4)),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: WidgetHelper.filterTab(
                    AppStrings.growthStage,
                    model.growthStageName ?? "",
                    AppColors.invert.withOpacity(0.4)),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                )
                    .p4()
                    .box
                    .make()
                    .color(AppColors.white)
                    .cornerRadius(100)
                    .onInkTap(onTap)
                    .centered(),
              )
            ],
          ).p(15).box.make().color(AppColors.background),

          //text below image
          CustomText(
            textKey: AppStrings.advisory + model.advisoryTagName,
            size: 16,
          ).pSymmetric(h: 12),
          Text(
            model.advisory,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).pSymmetric(h: 12),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            CustomText(
              textKey: AppStrings.readmore,
              color: AppColors.primary,
            ),
            Icon(
              Icons.arrow_forward_sharp,
              color: AppColors.primary,
              size: 12,
            ),
          ]).onTap(onTap).pSymmetric(h: 12)
        ]);
  }
}

class ImagewithSingleTextCard extends StatelessWidget {
  final String? storeName;
  final String? imageUrl;
  final Function? onTap;
  const ImagewithSingleTextCard(
      {super.key, this.storeName, this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl!), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: getBoxDecorationBottom(
                  5, AppThemeColors.getColor(AppThemeColorsEnum.primary)),
              alignment: Alignment.center,
              child: CustomText(
                textKey: storeName!,
                size: 12,
                color: AppThemeColors.getColor(AppThemeColorsEnum.white),
              ),
            ).h(30),
          ).h(103).w(102),
        ],
      ),
    );
  }
}

Widget activityCard(BuildContext context,
    {required String imagePath, required String title, Function? onTap}) {
  return InkWell(
    onTap: () => onTap?.call(),
    child: Column(
      children: [
        Image.asset(
          imagePath,
          height: 40,
          width: 40,
        ),
        14.heightBox,
        CustomText(
          textKey: title,
          size: 12,
          color: AppThemeColors.getColor(AppThemeColorsEnum.bodyTextColor),
        )
      ],
    ),
  );
}

Widget bannerCard(BuildContext context,
    {required String title,
    required String description,
    required String buttonTitle,
    required String imageURL,
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
    Function? onTap}) {
  return InkWell(
    onTap: () => onTap?.call(),
    child: Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [getBoxShadow()]),
      child: Row(
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(5)),
            child: Image.network(
              imageURL,
              fit: BoxFit.cover,
            ),
          )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textKey: title,
                  size: 10,
                  bold: true,
                  color: textColor,
                ),
                Text(
                  description,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 11,
                    color: textColor,
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      textKey: buttonTitle,
                      size: 10,
                      bold: true,
                      color: textColor,
                    ),
                    4.widthBox,
                    Icon(
                      Icons.arrow_circle_right,
                      color: textColor,
                      size: 14,
                    )
                  ],
                ),
              ],
            ).p(15),
          )
        ],
      ),
    ).h(90).wFull(context).pSymmetric(v: vDefaultPadding, h: hDefaultPadding),
  );
}

Widget imageWithCenterTextCard(BuildContext context,
    {required String imageUrl, required String text, Function? onTap}) {
  return InkWell(
    onTap: () => onTap?.call(),
    child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.srgbToLinearGamma()),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [getBoxShadow()]),
      alignment: Alignment.center,
      child: CustomText(
        textKey: text,
        size: 12,
        bold: true,
        color: AppThemeColors.getColor(AppThemeColorsEnum.white),
      ),
    ).h(60).w(125).pOnly(right: listWidgetSpacing),
  );
}

Widget imageWithExpandIcon({
  required String imageUrl,
}) {
  return Stack(
    children: [
      WidgetHelper()
          .getCachedImage(imageUrl, height * 0.33, width, boxFit: BoxFit.cover),
      Positioned(
          right: 10,
          bottom: 10,
          child: Icon(
            Icons.open_in_full,
            color: AppColors.white,
          )
              .box
              .roundedFull
              .alignCenter
              .color(AppColors.invert.withOpacity(0.4))
              .p4
              .make()),
    ],
  );
}

//Crop Selected

Widget cropSelected({required String image, required String cropName}) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          WidgetHelper().getCircularCachedImage(
              "https://images.unsplash.com/photo-1511735643442-503bb3bd348a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3JvcHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
              60,
              60),
          SvgPicture.asset(ImageRoutes.selectedCrop),
          // Icon(
          //   Icons.check,
          //   color: AppColors.white,
          // ).circle(radius: 40, backgroundColor: AppColors.transperant, border: Border.all(color: AppColors.white, width: 2)).cornerRadius(50)
        ],
      ),
      5.heightBox,
      CustomText(
        textKey: cropName,
        style: AppTextStyle.bodySmall,
        color: AppColors.white,
      )
          .pSymmetric(v: 3, h: 6)
          .box
          .make()
          .color(AppColors.primary)
          .cornerRadius(25),
    ],
  );
}
