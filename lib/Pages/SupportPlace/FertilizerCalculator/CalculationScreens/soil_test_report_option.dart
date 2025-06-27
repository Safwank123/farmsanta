
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../base_screen.dart';
import '../common.dart';
import 'soil_health_report.dart';
import 'soil_test_selectcrops.dart';

class SoilTestReportOption extends BaseScreen {
  const SoilTestReportOption({super.key});

  @override
  BaseScreenState<SoilTestReportOption> createState() => _SoilTestReportOptionState();
}

class _SoilTestReportOptionState extends BaseScreenState<SoilTestReportOption> {
  FertilizerCalculatorReportDto fertilizerCalculatorReportDto = FertilizerCalculatorReportDto();
  String option = AppStrings.no;
  bool isYes = false;
  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // soil health text
        CustomText(
          textKey: AppStrings.soilHealth,
          color: AppColors.greenLight,
          size: 16,
          bold: true,
        ).pSymmetric(h: 20),

        10.heightBox,

        // do you have soil test report test text
        CustomText(
          textKey: AppStrings.doYouHaveSoilTestReport,
          color: AppColors.greenLight,
          size: 14,
          bold: true,
        ).pSymmetric(h: 20),

// radio button row
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // yes radio button
            Radio(
                activeColor: AppColors.greenLight,
                value: AppStrings.yes,
                groupValue: option,
                onChanged: (value) {
                  setState(() {
                    option = value.toString();
                    isYes = true;
                  });
                }).pOnly(left: 2),

            //yes text
            CustomText(
              size: 15,
              textKey: AppStrings.yes,
              color: isYes ? AppColors.greenLight : AppColors.gray,
            ),

            //some spacing
            15.widthBox,

            // no radio button
            Radio(
                activeColor: AppColors.greenLight,
                value: AppStrings.no,
                groupValue: option,
                onChanged: (value) {
                  setState(() {
                    option = value.toString();
                    isYes = false;
                  });
                }),

            // no text
            CustomText(
                size: 15,
                textKey: AppStrings.no,
                color: isYes ? AppColors.gray : AppColors.greenLight),
          ],
        ),

        (height * 0.40).heightBox,
        nextButton().objectBottomRight().onInkTap(() {
          if (option == AppStrings.no) {
            navigateToPageReplaceMent(
              Common(
                widget: SoilTestSelectCrops(
                    fertilizerCalculatorReportDto:
                        fertilizerCalculatorReportDto),
              ),
            );
          } else {
            navigateToPageReplaceMent(
              Common(
                widget: SoilHealthReport(
                    fertilizerCalculatorReportDto:
                        fertilizerCalculatorReportDto),
              ),
            );
          }
        })
      ],
    ).pSymmetric(v: 10).h(height * 0.60);
  }

  Widget nextButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        5.widthBox,
        CustomText(
          size: 12,
          textKey: AppStrings.next,
          color: AppColors.white,
        ),
        5.widthBox,
        Icon(
          size: 10,
          Icons.arrow_forward_ios,
          color: AppColors.white,
        ),
        5.widthBox,
      ],
    )
        .p(2)
        .box
        .make()
        .h(25)
        .color(AppColors.greenLight)
        .cornerRadius(20)
        .pOnly(right: 10);
  }
}
