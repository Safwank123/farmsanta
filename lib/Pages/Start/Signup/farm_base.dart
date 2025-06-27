
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Pages/Start/Signup/farm_draw.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../base_screen.dart';

class FarmScreen extends BaseScreen {
  static const routeName = "/farm-base-screen";
  const FarmScreen({super.key});

  @override
  BaseScreenState<FarmScreen> createState() => _FarmScreenState();
}

class _FarmScreenState extends BaseScreenState<FarmScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    var color = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    var c2 = AppThemeColors.getColor(AppThemeColorsEnum.textFieldBackground);
    return WillPopScope(
      onWillPop: () async {
        if (page2) {
          page2 = false;
          setState(() {});
          return false;
        }

        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Container(
              color: AppThemeColors.getColor(AppThemeColorsEnum.locationBackground),
              child: Image.asset(
                ImageRoutes.locationImage,
                height: 60,
                width: 60,
                fit: BoxFit.scaleDown,
              ).h(60).w(60),
            ).hHalf(context).wFull(context),
            Expanded(
              child: page2
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.chevron_left,
                            color: color,
                            size: 34,
                          ).onInkTap(() {
                            setState(() {
                              page2 = false;
                            });
                          }),
                          ...WidgetHelper.getNameAndInputField(
                              AppStrings.registrationNumber,
                              controllers[0],
                              context,
                              fillColor: c2,
                              width: 100),
                          ...WidgetHelper.getNameAndInputField(
                              AppStrings.nameThisFarmLocation,
                              controllers[1],
                              context,
                              fillColor: c2,
                              width: 100),
                          15.heightBox,
                          CustomInputField(
                                  hint: AppStrings.landArea,
                                  fillColor: c2,
                                  textEditingController: controllers[2])
                              .w64(context),
                          15.heightBox,
                          //TODO water source and unit of measurement
                          Row(
                            children: List.generate(crops.length, (index) {
                              return CardHelper.cropCard(
                                  context, crops[index], color);
                            }),
                          ),
                          15.heightBox, 
                          CustomButtonElevated(
                                  text: AppStrings.addFarm,
                                  onTap: () {
                                    //TODO
                                  })
                              .w64(context)
                              .centered(),
                          15.heightBox,
                        ],
                      ).px12().wFull(context),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          textKey: AppStrings.addLandLocation,
                          color: color,
                          bold: true,
                          size: 12,
                        ),
                        15.heightBox,
                        Card(
                          shape: StyleHelper.cardShapeBorder(24),
                          color: color,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppThemeColors.getColor(AppThemeColorsEnum.white),
                              ),
                              10.widthBox,
                              CustomText(
                                textKey: AppStrings.trackCurrentLocation,
                                bold: true,
                                size: 12,
                                color: AppThemeColors.getColor(AppThemeColorsEnum.white),
                              )
                            ],
                          ).py8().px12(),
                        ).onInkTap(() {
                          StyleHelper.navigateToPageWithoutReplaceMentNamed(
                              FarmDrawScreen.routeName);
                        }),
                        15.heightBox,
                        CustomText(
                          textKey: AppStrings.addLocation,
                          color: color,
                          bold: true,
                          size: 12,
                          underLine: true,
                        ).onInkTap(() {
                          setState(() {
                            page2 = true;
                          });
                        }),
                      ],
                    ),
            )
          ],
        ).wFull(context).hFull(context)),
      ),
    );
  }

  bool page2 = false;
  List<TextEditingController> controllers = StyleHelper.getTextController(3);
  List<CropModelShort> crops = StoreHelper.store.cropsListSelected;
}
