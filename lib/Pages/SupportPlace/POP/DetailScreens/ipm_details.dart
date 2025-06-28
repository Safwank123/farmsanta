
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/colors.dart';
import '../../../../Models/SupportPlace/Disease/Disease.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../../themeFiles/app_typography.dart';
import '../../../base_screen.dart';

class IpmDetails extends BaseScreen {
  final List<Disease> diseaseList;
  const IpmDetails({super.key, required this.diseaseList});

  @override
  BaseScreenState<IpmDetails> createState() => _IpmDetailsState();
}

class _IpmDetailsState extends BaseScreenState<IpmDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.diseaseList.length, vsync: this);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            10.heightBox,
            //Tabs
            WidgetHelper.customPillTabBar(
                tabController: _tabController, tabTitles: [...(widget.diseaseList).map((e) => e.localName)], selectedColor: AppColors.primary),

            //body
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [...(widget.diseaseList).map((e) => itemDescription(e))],
            ))
          ],
        ),
      ),
    );
  }

  //
  Widget itemDescription(Disease disease) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: disease.photos.map((e) => imageWithExpandIcon(imageUrl: e.fileName!)).toList(),
          ),
        ).p(15),
        10.heightBox,

        //Name and Scientific Name
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              WidgetSpan(
                  child: CustomText(
                textKey: disease.localName,
                style: AppTextStyle.titleSmall.copyWith(color: AppColors.white),
              )),
              WidgetSpan(
                  child: CustomText(
                textKey: disease.scientificName,
                style: AppTextStyle.titleSmall.copyWith(color: AppColors.white, fontStyle: FontStyle.italic),
              ))
            ])).p(15).expand(),

        10.heightBox,

        //Data card
        Card(
          color: AppColors.white,
          child: Column(
            children: [
              if (disease.weedType != null) WidgetHelper().keyValueText('Weed Type', disease.weedType!),
              if (disease.insectLifeCycles != null && disease.insectLifeCycles!.isNotEmpty) ...{
                ...(disease.insectLifeCycles!).map((e) => WidgetHelper().keyValueText(e.lifecycleStage, e.characteristics))
              },
              if (disease.description != null) WidgetHelper().keyValueText('Description', disease.description!),
              if (disease.symptomsOfAttack != null) WidgetHelper().keyValueText('Symptom of Attack', disease.symptomsOfAttack!),
              WidgetHelper().keyValueText('Favourable Conditions', disease.favourableConditions),
              if (disease.culturalMechanicalControl != null)
                WidgetHelper().keyValueText('Cultural Mechanical Control', disease.culturalMechanicalControl!),
              if (disease.preventiveMeasures != null) WidgetHelper().keyValueText('Preventive Measures', disease.preventiveMeasures!),
            ],
          ).p(5),
        ).p(15)
      ],
    );
  }

  Widget keyValueText(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: key,
          color: primaryColor,
        ).expand(flex: 3),
        10.widthBox,
        CustomText(
          textKey: ":",
          style: TextStyle(color: AppColors.primary),
        ),
        CustomText(
          textKey: value,
          color: Colors.grey,
        ).expand(flex: 6)
      ],
    ).pSymmetric(v: 2, h: 15);
  }
}
