
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/main.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/POP/ClimateDto.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Routes/image_routes.dart';
import '../../../../Services/store_helper.dart';
import '../../../base_screen.dart';

class ClimateRequirement extends BaseScreen {
  final PopSectionModel model;
  const ClimateRequirement({super.key, required this.model});

  @override
  BaseScreenState<ClimateRequirement> createState() =>
      _ClimateRequirementState();
}

class _ClimateRequirementState extends BaseScreenState<ClimateRequirement> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //features
          getFeaturesWidget(widget.model),
          30.heightBox,

          //Crop Description
          CustomText(
            textKey: widget.model.climateDtos[0].remarks.toString(),
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.invert),
          ).pSymmetric(h: 5)
        ],
      ),
    );
  }

  //list of feature data
  Widget getFeaturesWidget(PopSectionModel models) {
    ClimateDto climateRequirements = models.climateDtos.isNotEmpty
        ? widget.model.climateDtos[0]
        : StoreHelper.store.popSectionModel!.climateDtos[0];

    return Row(
      children: [
        featureWidget(
                AppStrings.temperature,
                ImageRoutes.temperature,
                "${climateRequirements.annualRain?.min.toString()} - ${climateRequirements.annualRain?.max.toString()}",
                " °C",
                AppColors.primary)
            .expand(),
        featureWidget(
                AppStrings.rainfall,
                ImageRoutes.rainfall,
                "${climateRequirements.annualRain?.min.toString()} - ${climateRequirements.annualRain?.max.toString()}",
                "cm",
                AppColors.orange)
            .expand(),
        featureWidget(
                AppStrings.sowing,
                ImageRoutes.sowing,
                "${climateRequirements.annualRain?.min.toString()} - ${climateRequirements.annualRain?.max.toString()}",
                "°C",
                AppColors.primary)
            .expand(),
        featureWidget(
                AppStrings.harvesting,
                ImageRoutes.harvesting,
                "${climateRequirements.annualRain?.min.toString()} - ${climateRequirements.annualRain?.max.toString()}",
                " °C",
                AppColors.orange)
            .expand(),
      ],
    )
        .box
        .make()
        .pSymmetric(v: 10, h: 5)
        .card
        .color(AppColors.textFieldLintBackground)
        .elevation(0)
        .customRounded(getBorderRadiusAll(5))
        .make()
        .centered()
        .pSymmetric(v: 10, h: 5);
  }

  //widget used in the list
  Widget featureWidget(
    String heading,
    String image,
    String data,
    String unit,
    Color textColor,
  ) {
    return Column(
      children: [
        CustomText(
          textKey: heading,
          color: textColor,
        ),
        5.heightBox,
        Image.asset(
          image,
          width: 40,
          height: 40,
        ),
        5.heightBox,
        WidgetHelper.getRichText(navigatorKey.currentContext!, data, unit,
            textColor: textColor)
      ],
    );
  }
}
