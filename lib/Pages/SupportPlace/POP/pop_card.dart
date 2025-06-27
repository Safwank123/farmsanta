
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Constants/strings.dart';
import '../../../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../../../Services/store_helper.dart';
import '../../../Widgets/classes/app_bar.dart';
import '../../../Widgets/classes/card_helper.dart';
import '../../../themeFiles/app_colors.dart';
import '../../../themeFiles/custom_icons.dart';
import '../../base_screen.dart';
import 'pop_details.dart';

class PopCardScreen extends BaseScreen {
  static const String routeName = "/pop-card";
  final PoPModel model;
  const PopCardScreen({Key? key, required this.model}) : super(key: key);

  @override
  BaseScreenState<PopCardScreen> createState() => _PopCardScreenState();
}

class _PopCardScreenState extends BaseScreenState<PopCardScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(
          AppStrings.back,
          style: AppTextStyle.titleMedium,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                //Crop Image
                imageWithExpandIcon(
                    imageUrl:
                        getImagePath(widget.model.photos![0].fileName ?? "")),

                15.heightBox,

                //Title Bar,
                Row(
                  children: [
                    CustomText(
                      textKey: widget.model.author!,
                      style: AppTextStyle.titleMedium,
                    ).expand(flex: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          CustomIcons.save,
                          color: AppColors.invert,
                        ).onInkTap(() {
                          StoreHelper.savePop(widget.model);
                        }),
                        10.widthBox,
                        Icon(
                          CustomIcons.share,
                          color: AppColors.invert,
                        ).onInkTap(() {
//TODO
                        }),
                        10.widthBox,
                        Icon(
                          CustomIcons.menu,
                          color: AppColors.invert,
                        ).onInkTap(() {
//TODO
                        }),
                      ],
                    ).expand(flex: 4)
                  ],
                ).hPCT(context: context, heightPCT: 5),

                15.heightBox,

                //Features GridView
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: StoreHelper.store.popCards.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemBuilder: (context, index) {
                      final card = StoreHelper.store.popCards[index];
                      //TODO check it
                      return descriptionCards(card.name!, card.image!)
                          .onTap(() {
                        navigateToPageWithoutReplaceMent(PopDetailScreen(
                          model: widget.model,
                          currentPageIndex: index,
                        ));
                      });
                    }).hFull(context),

                15.heightBox,
              ],
            ).p4(),
          ),
        ));
  }

  //Description Card Widget
  Widget descriptionCards(String title, String image) {
    return Container(
      width: 50,
      color: AppColors.primary,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              width: 60,
            ),
            10.heightBox,
            CustomText(
              textKey: title,
              style: AppTextStyle.titleMedium.copyWith(color: AppColors.white),
            ),
          ]),
    );
  }
}
