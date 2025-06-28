
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import 'DetailScreens/climateRequirements.dart';
import 'DetailScreens/croppingProcess.dart';
import 'DetailScreens/cultivars.dart';
import 'DetailScreens/harvest.dart';
import 'DetailScreens/ipm.dart';
import 'DetailScreens/nutrition.dart';
import 'DetailScreens/seedTreatment.dart';

class PopDetailScreen extends BaseScreen {
  static const String routeName = "/pop-details";
  final PoPModel model;
  int currentPageIndex;
  PopDetailScreen({super.key, required this.model, this.currentPageIndex = 0});

  @override
  BaseScreenState<PopDetailScreen> createState() => _PopDetailScreenState();
}

class _PopDetailScreenState extends BaseScreenState<PopDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 7, initialIndex: widget.currentPageIndex);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.back,
            style: AppTextStyle.titleMedium),
        body: SafeArea(
          child: Column(
            children: [
              //Tabs
              TabBar(
                      isScrollable: true,
                      controller: tabController,
                      tabs: tabs())
                  .hPCT(context: context, heightPCT: 8),

              //Body
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  ClimateRequirement(model: StoreHelper.store.popSectionModel!),
                  Cultivars(
                    model: StoreHelper.store.popSectionModel!,
                  ),
                  SeedTreatmentScreen(
                    model: StoreHelper.store.popSectionModel!,
                  ),
                  CroppingProcess(
                    model: StoreHelper.store.popSectionModel!,
                  ),
                  IPM(
                    model: StoreHelper.store.popSectionModel!,
                  ),
                  Nutrition(
                    model: StoreHelper.store.popSectionModel!,
                  ),
                  Harvest(model: StoreHelper.store.popSectionModel!),
                ]),
              ),
            ],
          ),
        ));
  }

  //
  List<Widget> tabs() {
    return StoreHelper.store.popCards
        .map((e) => tabWidget(e.image!, e.name!))
        .toList();
  }

  //Tab Widget
  Widget tabWidget(String image, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          image,
          width: 25,
        ),
        CustomText(
          textKey: title,
        ),
      ],
    );
  }
}
