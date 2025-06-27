
import 'package:farmsanta_new/Models/SupportPlace/farmscout/farm_scouting.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../Constants/colors.dart';
import '../../../../../../Functions/common.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../../Widgets/classes/style_helper.dart';
import '../../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../../../../themeFiles/app_typography.dart';
import '../../../../../Constants/strings.dart';
import '../../../../Services/store_helper.dart';
import '../DetailScreens/pending_query.dart';
import '../DetailScreens/solved_query.dart';

Widget myQueriesCard({
  required String buttonText,
  required bool isSolved,
  required FarmScouting farmScoutingModel,
}) {
  // properties in map
  var propertyMap = {
    0: AppStrings.crop,
    1: AppStrings.growthStage,
    2: AppStrings.plantPartIssue,
  };

  // values in map
  var valueMap = {
    0: farmScoutingModel.crop,
    1: farmScoutingModel.cropStage,
    2: farmScoutingModel.images
        .where(
            (image) => image.status == AppStrings.solved.trim().toLowerCase())
        .toList()[0]
        .plantPart,
  };

  return Column(
    // mainAxisSize: MainAxisSize.max,
    children: [
      Stack(
        children: [
          // image
          WidgetHelper()
              .getCachedImageWithout(farmScoutingModel.images[0].image!),

          // date on top of image
          Positioned(
            bottom: 5,
            left: 5,
            child: CustomText(
                    textKey: DateFormat('d MMMM, y').format(
                        DateTime.parse(farmScoutingModel.createdTimestamp!)),
                    style:
                        AppTextStyle.bodySmall.copyWith(color: AppColors.white))
                .pSymmetric(v: 5, h: 10)
                .glassMorphic(blur: 4)
                .box
                .make()
                .color(AppColors.invert.withOpacity(0.1))
                .cornerRadius(15)
                .centered(),
          )
        ],
      ),

      // property and value
      for (int i = 0; i < 3; i++)
        Expanded(
          child: propertyValueWidget(
              propertyColor: AppColors.gray,
              property: propertyMap[i]!,
              value: valueMap[i]!),
        ),

      // some spacing
      5.heightBox,

      // button and icon
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            size: 18,
            isSolved
                ? Icons.check_circle_outline_outlined
                : Icons.question_mark_sharp,
            color: AppColors.white,
          ),
          CustomText(
            textKey: isSolved ? AppStrings.viewSolution : AppStrings.viewQuery,
            color: AppColors.white,
          )
        ],
      )
          .pSymmetric(v: 5, h: 10)
          .h(height * 0.035)
          .box
          .make()
          .color(AppColors.primary)
          .cornerRadius(15)
          .centered()
          .onInkTap(() {
        if (isSolved) {
          navigateToPageWithoutReplaceMent(SolvedQuery(
            title: valueMap[0]!,
            advisoryDetails: StoreHelper.store.advisoryDetails!,
            advisoryTable: StoreHelper.store.advisoryTable!,
            farmScoutingModel: farmScoutingModel,
          ));
        } else {
          navigateToPageWithoutReplaceMent(PendingQuery(
            title: valueMap[0]!,
            farmScoutingModel: farmScoutingModel,
          ));
        }
      }),
    ],
  ).pSymmetric(h: 5, v: 10).box.make().color(AppColors.grayLight);
}

// widget contain property and value in row
Widget propertyValueWidget(
    {required String property,
    required String value,
    Color propertyColor = primaryColor,
    Color valueColor = primaryColor}) {
  return Row(
    children: [
      CustomText(
        textKey: '$property:',
        color: propertyColor,
      ),
      5.widthBox,
      CustomText(
        textKey: value,
        color: valueColor,
      ),
    ],
  );
}
