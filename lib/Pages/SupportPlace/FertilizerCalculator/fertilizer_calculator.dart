
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/widget_helper_class.dart';
import '/themeFiles/app_colors.dart';
import './common.dart';
import '../../../../../Constants/arrays.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../Models/SupportPlace/calculator/fertilizer_fruit_calculator_details.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import 'CalculationScreens/fertilizer_recommendation.dart';
import 'CalculationScreens/soil_test_report_option.dart';

class FertilizerCalculator extends BaseScreen {
  static String routeName = '/fertilizer-calculator-screen';
  const FertilizerCalculator({super.key});

  @override
  BaseScreenState<FertilizerCalculator> createState() =>
      _FertilizerCalculatorState();
}

class _FertilizerCalculatorState extends BaseScreenState<FertilizerCalculator> {
  @override
  Widget buildWidget(BuildContext context) {
    List<FertilizerFruitCalculatorDetails> fertilizerRecommendationList =
        StoreHelper.store.fertilizerFruitCalculatorDetailsList;
    String image =
        "https://s3-alpha-sig.figma.com/img/ab44/5ed1/941179d842028951dd4647649b034e2f?Expires=1686528000&Signature=Kq5hrohw4rLndCw-dI9crVF39e~jbIWDWidP6r6qJHiyRm91WSnGsA8TV6tBx~itBPWuOHQ7AlQw1XADtQUgM91TSqCeGc-f2FY7NZH2n256ONWrEQrkYMBh6EPufGkGKkNhc11MejYAgpjwCB8KiLHpvivxKuxBHgMnZlzI6yC-a1pb5Otn~J8H7-WFk2OaEqWUERcPmi6MCLxt8IjVULJLLdQKVCqZy-DLShjp1Vji3a71kJGEeOEPpjpgj1DFCiyeN9D5oUnq-QzvyRWwdmkLbYoRrjc4Q9wNLl6M4-tDNQz2B37Cm8kK-2TWJKRBSJg2617o5JOIgoAW4f8-OA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
    return Scaffold(
      // app bar
      appBar: AppBarDesigns.getAppTitleOnly(
        AppStrings.fertilizerCalculator,
        backgroundColor: AppColors.greenLight,
        color: AppColors.white,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),

      // main body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // row below app bar
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title text
                  CustomText(
                    textKey: AppStrings
                        .calculateTheCorrectQuantityOfFertilizerYourCropNeeds,
                    color: AppColors.white,
                    bold: true,
                    size: 16,
                  ),

                  // contain button and image
                  Row(
                    children: [
                      // calculate fertilizer button
                      CustomText(
                        textKey: AppStrings.calculateFertilizer,
                        color: AppColors.greenLight,
                      )
                          .box
                          .make()
                          .centered()
                          .color(AppColors.white)
                          .cornerRadius(20)
                          .h(height * 0.04)
                          .w(width * 0.35)
                          .onInkTap(() {
                        navigateToPageWithoutReplaceMent(
                          const Common(
                            widget: SoilTestReportOption(),
                          ),
                        );
                      }),
                      120.widthBox,

                      // image
                      Hero(
                        tag: AppStrings.fertilizerCalculatorTag,
                        child: WidgetHelper()
                            .getCachedImage(image, height * 0.10, width * 0.20),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ).pSymmetric(h: 20, v: 10).color(AppColors.greenLight),

          //some spacing
          10.heightBox,

          // saved fertilizer recommendation text
          CustomText(
            textKey: AppStrings.savedFertilizerRecommendations,
            size: 16,
          ).pSymmetric(h: 20),

          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < fertilizerRecommendationList.length;
                        i++)
                      tabularDataWidget(image, fertilizerRecommendationList[i]),
                  ],
                ).p(10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabularDataWidget(
      String image, FertilizerFruitCalculatorDetails? model) {
    // Mapping fertilizer with its value
    Map<String, dynamic> fertilizerMap = {
      AppStrings.fym: model?.fym.toString(),
      AppStrings.boneMeal: model?.boneMeal.toString(),
      AppStrings.urea_46_0_0: model?.ureaU.toString(),
      AppStrings.neemKaranjcake: model?.neemKaranjCake.toString(),
      AppStrings.murateOfPotassium: model?.muriateOfPotashMOP.toString(),
      AppStrings.zincSulphate_21: model?.zincSulphate.toString(),
      AppStrings.diammoniumPhosphate: model?.diAluminiumPhosphatDAP.toString(),
      AppStrings.borax_10_5: model?.boraxB.toString(),
    };

    // time, age and area from another model
    FertilizerCalculatorReportDto fcReportDtoModel = StoreHelper
        .store.fertilizerCalculatorReportDtoList
        .firstWhere((element) => element.id == model?.id);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // image
          Stack(
            children: [
              WidgetHelper().getCachedImage(image, height * 0.20, width * 0.44,
                  boxFit: BoxFit.cover),

              // icon
              Positioned(
                right: 1,
                child: Icon(
                  size: 20,
                  Icons.more_vert,
                  color: AppColors.white,
                ),
              ),

              // crop name text
              Positioned(
                left: 2,
                top: 5,
                child: CustomText(
                  size: 5,
                  textKey:
                      '${model!.cropName} (${model.areaPerPlant} x ${model.areaPerPlant} m)',
                  color: AppColors.greenLight,
                ).p(5).box.make().color(AppColors.white).cornerRadius(20),
              ),

              Positioned(
                left: 1,
                bottom: 2,
                child: CustomText(
                  color: AppColors.white,
                  textKey: fcReportDtoModel.createdTimestamp.toString(),
                  size: 5,
                ).scale(scaleValue: 0.85),
              )
            ],
          ),

          //data in table

          // table header
          Table(
            columnWidths: const {
              0: FlexColumnWidth(7),
              1: FlexColumnWidth(4),
              2: FlexColumnWidth(2),
            },
            children: [
              TableRow(children: [
                // Fertilizer text
                CustomText(
                  color: AppColors.greenLight,
                  textKey: AppStrings.fertilizer,
                  size: 5,
                ).scale(scaleValue: 0.85),

                // Quantity text
                CustomText(
                  color: AppColors.greenLight,
                  textKey: AppStrings.quantity,
                  size: 5,
                ).scale(scaleValue: 0.85),

                // Unit text
                CustomText(
                  color: AppColors.greenLight,
                  textKey: AppStrings.unit,
                  size: 5,
                ).scale(scaleValue: 0.85),
              ]),
            ],
          ).w(width * 0.44),

          // Horizontal divider
          VxDivider(
            type: VxDividerType.horizontal,
            color: AppColors.primary,
          ).w(width * 0.44),

          // Table content
          Table(
            columnWidths: const {
              0: FlexColumnWidth(8),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
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
                      size: 5,
                    ).scale(scaleValue: 0.85),

                    // Quantity content text
                    CustomText(
                      color: AppColors.invert,
                      textKey: fertilizerMap[key],
                      size: 5,
                    ).scale(scaleValue: 0.85),

                    // Unit content text
                    CustomText(
                      color: AppColors.invert,
                      textKey: key == AppStrings.fym
                          ? AppStrings.ton
                          : AppStrings.kg,
                      size: 5,
                    ).scale(scaleValue: 0.85),
                  ]);
                },
              )
            ],
          ).w(width * 0.44),

          // Horizontal divider
          VxDivider(
            type: VxDividerType.horizontal,
            color: AppColors.primary,
          ).w(width * 0.44),

          // view details button
          TextButton(
              onPressed: () {
                navigateToPageWithoutReplaceMent(FertilizerRecommendation(
                  fertilizerFruitCalculatorDetails: model,
                  fertilizerCalculatorReportDto: fcReportDtoModel,
                ));
              },
              child: CustomText(
                textKey: AppStrings.viewDetails,
                size: 5,
                color: AppColors.greenLight,
              )).w(100).h(30).p(0)
        ],
      ),
    );
  }
}
