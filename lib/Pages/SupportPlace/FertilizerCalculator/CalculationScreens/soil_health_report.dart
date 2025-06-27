// ignore_for_file: must_be_immutable


import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../Constants/strings.dart';
import '../../../../../../Functions/common.dart';
import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../base_screen.dart';
import '../common.dart';
import 'soil_test_report_option.dart';
import 'soil_test_selectcrops.dart';

class SoilHealthReport extends BaseScreen {
  FertilizerCalculatorReportDto fertilizerCalculatorReportDto;
  SoilHealthReport({Key? key, required this.fertilizerCalculatorReportDto})
      : super(key: key);

  @override
  BaseScreenState<SoilHealthReport> createState() => _SoilHealthReportState();
}

class _SoilHealthReportState extends BaseScreenState<SoilHealthReport> {
  List FirsttextField = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  TextEditingController nitrogen = TextEditingController();
  TextEditingController phosphorous = TextEditingController();
  TextEditingController potassium = TextEditingController();
  TextEditingController zinc = TextEditingController();
  TextEditingController boron = TextEditingController();
  TextEditingController sulphur = TextEditingController();
  TextEditingController ph = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    List controller = [
      nitrogen,
      phosphorous,
      potassium,
      zinc,
      boron,
      sulphur,
      ph
    ];
    List details = [
      AppStrings.nitrogenN,
      AppStrings.phosphorousP,
      AppStrings.potassiumK,
      AppStrings.zincZn,
      AppStrings.boronB,
      AppStrings.sulphurS,
      AppStrings.pH,
      AppStrings.nitrogenN,
    ];
    List units = [
      AppStrings.kgha,
      AppStrings.kgha,
      AppStrings.kgha,
      AppStrings.ppm,
      AppStrings.ppm,
      AppStrings.kgha,
      AppStrings.notapplied
    ];

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            CustomText(
              textKey: AppStrings.soilHealth,
              color: AppColors.greenLight,
              size: 16,
              bold: true,
            ).pSymmetric(h: 12, v: 30),

            // card of details of Soil test Report
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    textKey: AppStrings.enterDetailsofSoiltestReport,
                    bold: true,
                  ).p8(),
                  Column(children: [
                    for (int i = 0; i < 7; i++)
                      Row(
                        children: [
                          // initial textfield
                          Row(
                            children: [
                              if (FirsttextField[i] == true)
                                Row(
                                  children: [
                                    TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            FirsttextField[i] = false;
                                          });
                                        },
                                        controller: controller[i],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: details[i],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10),
                                            hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Vx.gray300),
                                            ))).wHalf(context),
                                    2.widthBox,
                                    CustomText(textKey: units[i])
                                  ],
                                )
                            ],
                          ),

                          // after changed textfield
                          Row(
                            children: [
                              if (FirsttextField[i] == false)
                                Row(
                                  children: [
                                    TextField(
                                        onChanged: (value) {
                                          print(value);
                                          if (value == '') {
                                            setState(() {
                                              FirsttextField[i] = true;
                                            });
                                          }
                                        },
                                        controller: controller[i],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            hintText: details[i],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10),
                                            hintStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1, color: Vx.gray300),
                                            ))).wOneForth(context),
                                    CustomText(
                                      textKey: details[i],
                                      style: TextStyle(color: AppColors.white),
                                    )
                                        .w32(context)
                                        .pSymmetric(v: 12, h: 12)
                                        .box
                                        .make()
                                        .color(Colors.lightGreen)
                                        .centered()
                                        .cornerRadius(1),
                                    2.widthBox,
                                    CustomText(textKey: units[i]),
                                    10.widthBox,
                                    CustomText(
                                      textKey: AppStrings.low,
                                      color: AppColors.red,
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ],
                      ).p4()
                  ])
                ],
              ).color(AppColors.grayLight),
            ).px12(),

            // bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton().objectBottomLeft().onTap(() {
                  navigateToPageReplaceMent(const Common(
                    widget: SoilTestReportOption(),
                  ));
                }),
                NextButton().objectBottomRight().onTap(() {
                  widget.fertilizerCalculatorReportDto.nitrogenN =
                      int.parse(nitrogen.text);
                  widget.fertilizerCalculatorReportDto.phosphorusP =
                      int.parse(phosphorous.text);
                  widget.fertilizerCalculatorReportDto.photassiumK =
                      int.parse(potassium.text);
                  widget.fertilizerCalculatorReportDto.zincZn =
                      int.parse(zinc.text);
                  widget.fertilizerCalculatorReportDto.borronB =
                      int.parse(boron.text);
                  widget.fertilizerCalculatorReportDto.sulphurS =
                      int.parse(sulphur.text);
                  widget.fertilizerCalculatorReportDto.potentialHydrogenPh =
                      int.parse(ph.text);
                  // widget.fertilizerCalculatorReportDto.borronLevelB to be filled according to Low, Medium and High
                  navigateToPageReplaceMent(Common(
                    widget: SoilTestSelectCrops(
                        fertilizerCalculatorReportDto:
                            widget.fertilizerCalculatorReportDto),
                  ));
                }),
              ],
            ).p4()
          ],
        ),
      ],
    ));
  }
}
