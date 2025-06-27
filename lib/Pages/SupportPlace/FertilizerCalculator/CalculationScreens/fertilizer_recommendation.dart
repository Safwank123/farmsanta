import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../base_screen.dart';
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/app_bar.dart';
import '../../../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../Models/SupportPlace/calculator/fertilizer_fruit_calculator_details.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../../../../themeFiles/app_typography.dart';

class FertilizerRecommendation extends BaseScreen {
  static String routeName = '/fertilizer-recommendation-screen';
  final FertilizerFruitCalculatorDetails fertilizerFruitCalculatorDetails;
  final FertilizerCalculatorReportDto fertilizerCalculatorReportDto;
  const FertilizerRecommendation(
      {super.key,
      required this.fertilizerFruitCalculatorDetails,
      required this.fertilizerCalculatorReportDto});

  @override
  BaseScreenState<FertilizerRecommendation> createState() =>
      _FertilizerRecommendationState();
}

class _FertilizerRecommendationState
    extends BaseScreenState<FertilizerRecommendation> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        AppStrings.fertilizerRecommendation,
        backgroundColor: AppColors.greenLight,
        color: AppColors.white,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),

      backgroundColor: AppColors.greenLight,

      // main body
      body: Column(
        children: [
          // report widget
          reportWidget(
              widget.fertilizerFruitCalculatorDetails,
              widget.fertilizerCalculatorReportDto.ageOfPlant!,
              widget.fertilizerCalculatorReportDto.area!),

          // some spacing
          15.heightBox,

          // urea fertilizer schedule widget
          ureaFertilizerSchedule(),
        ],
      ),
    );
  }

  Widget reportWidget(
      FertilizerFruitCalculatorDetails model, int cropAge, int cropArea) {
    Map<String, dynamic> fertilizerMap = {
      AppStrings.fym: model.fym.toString(),
      AppStrings.boneMeal: model.boneMeal.toString(),
      AppStrings.urea_46_0_0: model.ureaU.toString(),
      AppStrings.neemKaranjcake: model.neemKaranjCake.toString(),
      AppStrings.murateOfPotassium: model.muriateOfPotashMOP.toString(),
      AppStrings.zincSulphate_21: model.zincSulphate.toString(),
      AppStrings.diammoniumPhosphate: model.diAluminiumPhosphatDAP.toString(),
      AppStrings.borax_10_5: model.boraxB.toString(),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // report card widget
        // crop text
        CustomText(
          size: 5,
          textKey: AppStrings.crop,
          color: AppColors.white,
        )
            .centered()
            .w(50)
            .h(30)
            .box
            .make()
            .color(AppColors.greenLight)
            .cornerRadius(20)
            .p(10),

        // row containing text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            keyValueWidget(AppStrings.cropAge,
                cropAge.toString()), //TODO: To change according to model
            keyValueWidget(AppStrings.cropArea,
                '$cropArea ${AppStrings.hectare}'), //TODO: To change according to model
          ],
        ).pSymmetric(h: 10, v: 10),

        // Horizontal divider
        VxDivider(
          type: VxDividerType.horizontal,
          color: AppColors.greenLight,
        ),

        // some spacing
        5.heightBox,

        // table header
        Table(
          columnWidths: const {
            0: FlexColumnWidth(8),
            1: FlexColumnWidth(4),
            2: FlexColumnWidth(2),
          },
          children: [
            TableRow(children: [
              // Fertilizer text
              CustomText(
                color: AppColors.greenLight,
                textKey: AppStrings.fertilizer,
                size: 8,
              ),

              // Quantity text
              CustomText(
                color: AppColors.greenLight,
                textKey: AppStrings.quantity,
                size: 8,
              ),

              // Unit text
              CustomText(
                color: AppColors.greenLight,
                textKey: AppStrings.unit,
                size: 8,
              ),
            ]),
          ],
        ).pOnly(left: 10),

        // some spacing
        5.heightBox,

        // Horizontal divider
        VxDivider(
          type: VxDividerType.horizontal,
          color: AppColors.greenLight,
        ),

        // Table content
        Table(
          columnWidths: const {
            0: FlexColumnWidth(8),
            1: FlexColumnWidth(7),
            2: FlexColumnWidth(3),
          },
          children: [
            ...fertilizerMap.keys.map(
              (key) {
                return TableRow(children: [
                  // Fertilizer name text
                  CustomText(
                    style: AppTextStyle.bodySmall.copyWith(fontSize: 2),
                    color: AppColors.greenLight,
                    textKey: key,
                    size: 2,
                  ).box.make().p(5),

                  // Quantity content text
                  CustomText(
                    textAlign: TextAlign.center,
                    color: AppColors.invert,
                    textKey: fertilizerMap[key],
                    size: 3,
                  ),

                  // Unit content text
                  CustomText(
                    textAlign: TextAlign.center,
                    color: AppColors.invert,
                    textKey:
                        key == AppStrings.fym ? AppStrings.ton : AppStrings.kg,
                    size: 3,
                  ),
                ]);
              },
            )
          ],
        ).pOnly(left: 10),

        10.heightBox,
      ],
    )
        .w(double.infinity)
        .color(AppColors.white)
        .cornerRadius(5)
        .pSymmetric(h: 10, v: 5);
  }

  Widget ureaFertilizerSchedule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: AppStrings.ureaFertilizerSchedule,
          color: AppColors.greenLight,
          bold: true,
        ).p(10),

        // Horizontal divider
        VxDivider(
          type: VxDividerType.horizontal,
          color: AppColors.greenLight,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              size: 8,
              textKey: AppStrings.fertilizerSchedule,
              color: AppColors.greenLight,
            ),
            CustomText(
              size: 8,
              textKey: AppStrings.quantity,
              color: AppColors.greenLight,
            ),
          ],
        ).p(10),
      ],
    )
        .w(double.infinity)
        .color(AppColors.white)
        .cornerRadius(5)
        .pSymmetric(h: 10, v: 5);
  }

  Widget keyValueWidget(String key, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          size: 5,
          textKey: '$key:',
          color: AppColors.greenLight,
        ),
        5.widthBox,
        CustomText(
          size: 5,
          textKey: value,
          color: AppColors.greenLight,
        ),
      ],
    );
  }
}
