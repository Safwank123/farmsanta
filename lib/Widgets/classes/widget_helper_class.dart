import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Models/Common/id_name.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Services/store_helper.dart';
import '../../themeFiles/app_colors.dart';
import '../../themeFiles/app_typography.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_text.dart';
import '../Widgets/custom_text_string.dart';

//all other widgets
class WidgetHelper {
  //widget to show row with text and forward arrow
  static Widget getRowIcon(String text,
      {IconData iconData = Icons.arrow_forward_ios_rounded,
      Function? onClick,
      String trailingText = AppStrings.seeAll,
      Color color = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          textKey: text,
          size: 12,
          color: AppThemeColors.getColor(AppThemeColorsEnum.titleColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              textKey: trailingText,
              color: color,
              size: 12,
            ),
            Icon(
              iconData,
              color: color,
              size: 12,
            )
          ],
        ).onInkTap(() {
          if (onClick != null) {
            onClick();
          }
        }),
      ],
    );
  }

  static Row getTitlewithNumber(
      BuildContext context, String? title, int? itemNumber) {
    var color = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    return Row(children: [
      CustomText(
        textKey: title!,
        color: color,
        bold: true,
      ),
      Text.rich(
        TextSpan(
            text: " (",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(color: color),
            children: [
              TextSpan(
                text: itemNumber!.toString(),
              ),
              const TextSpan(
                text: ")",
              )
            ]),
      ),
    ]);
  }

  Padding getBottomButton(String textKey, Function onClick) {
    return CustomButtonElevated(text: textKey, onTap: onClick)
        .pOnly(bottom: 5, left: 19, right: 8);
  }

  static TextStyle getTextStyle(bool bold, double size, Color color) {
    return TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: size);
  }

  static Widget getRichText(BuildContext context, String text1, String text2,
      {Color textColor = primaryColor}) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: text1, style: getTextStyle(true, 13.0, textColor)),
        TextSpan(text: text2, style: getTextStyle(true, 15.0, textColor)),
      ]),
    );
  }

  static Widget getRichCustomText(
    String text1,
    String text2, {
    TextStyle? style1,
    TextStyle? style2,
  }) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CustomText(
              textKey: text1,
              style: style1,
            )),
        WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CustomText(
              textKey: text2,
              style: style2,
            )),
      ]),
    );
  }

  Widget getBackButton(BuildContext context) {
    bool canPop = Navigator.canPop(context);
    return IconButton(
        onPressed: () {
          if (canPop) {
            Navigator.pop(context);
          }
        },
        icon: canPop
            ? Icon(
                Icons.arrow_back,
                color: AppThemeColors.getColor(AppThemeColorsEnum.background),
              )
            : const SizedBox());
  }

  Widget getDividerApp() {
    return const Divider(
      thickness: 1,
      color: primaryColor,
    );
  }

  Widget getDividerAsh() {
    return const Divider(
      thickness: 1,
      color: dividerColor,
    );
  }

  Widget getDividerAshThick() {
    return const Divider(
      thickness: 2.5,
      color: dividerColor,
    );
  }

  Widget getDividerAshLight() {
    return const Divider(
      thickness: 0.5,
      color: dividerColor,
    );
  }

  Widget getCachedImage(String image, double height, double width,
      {BoxFit? boxFit}) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage);
        return FadeInImage(
          placeholder: Image.memory(kTransparentImage).image,
          image: imageProvider,
          fit: boxFit,
        );
      },
    );
  }

  Widget getCircularCachedImage(String image, double height, double width) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage);
        return CircleAvatar(
          backgroundColor: transparentColor,
          foregroundImage: imageProvider,
        );
      },
    );
  }

  Widget getCachedImageWithout(String image, {BoxFit? boxFit}) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        // return FadeInImage.memoryNetwork(
        //     placeholder: kTransparentImage, image: image);
        return FadeInImage(
          placeholder: Image.memory(kTransparentImage).image,
          image: imageProvider,
          fit: boxFit,
        );
      },
    );
  }

  static Widget getCircularAvatar(String image, {double maxRadius = 16}) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          foregroundImage: imageProvider,
          maxRadius: maxRadius,
        );
      },
    );
  }

  //Profile Info Container
  Widget getInfoContainers(
      BuildContext context, String? image, String? label, String? text) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: getBoxDecorationAll(20, textFieldLightColor),
      child: Row(
        children: [
          WidgetHelper().getCachedImage(image!, 50, 50).p(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  textKey: label!,
                  capatilize: true,
                  style: getTextStyle(false, 14,
                      AppThemeColors.getColor(AppThemeColorsEnum.invert))),
              CustomTextString(
                  text: text!,
                  capatilize: true,
                  style: getTextStyle(true, 16, primaryColor))
            ],
          ).pOnly(left: 5)
        ],
      ),
    ).pSymmetric(h: 10, v: 5);
  }

  //for profile address box
  Widget getInfoText(BuildContext context, String? label, String? text) {
    return Row(
      children: [
        CustomText(
                textKey: label!,
                capatilize: true,
                style: getTextStyle(false, 14,
                    AppThemeColors.getColor(AppThemeColorsEnum.invert)))
            .wPCT(context: context, widthPCT: 18),
        Text(
          ": ",
          style: getTextStyle(false, 14, primaryColor),
        ),
        CustomTextString(
            text: text!,
            capatilize: true,
            style: getTextStyle(true, 14, primaryColor))
      ],
    );
  }

  //Widget to create a drop down
  static Widget getDropDown(String hint, int selectedValue, Function onChange,
      List<String> valueArrray,
      {bool showBackgroundColor = false,
      Color? backgroundColor = primaryColor}) {
    return DropdownButton<String>(
      dropdownColor: showBackgroundColor == false
          ? AppThemeColors.getColor(AppThemeColorsEnum.textFieldLintBackground)
          : backgroundColor,
      alignment: AlignmentDirectional.centerStart,
      isExpanded: true,
      underline: const SizedBox(),
      iconSize: 30,
      iconEnabledColor: AppThemeColors.getColor(AppThemeColorsEnum.primary),
      hint: CustomText(
          textKey: hint,
          color: AppThemeColors.getColor(AppThemeColorsEnum.invert)),
      items: valueArrray.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CustomText(
              textKey: value,
              bold: true,
            ),
          ),
        );
      }).toList(),
      value: valueArrray[selectedValue],
      onChanged: (value) {
        onChange(value);
      },
    ).px8();
  }

  //Widget to create a drop down
  static Widget getDropDownString(String? selectedValue, Function onChange,
      List<String> valueArrray, String hint,
      {double iconSize = 30}) {
    var color =
        AppThemeColors.getColor(AppThemeColorsEnum.textFieldLintBackground);
    return DropdownButton<String>(
      dropdownColor: color,
      alignment: AlignmentDirectional.centerStart,
      isExpanded: true,
      underline: const SizedBox(),
      iconSize: iconSize,
      iconEnabledColor: AppThemeColors.getColor(AppThemeColorsEnum.primary),
      hint: CustomText(
          textKey: hint,
          color: AppThemeColors.getColor(AppThemeColorsEnum.invert)),
      items: valueArrray.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CustomText(
              textKey: value,
              bold: true,
            ),
          ),
        );
      }).toList(),
      value: selectedValue,
      onChanged: (value) {
        onChange(value);
      },
    ).px8().backgroundColor(color);
  }

  //text field with title
  static Widget getTextFieldWithTitle(String text) {
    return Column(
      children: [
        CustomText(textKey: text),
      ],
    );
  }

  //Image picker widget bottom sheet
  static void showAttachmentDialog(BuildContext context, Function getImage) {
    showModalBottomSheet(
        context: context,
        shape: StyleHelper.cardShapeBorderTop(16),
        builder: (BuildContext context1) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              15.heightBox,
              CustomText(
                textKey: AppStrings.selectAttachment,
                size: 15,
              ).pOnly(left: 15),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        getImage(false);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                      )),
                  IconButton(
                      onPressed: () {
                        getImage(true);
                      },
                      icon: const Icon(
                        Icons.image,
                      )),
                ],
              ),
              20.heightBox,
            ],
          ).wFull(context);
        });
  }

  //widget to get text field with title
  static List<Widget> getNameAndInputField(
      String name, TextEditingController controller, BuildContext context,
      {bool isEmail = false,
      bool isMob = false,
      double width = 64,
      bool isRequired = false,
      Color? fillColor,
      String? countryCode,
      Function? onChange}) {
    return <Widget>[
      15.heightBox,
      // isRequired?://TODO
      CustomText(
        textKey: name,
        bold: true,
      ),
      CustomInputField(
        hint: name,
        fillColor: fillColor,
        textEditingController: controller,
        isEmail: isEmail,
        isMobileNumber: isMob,
        prefixWidget: countryCode != null
            ? CountryCodePicker(
                initialSelection: countryCode,
                onChanged: (value) {
                  onChange!(value.dialCode!);
                },
                flagWidth: 10,
                showDropDownButton: false,
                padding: const EdgeInsetsDirectional.all(0),
              )
            : null,
      ).wPCT(context: context, widthPCT: width)
    ];
  }

  //Widget to get radiolist
  static Widget getRadio(String text, Function onChange, bool value) {
    return RadioListTile(
      title: CustomText(textKey: text), //how to pass translationenum here
      onChanged: (value) {
        onChange(value);
      },
      value: value,
      activeColor: AppThemeColors.getColor(AppThemeColorsEnum.primary),
      groupValue: true,
    );
  }

  //cicular progress widget
  static Widget getCircularProgress() {
    return SizedBox();
  }

  //vx builder with dropDown
  static Widget getVxBuilderWithDropDown(
      Set<Type> mutations, Function onChange, SignUpEnum key, String value,
      {double width = 64, String label = "", double iconSize = 30}) {
    return VxBuilder(
        builder: (context, store, status) {
          List<String> strings = StoreHelper.getStringList(key);
          String? v1;
          if (strings.isEmpty) {
            strings.add(label);
          } else {
            if (value != "") {
              v1 = value;
            } else {
              v1 = strings[0];
            }
          }
          return StatefulBuilder(
            builder: (context, setState) {
              return WidgetHelper.getDropDownString(v1, (value) {
                if (value != label) {
                  onChange(value);
                  setState(() {
                    v1 = value;
                  });
                }
              }, strings, label, iconSize: iconSize)
                  .wPCT(context: context, widthPCT: width);
            },
          );
        },
        mutations: mutations);
  }

  //vx builder with dropDown id model
  static Widget getVxBuilderWithDropDownIdModel(Set<Type> mutations,
      Function onChange, IdNameModelEnum key, IdNameModel? value, String label,
      {double width = 64}) {
    return VxBuilder(
        builder: (context, store, status) {
          List<IdNameModel> ids = StoreHelper.getIdNameList(key);
          List<String> strings = ids.map((e) => e.name).toList();
          String? v1;
          if (strings.isEmpty) {
            strings.add(label);
          } else {
            if (value != null) {
              v1 = value.name;
            }
          }
          return StatefulBuilder(
            builder: (context, setState) {
              return WidgetHelper.getDropDownString(v1, (String value) {
                if (value != "") {
                  if (value != label) {
                    onChange(ids[strings.indexOf(value)]);
                    setState(() {
                      v1 = value;
                    });
                  }
                }
              }, strings, label)
                  .wPCT(context: context, widthPCT: width);
            },
          );
        },
        mutations: mutations);
  }

  //chip with close icon
  static Widget getTextAndIconChip(
      String text, bool selected, Color white, Color black, Color prime,
      {bool showClose = false, Function? onTap}) {
    print("key are $text");
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: selected ? prime : white,
          border: Border.all(color: prime)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(textKey: text, color: selected ? white : black),
          if (selected && showClose)
            Icon(
              Icons.close,
              color: white,
            )
        ],
      ).py8().px16(),
    ).onInkTap(() {
      if (onTap != null) {
        onTap();
      }
    }).py8();
  }

  //Icon with text chip
  static Widget getIconText(String text, IconData icon,
      {Function? onTap, Color? color, Color? iconColor, TextStyle? textStyle}) {
    print("key are $text");
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
          5.widthBox,
          CustomText(
            textKey: text,
            color: color,
            style: textStyle,
          ),
        ],
      ),
    ).onInkTap(() {
      if (onTap != null) {
        onTap();
      }
    });
  }

  //Custom Pill Shaped Tabs
  static TabBar customPillTabBar(
      {required TabController tabController,
      required List<String> tabTitles,
      required Color selectedColor}) {
    return TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicator: getBoxDecorationAll(25, selectedColor),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        tabs: [
          for (int i = 0; i < tabTitles.length; i++) ...{
            CustomText(
              textKey: tabTitles[i],
            ).pSymmetric(v: 6, h: 8)
          }
        ]);
  }

  //Custom Pill shaped weather Tabs
  static TabBar customPillWeatherTabBar(
      {Function(int)? onPressed,
      required TabController tabController,
      required List<String> tabTitles,
      required Color selectedColor,
      required Color unSelectedColor}) {
    return TabBar(
      controller: tabController,
      onTap: onPressed,
      dividerColor: Colors.transparent,
      indicator: getBoxDecorationAll(25, Colors.transparent),
      labelColor: AppColors.background,
      unselectedLabelColor: AppColors.background,
      isScrollable: false,
      tabs: [
        for (int i = 0; i < tabTitles.length; i++) ...{
          CustomText(
            textKey: tabTitles[i],
          )
              .pSymmetric(v: 8, h: 15)
              .backgroundColor(
                  tabController.index == i ? selectedColor : unSelectedColor)
              .cornerRadius(25)
        }
      ],
    );
  }

  // List of widgets contain heading, data and spacing
  static List<Widget> headingDescriptionWidgetList(
      {required String? title,
      required String? data,
      Color? titleColor = primaryColor,
      Color? dataColor = Colors.grey}) {
    return <Widget>[
      // heading
      CustomText(
        textKey: title!,
        color: titleColor,
      ),

      // data
      CustomText(
        textKey: data!,
        color: dataColor,
      ),

      // spacing after each section
      17.heightBox,
    ];
  }

