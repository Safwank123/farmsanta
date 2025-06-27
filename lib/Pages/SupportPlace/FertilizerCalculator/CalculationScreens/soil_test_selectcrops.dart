
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../Constants/strings.dart';
import '../../../../../../Functions/common.dart';
import '../../../../Models/SupportPlace/calculator/FertilizerGeneratedReport.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../Services/store_helper.dart';
import '../../../base_screen.dart';
import '../common.dart';
import 'add_crop_input.dart';
import 'soil_health_report.dart';

class SoilTestSelectCrops extends BaseScreen {
  FertilizerCalculatorReportDto fertilizerCalculatorReportDto;
  SoilTestSelectCrops({super.key, required this.fertilizerCalculatorReportDto});
  @override
  BaseScreenState<SoilTestSelectCrops> createState() =>
      _SoilTestSelectCropsState();
}

List ans = [];

class _SoilTestSelectCropsState extends BaseScreenState<SoilTestSelectCrops>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 5, initialIndex: 0);
  }

  String selectedCrop = '';

  List<List> emptylist = [[]];

  @override
  Widget buildWidget(BuildContext context) {
    List fruitcrop = [],
        fieldcrop = [],
        vegetablecrop = [],
        oilseed = [],
        othercrops = [];

    for (int i = 0; i < StoreHelper.store.cropselectfruit.length; i++) {
      fruitcrop.add(StoreHelper.store.cropselectfruit[i].cropName);
    }

    for (int i = 0; i < StoreHelper.store.cropselect.length; i++) {
      switch (StoreHelper.store.cropselect[i].cropType) {
        case "1":
          fieldcrop.add(StoreHelper.store.cropselect[i].cropName);
          break;
        case "2":
          vegetablecrop.add(StoreHelper.store.cropselect[i].cropName);
          break;
        case "3":
          oilseed.add(StoreHelper.store.cropselect[i].cropName);
          break;
        case "4":
          othercrops.add(StoreHelper.store.cropselect[i].cropName);
          break;
      }
    }

    List<List> typeofFilter = [
      fieldcrop,
      vegetablecrop,
      oilseed,
      fruitcrop,
      [],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title with icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: AppStrings.selectCrops,
                    color: AppColors.subHeading,
                    size: 16,
                    bold: true,
                  ),
                  const Icon(Icons.search),
                ],
              ).pSymmetric(h: 12, v: 20),

              // select list
              Wrap(
                children: getSelectFiltercrops(emptylist[0]),
              ).px8(),

              // tab bar with all crop title
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(
                  textKey: AppStrings.allcrops,
                  color: AppColors.primary,
                ),
                TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorColor: Colors.lightGreen,
                  dividerColor: AppColors.white,
                  labelColor: Colors.lightGreen,
                  tabs: tabs(),
                ).hPCT(context: context, heightPCT: 3).wThreeForth(context),
              ]).wFull(context).h4(context).px8(),

              // tabbarview
              SizedBox(
                  child: TabBarView(controller: tabController, children: [
                for (int i = 0; i < 5; i++)
                  Wrap(
                          children:
                              getFiltercrops(typeofFilter[i], emptylist[0], i))
                      .px8(),
              ])).h32(context).wFull(context),

              //buttons at bottom
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton().objectBottomLeft().onInkTap(() {
                    navigateToPageReplaceMent(
                      Common(
                        widget: SoilHealthReport(
                            fertilizerCalculatorReportDto:
                                widget.fertilizerCalculatorReportDto),
                      ),
                    );
                  }),
                  NextButton().objectBottomRight().onInkTap(() {
                    widget.fertilizerCalculatorReportDto.cropType =
                        (tabController.index + 1);
                    navigateToPageReplaceMent(FertilizerAddCropScreen(
                        cropType: (tabController.index + 1).toString(),
                        selectedCrop: selectedCrop,
                        fertilizerCalculatorReportDto:
                            widget.fertilizerCalculatorReportDto));
                  }),
                ],
              )
            ],
          ),
        )
      ],
    ).hTwoThird(context);
  }

  // list of tab widgets
  List<Widget> tabs() {
    return tabNames.map((e) => tabWidget(e)).toList();
  }

  // list of tab names
  List<String> tabNames = [
    AppStrings.fieldcrop,
    AppStrings.vegatablecrop,
    AppStrings.oilseed,
    AppStrings.fruitcrop,
    AppStrings.othercrops,
  ];

  //Tab Widget
  Widget tabWidget(String title) {
    return CustomText(
      textKey: title,
    );
  }

  List<Widget> getFiltercrops(List list, List empty, int i) {
    List<Widget> chips = [];
    for (int i = 0; i < list.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.all(2.0),
        child: Chip(
          label: Text(
            list[i],
          ),
          labelStyle: TextStyle(color: AppColors.white, fontSize: 12),
          backgroundColor: AppColors.greenLight,
        ).onTap(() {
          if (empty.length == 1) {
            empty.removeLast();
          }
          empty.add(list[i]);
          setState(() {
            selectedCrop = list[i];
            Wrap(
              children: getSelectFiltercrops(emptylist[0]),
            );
          });
        }),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> getSelectFiltercrops(List list) {
    List<Widget> chips = [];
    for (int i = 0; i < list.length; i++) {
      Widget item = Padding(
          padding: EdgeInsets.all(2.0),
          child: Chip(
            label: Text(
              list[i],
            ),
            labelStyle: TextStyle(color: AppColors.white, fontSize: 12),
            backgroundColor: AppColors.greenLight,
            deleteIconColor: AppColors.white,
            onDeleted: () {
              setState(() {
                list.remove(list[i]);
              });
            },
          ));
      chips.add(item);
    }
    return chips;
  }
}

Widget NextButton() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        textKey: AppStrings.next,
        color: AppColors.white,
      ),
      Icon(
        Icons.chevron_right_sharp,
        color: AppColors.background,
      ).iconSize(25),
    ],
  ).p8().box.make().color(AppColors.greenLight).cornerRadius(100).centered();
}

Widget previousButton() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.chevron_left_sharp,
        color: AppColors.background,
      ).iconSize(25),
      CustomText(
        textKey: AppStrings.previous,
        color: AppColors.white,
      ),
    ],
  ).p8().box.make().color(AppColors.greenLight).cornerRadius(100).centered();
}
