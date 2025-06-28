
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/User/user.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Services/store_helper.dart';
import '../../../Widgets/classes/card_helper.dart';
import '../../../themeFiles/app_colors.dart';
import '../../../themeFiles/app_typography.dart';
import '../../base_screen.dart';
import 'pop_card.dart';

class SavedPopScreen extends BaseScreen {
  static const String routeName = "/save-pop";
  const SavedPopScreen({super.key});

  @override
  BaseScreenState<SavedPopScreen> createState() => _SavedPopScreenState();
}

class _SavedPopScreenState extends BaseScreenState<SavedPopScreen> {
  UserModel? user = StoreHelper.store.user;
  @override
  Widget buildWidget(BuildContext context) {
    var color = AppThemeColors.getColor(AppThemeColorsEnum.primary);
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.bookmarkedPops,
            style: AppTextStyle.titleMedium),
        body: SingleChildScrollView(
          //Grid
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: StoreHelper.store.savedPopList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemBuilder: (context, index) {
                //saved Pop cards
                return CardHelper.popCard(
                    context, StoreHelper.store.savedPopList[index], color,
                    onTap: () {
                  navigateToPageWithoutReplaceMent(
                      PopCardScreen(model: StoreHelper.store.popList[index]));
                }, onTapSave: () {
                  StoreHelper.store.savedPopList
                      .add(StoreHelper.store.popList[index]);
                });
              }).box.make().hHalf(context),
        ));
  }
}
