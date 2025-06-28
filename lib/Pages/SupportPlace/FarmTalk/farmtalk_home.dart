
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../Models/message/message.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import 'farm_talk_profile_page.dart';
import 'farmtalk_details.dart';

class FarmTalkHomeScreen extends BaseScreen {
  static String routeName = '/farm-talk-home-screen';
  final Message message;
  const FarmTalkHomeScreen({super.key, required this.message});

  @override
  BaseScreenState<FarmTalkHomeScreen> createState() =>
      _FarmTalkHomeScreenState();
}

class _FarmTalkHomeScreenState extends BaseScreenState<FarmTalkHomeScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Search InputBox
            WidgetHelper.searchbarwithbothsideicon(AppStrings.search),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    //mascot and FarmSanta
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(ImageRoutes.mascotImage),
                          height: 45,
                          width: 45,
                        ),
                        5.widthBox,
                        CustomText(
                          textKey: AppStrings.farmsanta,
                        ),
                      ],
                    ).p(6).onTap(() {
                      navigateToPageReplaceMent(FarmTalkProfilePage(
                        message: StoreHelper.store.message!,
                        username: AppStrings.farmsanta,
                      ));
                    }),

                    //profiles
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          profiles("kamal Singh").onTap(() {
                            navigateToPageReplaceMent(FarmTalkProfilePage(
                                message: StoreHelper.store.message!,
                                username: "kamal Singh"));
                          }),
                          profiles("Priyankar Mondal").onTap(() {
                            navigateToPageReplaceMent(FarmTalkProfilePage(
                                message: StoreHelper.store.message!,
                                username: "Priyankar Mondal"));
                          }),
                        ],
                      ),
                    ).w64(context),
                  ],
                ),
              ],
            ).p4(),

            // list of cards
            Column(
              children: List.generate(1, (index) {
                return CardHelper.FarmTalkExploreCard(context, widget.message,
                    onTap: () {
                  navigateToPageWithoutReplaceMent(FarmTalkExploreDetailsScreen(
                    message: StoreHelper.store.message!,
                  ));
                });
              }),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget profiles(String name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        Icons.account_circle,
        size: 50,
      ),
      CustomText(
        textKey: name,
      ),
    ],
  ).p8();
}
