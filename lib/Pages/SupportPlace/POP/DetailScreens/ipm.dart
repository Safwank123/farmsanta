
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart' show WidgetHelper;
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Constants/strings.dart';
import '../../../../Models/SupportPlace/Disease/Disease.dart';
import '../../../../Models/SupportPlace/POP/PopDto.dart';
import '../../../base_screen.dart';
import 'ipm_details.dart';

class IPM extends BaseScreen {
  final PopSectionModel model;
  const IPM({super.key, required this.model});

  @override
  BaseScreenState<IPM> createState() => _IPMState();
}

class _IPMState extends BaseScreenState<IPM> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget buildWidget(BuildContext context) {
    List<Disease> insectManagement = widget.model.insects;
    List<Disease> diseaseManagement = widget.model.diseases;
    List<Disease> weedManagement = widget.model.weeds;
    return Scaffold(
      body: Column(
        children: [
          20.heightBox,

          //Tabs
          WidgetHelper.customPillTabBar(
              tabController: _tabController,
              tabTitles: [
                AppStrings.insectManagement,
                AppStrings.diseaseManagement,
                AppStrings.weedManagement,
              ],
              selectedColor: AppThemeColors.getColor(AppThemeColorsEnum.orange)),
          10.heightBox,

          //Body
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                itemsGrid(context, insectManagement),
                itemsGrid(context, diseaseManagement),
                itemsGrid(context, weedManagement),
              ],
            ),
          )
        ],
      ),
    );
  }

  //Common grid body of all tab body
  Widget itemsGrid(BuildContext context, List<Disease> model) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: model.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image
            WidgetHelper.getCircularAvatar(model[index].photos[0].fileName!).box.make().h(100).w(100),
            10.heightBox,

            //Name and Scientific Name
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  WidgetSpan(
                      child: CustomText(
                    textKey: model[index].localName,
                    style: AppTextStyle.titleSmall.copyWith(color: AppColors.white),
                  )),
                  WidgetSpan(
                      child: CustomText(
                    textKey: model[index].scientificName,
                    style: AppTextStyle.titleSmall.copyWith(color: AppColors.white, fontStyle: FontStyle.italic),
                  ))
                ])).expand()
          ],
        ).p(8).box.make().color(AppColors.primary).p(10).onTap(() {
          navigateToPageWithoutReplaceMent(IpmDetails(
            diseaseList: model,
          ));
        });
      },
    );
  }
}
