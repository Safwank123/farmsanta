
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/Cultivar/Cultivar.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Services/store_helper.dart';
import '../../../base_screen.dart';

class Cultivars extends BaseScreen {
  final PopSectionModel model;
  const Cultivars({super.key, required this.model});

  @override
  BaseScreenState<Cultivars> createState() => _CultivarsState();
}

class _CultivarsState extends BaseScreenState<Cultivars> {
  @override
  Widget buildWidget(BuildContext context) {
    List<Cultivar> cultivarRequirements =
        StoreHelper.store.popSectionModel!.cultivars;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Cultivar Cards
            for (int i = 0; i < cultivarRequirements.length; i++)
              Card(
                color: AppColors.white,
                child: Column(
                  children: [
                    //Cultivar features
                    ...getFeaturesWidget(cultivarRequirements[i])
                  ],
                ).p(5),
              ),
          ],
        ).box.make().p16(),
      ),
    );
  }

  //Widget of Cultivar features
  List<Widget> getFeaturesWidget(Cultivar model) {
    //mapping name and value
    Map<String, dynamic> cultivarMap = {
      AppStrings.cultivarName: model.crop,
      AppStrings.cultivarGroups: model.cultivarGroup,
      AppStrings.sowingMonth:
          "${model.sowingMonths.first.min} - ${model.sowingMonths.first.max}",
      AppStrings.harvestMonth:
          "${model.harvestMonth?.min} - ${model.harvestMonth?.max}",
      AppStrings.cultivarDuration:
          "${model.cropDuration?.min} - ${model.cropDuration?.max}",
      AppStrings.yieldPotential:
          "${model.yieldPotential?.min} - ${model.yieldPotential?.max}",
      AppStrings.properties: model.additionalProperties,
    };

    return [
      ...(cultivarMap.keys).map((e) {
        if (cultivarMap[e] != null) {
          return WidgetHelper().keyValueText(
              e, cultivarMap[e] is List ? cultivarMap[e][0] : cultivarMap[e]);
        } else {
          return const SizedBox();
        }
      })
    ];
  }
}
