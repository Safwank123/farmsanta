
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Functions/common.dart';
import '../../../../../Widgets/classes/button_helper.dart';
import '../../../themeFiles/app_typography.dart';

class AddFilterScreen extends BaseScreen {
  static const routeName = "/crop-advisory-filter-bottom-sheet";
  const AddFilterScreen({Key? key}) : super(key: key);
  @override
  BaseScreenState<AddFilterScreen> createState() => _AddFilterScreenState();
}

class _AddFilterScreenState extends BaseScreenState<AddFilterScreen> {
  List<String> title = [
    AppStrings.selectCrop,
    AppStrings.selectAdvisories,
    AppStrings.selectGrowthStages
  ];
  List<List> typeofFilter = [
    StoreHelper.store.cropNameList,
    StoreHelper.store.cropAdvisoriesList.map((e) => e.advisoryTagName).toList(),
    StoreHelper.store.growthStagesList.map((e) => e!.name).toList()
  ];

  List<List> emptylist = [[], [], []];

  @override
  Widget buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //buttons on top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textKey: AppStrings.filter,
                color: AppColors.primary,
                size: 20,
                bold: true,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, emptylist);
                  },
                  child: CustomText(
                    textKey: AppStrings.apply,
                    size: 20,
                    bold: true,
                  ).onTap(() {})),
            ],
          ).p20(),

          // all list of filters
          for (int i = 0; i < 3; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  textKey: title[i],
                  bold: true,
                  color: AppColors.subHeading,
                  size: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: getSelectFiltercrops(emptylist[i]),
                    )),
                Divider(
                  color: AppColors.gray,
                ),
                Wrap(children: getFiltercrops(typeofFilter[i], emptylist[i], i))
                    .p2(),
              ],
            ),

          // last buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonHelper.buttonWithText(
                      AppStrings.cancel, AppColors.black, AppColors.white)
                  .onInkTap(() {
                Navigator.pop(context);
              }),
              ButtonHelper.buttonWithText(
                      AppStrings.apply, AppColors.white, AppColors.primary)
                  .onInkTap(() {
                Navigator.pop(context, emptylist);
              }),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> getFiltercrops(List list, List empty, int i) {
    List<Widget> chips = [];
    for (int i = 0; i < list.length; i++) {
      Widget item = Padding(
        padding: EdgeInsets.all(2.0),
        child: ActionChip(
          onPressed: () {},
          backgroundColor: AppColors.white,
          side: BorderSide(color: AppColors.white),
          label: CustomText(
            style: AppTextStyle.bodySmall,
            textKey: list[i],
          ),
          labelStyle: TextStyle(
            color: AppColors.subHeading,
          ),
        ).pSymmetric(h: 3).onTap(() {
          if (empty.contains(list[i])) {
            showToast("${AppStrings.youHaveAlreadyAdded} ${list[i]}");
          } else {
            empty.add(list[i]);
            setState(() {
              Wrap(
                children: getSelectFiltercrops(emptylist[i]),
              );
            });
          }
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
          padding: const EdgeInsets.all(2.0),
          child: Chip(
            label: Text(
              list[i],
            ),
            labelStyle: TextStyle(
              color: AppColors.white,
            ),
            backgroundColor: AppColors.primary,
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
