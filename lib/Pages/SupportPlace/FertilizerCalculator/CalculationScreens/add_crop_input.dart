// ignore_for_file: must_be_immutable


import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../../Widgets/classes/style_helper.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../../../../themeFiles/app_typography.dart';
import '../../../../Services/store_helper.dart';
import '../../../base_screen.dart';
import '../common.dart';
import 'fertilizer_combination.dart';
import 'soil_test_selectcrops.dart';

class FertilizerAddCropScreen extends BaseScreen {
  FertilizerCalculatorReportDto fertilizerCalculatorReportDto;
  String selectedCrop;
  String cropType;
  FertilizerAddCropScreen(
      {super.key,
      required this.selectedCrop,
      required this.cropType,
      required this.fertilizerCalculatorReportDto});

  @override
  BaseScreenState<FertilizerAddCropScreen> createState() =>
      FertilizerAddCropScreenState();
}

class FertilizerAddCropScreenState
    extends BaseScreenState<FertilizerAddCropScreen> {
  List<String> crops = [];
  List<String> ageOfPlant = [
    'Planting',
    '1 Year',
    '2 Years',
    '3 Years',
    '4 Years',
    '5 Years',
    '6 Years',
    '7 Years',
    '8 Years',
    '9 Years',
    '10 Years',
    '11 Year',
    '12 Years',
    '13 Years',
    '14 Years',
    '15 Years',
    '16 Years'
  ];

  String? selectedCrop;
  String selectedAgeOfPlant = '1 ${AppStrings.year}';
  TextEditingController cropAreaTextController = TextEditingController();

  @override
  void initState() {
    for (var i in StoreHelper.store.cropselect) {
      if (i.cropType == widget.cropType) {
        setState(() {
          crops.add(i.cropName!);
        });
      }
    }
    setState(() {
      selectedCrop = widget.selectedCrop;
    });
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
                textKey: AppStrings.addYourCropInputs,
                style: AppTextStyle.titleLarge,
              ).w(width * 0.7).pSymmetric(v: 30, h: 15),
              CustomText(
                textKey: AppStrings.selectCrop,
                style: AppTextStyle.bodyMedium,
              ).pSymmetric(v: 5, h: 15),
              getDropDownButton(
                selectedCrop,
                (value) {
                  setState(() {
                    selectedCrop = value;
                  });
                },
                crops,
                itemHeight: 60,
                iconSize: 50,
              ).h(60).cornerRadius(5).pSymmetric(h: 15),
              15.heightBox,
              CustomText(
                textKey: AppStrings.ageOfCrop,
                style: AppTextStyle.bodyMedium,
              ).pSymmetric(v: 5, h: 15),
              getDropDownButton(
                selectedAgeOfPlant,
                (value) {
                  setState(() {
                    selectedAgeOfPlant = value;
                  });
                },
                ageOfPlant,
                itemHeight: 60,
                iconSize: 50,
              ).h(60).cornerRadius(5).pSymmetric(h: 15),
              20.heightBox,
              Row(
                children: [
                  TextFormField(
                    controller: cropAreaTextController,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                      fillColor: const Color(0xFFEBEBEB),
                      filled: true,
                      hintText: AppStrings.cropArea,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.greenLight,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ).h(45).w(width * 0.55),
                  CustomText(
                    textKey: AppStrings.inHectare,
                    color: AppColors.background,
                    style: AppTextStyle.labelSmall,
                  )
                      .centered()
                      .box
                      .make()
                      .h(45)
                      .w(75)
                      .backgroundColor(AppColors.greenLight)
                      .cornerRadius(5),
                ],
              ).pSymmetric(h: 15),
              (height * 0.2).heightBox,
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
                    navigateToPageReplaceMent(
                      SoilTestSelectCrops(
                          fertilizerCalculatorReportDto:
                              widget.fertilizerCalculatorReportDto),
                    );
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
                          textKey: AppStrings.next,
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
                      widget.fertilizerCalculatorReportDto.ageOfPlant =
                          ageOfPlant.indexOf(selectedAgeOfPlant);
                      widget.fertilizerCalculatorReportDto.area =
                          int.parse(cropAreaTextController.text);
                      navigateToPageReplaceMent(
                        FertilizerCombScreen(
                          fertilizerCalculatorReportDto:
                              widget.fertilizerCalculatorReportDto,
                        ),
                      );
                    },
                  ),
                ],
              ).p(10)
            ],
          ),
        ],
      ),
    );
  }

  Widget getDropDownButton(
      String? selectedValue, Function onChange, List<String> valueArrray,
      {double iconSize = 30, double itemHeight = 50}) {
    return DropdownButton<String>(
      dropdownColor: AppColors.background,
      alignment: AlignmentDirectional.centerStart,
      itemHeight: itemHeight,
      isExpanded: true,
      underline: const SizedBox(),
      iconSize: iconSize,
      iconEnabledColor: AppColors.greenLight,
      items: valueArrray.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(right: 2, left: 15),
            child: CustomText(
              textKey: value,
              color: AppColors.black,
              style: AppTextStyle.bodyMedium,
            ),
          ),
        );
      }).toList(),
      value: selectedValue,
      onChanged: (value) {
        onChange(value);
      },
    ).px8().backgroundColor(const Color(0xFFEBEBEB));
  }
}
