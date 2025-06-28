
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/POP/CropNutrition.dart';
import '../../../../Models/SupportPlace/POP/DeficuencyDto.dart';
import '../../../../Models/SupportPlace/POP/NutritionDosage.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../Widgets/classes/card_helper.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../themeFiles/app_colors.dart';
import '../../../../themeFiles/app_typography.dart';
import '../../../base_screen.dart';

//Nutrition Main Screen
class Nutrition extends BaseScreen {
  final PopSectionModel model;
  const Nutrition({
    super.key,
    required this.model,
  });

  @override
  BaseScreenState<Nutrition> createState() => _NutritionState();
}

class _NutritionState extends BaseScreenState<Nutrition> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //Tabs
          WidgetHelper.customPillTabBar(tabController: tabController, tabTitles: tabNames, selectedColor: AppColors.orange).p12(),

          //Body
          Expanded(
            child: TabBarView(controller: tabController, children: [
              NutritionDeficiency(deficiencyDto: widget.model.deficiencyDto),
              StandardNutrition(model: widget.model.cropNutritions),
            ]),
          ),
        ],
      ),
    ));
  }

  List<Widget> tabs() {
    return tabNames.map((e) => tabWidget(e)).toList();
  }

  //Tab Widget
  Widget tabWidget(String title) {
    return CustomText(
      textKey: title,
      style: AppTextStyle.titleMedium.copyWith(color: AppColors.invert),
    );
  }

  List<String> tabNames = [
    AppStrings.nutritionDeficiency,
    AppStrings.standardNutrition,
  ];
}

//Tab 1 : Nutrition Deficiency ------------------------------------------------------
class NutritionDeficiency extends StatefulWidget {
  final List<DeficiencyDto> deficiencyDto;
  const NutritionDeficiency({super.key, required this.deficiencyDto});

  @override
  State<NutritionDeficiency> createState() => _NutritionDeficiencyState();
}

class _NutritionDeficiencyState extends State<NutritionDeficiency> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: widget.deficiencyDto.length, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //Tabs of Elements
          TabBar(isScrollable: true, controller: tabController, tabs: [
            ...(widget.deficiencyDto).map((e) => CustomText(
                  textKey: e.nutrient,
                ))
          ]).hPCT(context: context, heightPCT: 5),

          //Body
          Expanded(
            child: TabBarView(controller: tabController, children: [...(widget.deficiencyDto).map((e) => nutritionDeficiencyDetails(e))]),
          ),
        ],
      ),
    ));
  }
}

//Widget of Nutrition Deficiency
Widget nutritionDeficiencyDetails(DeficiencyDto model) {
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Image Component
        imageWithExpandIcon(imageUrl: model.photos[0].fileName!),

        // spacing after image
        26.heightBox,

        Card(
          margin: EdgeInsets.zero,
          color: AppColors.white,
          child: Column(
            children: [
              // data
              // for (int i = 0; i < 3; i++)
              WidgetHelper().keyValueText(AppStrings.nutrient, model.nutrient),
              WidgetHelper().keyValueText(AppStrings.symptomsOfDeficiency, model.symptomsOfDeficiency),

              WidgetHelper().keyValueText(AppStrings.preventiveMeasures, model.preventiveMeasures),
            ],
          ).p(5),
        )
      ],
    ).box.make().p16();
  }
}

//Tab 2 : Standard Nutrition ------------------------------------------------------
class StandardNutrition extends StatelessWidget {
  final List<CropNutrition> model;
  const StandardNutrition({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                decoration: BoxDecoration(border: Border.all(color: AppColors.gray), borderRadius: getBorderRadiusTop(5)),
                padding: const EdgeInsets.all(5),
                child: WidgetHelper().keyValueText(AppStrings.myCrops, model[0].crop))
            .pSymmetric(h: 16),

        //list of dosage
        ...(model).map((e) => standardNutritionDetails(e))
      ],
    );
  }
}

//Widgeta of Standard Nutrition

Widget standardNutritionDetails(CropNutrition model) {
  {
    List<NutritionDosage> data = model.dosages;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // data
        for (int i = 0; i < data.length; i++) standardNutritionWidget(data[i])
      ],
    ).box.make().pSymmetric(h: 16);
  }
}

Widget standardNutritionWidget(NutritionDosage dosage) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: AppColors.gray)),
    padding: const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetHelper().keyValueText(AppStrings.growthStage, dosage.growthStage),
        WidgetHelper().keyValueText(AppStrings.nitrogen, dosage.nitrogen.toString()),
        WidgetHelper().keyValueText(AppStrings.phosphorus, dosage.phosphorus.toString()),
        WidgetHelper().keyValueText(AppStrings.potassium, dosage.potassium.toString()),
        WidgetHelper().keyValueText(AppStrings.sulphur, dosage.sulphur.toString()),
        WidgetHelper().keyValueText(AppStrings.zinc, dosage.zinc.toString()),
      ],
    ).box.make(),
  );
}
