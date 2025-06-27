
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Models/SupportPlace/POP/SeedTreatment.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../base_screen.dart';

class SeedTreatmentScreen extends BaseScreen {
  final PopSectionModel model;

  const SeedTreatmentScreen({super.key, required this.model});

  @override
  BaseScreenState<SeedTreatmentScreen> createState() =>
      _SeedTreatmentScreenState();
}

class _SeedTreatmentScreenState extends BaseScreenState<SeedTreatmentScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    List<SeedTreatment> seedTreatmentRequirement = widget.model.seedTreatments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < seedTreatmentRequirement.length; i++)
              //seed treatment cards
              Card(
                color: AppColors.white,
                child: Column(
                  children: [
                    //list of features
                    ...getFeaturesWidget(seedTreatmentRequirement[i]),
                  ],
                ).box.make().p16(),
              ),
          ],
        ).box.make().p16(),
      ),
    );
  }

  //List of Data
  List<Widget> getFeaturesWidget(SeedTreatment model) {
    var keyMap = {
      0: AppStrings.formulation,
      1: AppStrings.productype,
      2: AppStrings.productname,
      3: AppStrings.dosage,
      4: AppStrings.applicationmethod,
      5: AppStrings.modeofaction,
      6: AppStrings.toxicitylevel,
    };

    var valueMap = {
      0: model.formulation,
      1: model.productType,
      2: model.productName.toList(),
      3: "${model.dosage?.uom} - ${model.dosage?.unit}",
      4: model.applicationMethod,
      5: model.modeOfAction,
      6: model.toxicityLevel,
    };
    return List.generate(
      7,
      (index) => WidgetHelper()
          .keyValueText(keyMap[index]!, valueMap[index]!.toString()),
    );
  }
}
