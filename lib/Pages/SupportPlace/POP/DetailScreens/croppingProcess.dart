
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart' show AppColors;
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/POP/CroppingProcessDto.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Models/SupportPlace/POP/Process.dart';
import '../../../base_screen.dart';

class CroppingProcess extends BaseScreen {
  final PopSectionModel model;
  const CroppingProcess({super.key, required this.model});

  @override
  BaseScreenState<CroppingProcess> createState() => _CroppingProcessState();
}

class _CroppingProcessState extends BaseScreenState<CroppingProcess> {
  final List<bool> _dropdownStates = List.generate(16, (index) => false);
  @override
  Widget buildWidget(BuildContext context) {
    CroppingProcessDto? data = widget.model.croppingProcessDto;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Crop name
              CustomText(
                textAlign: TextAlign.left,
                textKey: data!.crop,
                style: AppTextStyle.bodyLarge,
                bold: true,
              ),
              15.heightBox,
              //crop description
              CustomText(
                textKey: data.description,
              ),
              20.heightBox,
              for (int i = 0; i < data.processlist.length; i++)
                getDropDownDialog(i, _dropdownStates[i], () {
                  setState(
                    () {
                      _dropdownStates[i] = !_dropdownStates[i];
                    },
                  );
                }, data.processlist)
            ],
          ).pSymmetric(h: 10, v: 15),
        ),
      ),
    );
  }
}

//Process List (Removed Later after fetching from API)
final List<String> processListTitles = [
  AppStrings.climaticRequirements,
  AppStrings.suitableSoils,
  AppStrings.plantingWindow,
  AppStrings.plantingMaterial,
  AppStrings.settTreatment,
  AppStrings.landPreparation,
  AppStrings.spacing,
  AppStrings.planting,
  AppStrings.nutrientManagement,
  AppStrings.irrigation,
  AppStrings.intercropping,
  AppStrings.gapFilling,
  AppStrings.weedControl,
  AppStrings.harvesting,
  AppStrings.yield,
  AppStrings.postHarvesting
];

//Custom DropDownWidget for showing Description of Processes
Widget getDropDownDialog(
    int index, bool isVisible, VoidCallback onButtonTap, List<Process> data) {
  return ExpansionTile(
    collapsedBackgroundColor: AppColors.primary,
    collapsedIconColor: AppColors.white,
    collapsedTextColor: AppColors.white,
    expandedCrossAxisAlignment: CrossAxisAlignment.start,
    expandedAlignment: Alignment.topLeft,
    childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
    iconColor: AppColors.primary,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //Dropdown title
        CustomText(
          textKey: data[index].title,
          semiBold: true,
        ).pSymmetric(h: 5),
      ],
    ).pSymmetric(v: 2.0),
    children: [
      //Dropdown data
      CustomText(
        textKey: data[index].description,
        style: AppTextStyle.bodySmall,
      ).pSymmetric(v: 10, h: 5),
    ],
  ).pSymmetric(v: 5);
}
