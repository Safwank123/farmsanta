
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/SupportPlace/POP/PopDetailsDTO.dart';
import 'package:farmsanta_new/Models/User/user.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_edit_text_white_back.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/themeFiles/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Services/store_helper.dart';
import '../../../Widgets/classes/card_helper.dart';
import '../../../themeFiles/app_colors.dart';
import '../../../themeFiles/app_typography.dart';
import '../../base_screen.dart';
import 'pop_card.dart';
import 'pop_saved.dart';

class PopScreen extends BaseScreen {
  static const String routeName = "/pop-screen";
  const PopScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<PopScreen> createState() => _PopScreenState();
}

class _PopScreenState extends BaseScreenState<PopScreen> {
  UserModel? user = StoreHelper.store.user;
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.pop,
            style: AppTextStyle.titleMedium),
        body: Column(
          children: [
            //Search, save and filter
            Row(
              children: [
                //Search InputBox
                CustomInputField(
                        prefixWidget: Icon(
                          CustomIcons.search,
                          size: 25,
                          color: AppColors.gray,
                        ),
                        showIcon: true,
                        hint: AppStrings.search,
                        textEditingController: searchController,
                        borderRadius: 25,
                        fillColor: AppColors.grayLight)
                    .expand(flex: 7),
                10.widthBox,

                //filter icon
                const Icon(
                  MaterialSymbols.sort,
                )
                    .p12()
                    .onInkTap(() {
                      navigateToPageWithoutReplaceMent(const SavedPopScreen());
                    })
                    .box
                    .make()
                    .cornerRadius(100)
                    .color(AppColors.grayLight)
                    .cornerRadius(25),
                10.widthBox,

                //save icon
                const Icon(
                  CustomIcons.save,
                )
                    .p12()
                    .box
                    .make()
                    .cornerRadius(100)
                    .color(AppColors.grayLight)
                    .cornerRadius(25),
              ],
            ).pSymmetric(h: 15),

            15.heightBox,

            //PoP Card List
            Expanded(
                child: ListView.builder(
              itemCount: popList.length,
              itemBuilder: (context, index) {
                var model = popList[index];
                return CardHelper.popCard(context, model, AppColors.primary,
                    onTap: () {
                  navigateToPageWithoutReplaceMent(PopCardScreen(model: model));
                }, onTapSave: () {
                  StoreHelper.savePop(model)
;                });
              },
            ))
          ],
        ).hFull(context).wFull(context));
  }

  TextEditingController searchController = TextEditingController();
  List<PoPModel> popList = StoreHelper.store.popList;
  @override
  void initState() {
    super.initState();

    //TODO search condition
    searchController.addListener(() {
      String searchText = searchController.text;
      // cropAdvisoriesCardList =
      //     StoreHelper.store.cropAdvisoriesList.where((element) {
      //   return element.firstName.contains(searchText);
      // }).toList();
      // setState(() {});
    });
  }
}
