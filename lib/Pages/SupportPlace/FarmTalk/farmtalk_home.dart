import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../Widgets/classes/widget_helper_class.dart';
import '../../../Models/message/message.dart';
import 'farm_talk_profile_page.dart';
import 'farmtalk_details.dart';
import '../../base_screen.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Input Box
              WidgetHelper.searchbarwithbothsideicon(AppStrings.search),

              16.heightBox,

              // 👥 Profiles Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 🧑‍🌾 FarmSanta profile
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageRoutes.mascotImage,
                        height: 45,
                        width: 45,
                      ),
                      5.heightBox,
                      CustomText(textKey: AppStrings.farmsanta),
                    ],
                  ).onTap(() {
                    navigateToPageReplaceMent(FarmTalkProfilePage(
                      message: widget.message,
                      username: AppStrings.farmsanta,
                    ));
                  }),

                  // Other Profiles
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          profiles("Kamal Singh", widget.message),
                          profiles("Priyankar Mondal", widget.message),
                          profiles("Ritu Sharma", widget.message),
                          profiles("John Deo", widget.message),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              24.heightBox,

              // 🧭 Section Header
              CustomText(
                textKey: "Explore FarmTalk",
                size: 16,
              //  fontWeight: FontWeight.bold,
              ),

              12.heightBox,

              // 📇 Cards List
              Column(
                children: List.generate(1, (index) {
                  return CardHelper.FarmTalkExploreCard(
                    context,
                    widget.message,
                    onTap: () {
                      navigateToPageWithoutReplaceMent(
                        FarmTalkExploreDetailsScreen(
                          message: widget.message,
                        ),
                      );
                    },
                  ).p8();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🔹 Profile Widget (Reusable)
Widget profiles(String name, Message message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Icon(
        Icons.account_circle,
        size: 50,
        color: Colors.green,
      ),
      4.heightBox,
      CustomText(
        textKey: name,
        size: 12,
      ),
    ],
  ).pOnly(right: 16).onTap(() {
    navigateToPageReplaceMent(FarmTalkProfilePage(
      message: message,
      username: name,
    ));
  });
}
