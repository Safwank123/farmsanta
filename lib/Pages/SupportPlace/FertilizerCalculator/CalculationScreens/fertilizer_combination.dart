
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Pages/SupportPlace/FertilizerCalculator/CalculationScreens/add_crop_input.dart' show FertilizerAddCropScreen;
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../Functions/common.dart';
import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../Services/store_helper.dart';
import '../../../../Widgets/classes/style_helper.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../base_screen.dart';
import '../common.dart';

class FertilizerCombScreen extends BaseScreen {
  FertilizerCalculatorReportDto fertilizerCalculatorReportDto;
  FertilizerCombScreen(
      {super.key, required this.fertilizerCalculatorReportDto});

  @override
  BaseScreenState<FertilizerCombScreen> createState() =>
      _FertilizerCombScreenState();
}

class _FertilizerCombScreenState extends BaseScreenState<FertilizerCombScreen> {
  List<String> fertilizerCompositions = [
    AppStrings.npkComplex,
    AppStrings.potassic,
    AppStrings.zincZn,
    AppStrings.boron,
    AppStrings.phosphorousP,
    AppStrings.nitrogeneous
  ];
  List<List<String>> fertilizers = [[], [], [], [], [], []];
  List<String> selectedCombinations = [];
  @override
  void initState() {
    initateFertilizerNames();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Common(
      widget: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                textKey: AppStrings.chooseYourpreferredfertilizersCombination,
                style: AppTextStyle.titleMedium,
              ).w(width * 0.7).pSymmetric(v: 25, h: 15),
              ListView.builder(
                shrinkWrap: true,
                itemCount: fertilizerCompositions.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 35,
                        child: Container(
                          decoration: StyleHelper.getBoxDecorationAll(
                              5, AppColors.greenLight),
                          height: 45,
                          child: CustomText(
                            textKey: fertilizerCompositions[index],
                            style: AppTextStyle.labelMedium,
                            color: AppColors.background,
                          ).centered(),
                        ),
                      ),
                      5.widthBox,
                      Expanded(
                        flex: 65,
                        child: WidgetHelper.getDropDownString(
                          selectedCombinations[index],
                          (value) {
                            setState(() {
                              selectedCombinations[index] = value;
                            });
                          },
                          fertilizers[index],
                          "",
                          iconSize: 40,
                        ).h(45).cornerRadius(5),
                      )
                    ],
                  ).pOnly(left: 15, right: 35, bottom: 15);
                },
              ),
            ],
          ),
          (height * 0.07).heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Previous Button
              Container(
                decoration: StyleHelper.getBoxDecorationAll(
                  25,
                  AppColors.greenLight,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.chevron_left_sharp,
                      color: AppColors.background,
                    ).iconSize(25),
                    10.widthBox,
                    CustomText(
                      textKey: AppStrings.previous,
                      style: AppTextStyle.labelLarge,
                      color: AppColors.background,
                    ),
                  ],
                ).pSymmetric(v: 5, h: 10),
              ).onInkTap(() {
                navigateToPageReplaceMent(FertilizerAddCropScreen(
                    cropType: '1',
                    selectedCrop: 'BLACK GRAM',
                    fertilizerCalculatorReportDto:
                        widget.fertilizerCalculatorReportDto));
              }),
              //Next Button
              Container(
                decoration: StyleHelper.getBoxDecorationAll(
                  25,
                  AppColors.greenLight,
                ),
                child: Row(
                  children: [
                    CustomText(
                      textKey: AppStrings.create,
                      style: AppTextStyle.labelLarge,
                      color: AppColors.background,
                    ),
                    10.widthBox,
                    Icon(
                      Icons.chevron_right_sharp,
                      color: AppColors.background,
                    ).iconSize(25),
                  ],
                ).pSymmetric(v: 5, h: 10),
              ).onInkTap(
                () {
                  print(selectedCombinations);
                },
              ),
            ],
          ).p(10)
        ],
      ),
    );
  }

  void initateFertilizerNames() {
    for (var i in StoreHelper.store.fertilizerSourceCalculatorDetails) {
      if (i.fertilizerType == "NPK_FERTILIZERS") {
        setState(() {
          fertilizers[0].add(i.fertilizerName!);
        });
      } else if (i.fertilizerType == "BORON_FERTILIZER") {
        setState(() {
          fertilizers[3].add(i.fertilizerName!);
        });
      } else if (i.fertilizerType == "POTASSIC_FERTILIZER") {
        setState(() {
          fertilizers[1].add(i.fertilizerName!);
        });
      } else if (i.fertilizerType == "ZINC_FERTILIZER") {
        setState(() {
          fertilizers[2].add(i.fertilizerName!);
        });
      } else if (i.fertilizerType == "NITROGENOUS_FERTILIZER") {
        setState(() {
          fertilizers[5].add(i.fertilizerName!);
        });
      } else if (i.fertilizerType == "PHOSPHORUS_FERTILIZER") {
        setState(() {
          fertilizers[4].add(i.fertilizerName!);
        });
      }
    }
    setState(() {
      selectedCombinations = [
        fertilizers[0][0],
        fertilizers[1][0],
        fertilizers[2][0],
        fertilizers[3][0],
        fertilizers[4][0],
        fertilizers[5][0],
      ];
    });
  }
}