// Search-Bar Only
  static Widget searchBarOnly(String hintText, TextEditingController controller,
      {Widget? suffixWidget}) {
    return Row(
      children: [
        //Search InputBox
        CustomInputField(
                suffixWidget: suffixWidget ??
                    Icon(
                      Icons.search,
                      size: 25,
                      color: AppColors.gray,
                    ),
                prefixWidget: Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.gray,
                ),
                showIcon: true,
                hint: hintText,
                textEditingController: controller,
                borderRadius: 25,
                fillColor: AppColors.grayLight)
            .expand(flex: 7),
        10.widthBox,
      ],
    );
  }

  // Search-Bar with Trailing icon
  static Widget searchBarAndTrailingIcon(
      {required String hintText,
      required Icon icon,
      Color? backgroundColor = primaryColor}) {
    return Row(
      children: [
        //Search InputBox
        CustomInputField(
                prefixWidget: Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.gray,
                ),
                showIcon: true,
                hint: hintText,
                textEditingController: TextEditingController(),
                borderRadius: 25,
                fillColor: AppColors.grayLight)
            .expand(flex: 7),
        10.widthBox,

        // icon
        icon
            .p8()
            .box
            .make()
            .cornerRadius(100)
            .color(backgroundColor!)
            .cornerRadius(25),
      ],
    );
  }

  //search bar with trailing and post icon

  static Widget searchbarwithbothsideicon(
    String hinttext,
  ) {
    return CustomInputField(
      prefixWidget: Icon(
        MaterialSymbols.search,
        size: 25,
        color: AppColors.subHeading,
      ).onTap(() {}),

      showIcon: true,
      hint: hinttext,
      textEditingController: TextEditingController(),
      borderRadius: 25,
      fillColor: AppColors.grayLight,

      //filter icon
      suffixWidget: Icon(
        MaterialSymbols.search,
        size: 25,
        color: AppColors.subHeading,
      ).onTap(() {}),
    ).p12();
  }

  // mascot image with FarmSanta text

  static Widget mascotImageWithFarmSanta() {
    return Positioned(
      top: 0,
      left: 0,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Image(
              image: AssetImage(ImageRoutes.mascotIntroImage),
              height: 35,
              width: 35,
            ),
            5.widthBox,
            CustomText(
              textKey: AppStrings.farmsanta,
              bold: true,
              color: AppColors.white,
            )
          ],
        )
            .p(6)
            .box
            .make()
            .color(AppColors.black.withOpacity(0.4))
            .cornerRadius(100)
            .centered(),
      ]).w(width).p8(),
    );
  }

  //pop icon buttons

  static InkWell iconButton(IconData icon, String title, dynamic onTap) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          10.heightBox,
          Icon(icon),
          5.heightBox,
          CustomText(textKey: title)
        ]).h(100).w(100).cornerRadius(25).onInkTap(onTap);
  }

  //pop keyValue
  Widget keyValueText(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: key,
          color: primaryColor,
          style: AppTextStyle.titleSmall,
        ).expand(flex: 3),
        10.widthBox,
        CustomText(
          textKey: ":",
          style: TextStyle(color: AppColors.primary),
        ),
        CustomText(
          textKey: value,
          color: Colors.grey,
          style: AppTextStyle.titleSmall,
        ).expand(flex: 6)
      ],
    );
  }

  //filter tabs
  static Widget filterTab(String category, String plant, Color colours) {
    return CustomText(
      textKey: '$category: $plant',
      color: AppColors.white,
    ).p8().box.make().color(colours).cornerRadius(100).centered();
  }

  // rating review tag widget
  static Widget ratingReviewTag({required double rating, int? noOfReviewsInK}) {
    return Row(
      children: [
        CustomText(
          textKey: " ⭐",
          size: 5,
        ),

        // store rating
        CustomText(
          textKey: " $rating ",
          bold: true,
          size: 5,
        ),

        // store review
        noOfReviewsInK == null
            ? 1.heightBox
            : CustomText(
                textKey: "(${noOfReviewsInK}K) ",
                color: AppColors.gray,
                size: 5,
              ),
      ],
    );
  }

// simple custom chip widget
  static Widget chip({required String text}) {
    return Container(
      height: 20,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.circular(15)),
      child: CustomText(
        textKey: text,
        color: AppColors.gray,
      ).scale(scaleValue: 0.7).p(2),
    );
  }
}
