import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import '/Widgets/Widgets/custom_text.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../themeFiles/app_colors.dart';
import 'create_new_post.dart';
import 'farm_talk_my_posts.dart';
import 'farmtalk_explore.dart';
import 'farmtalk_home.dart';

class FarmTalk extends BaseScreen {
  static const String routeName = "/farm-talk-screen";
  final int currentPageIndex;
  const FarmTalk({super.key, this.currentPageIndex = 0});

  @override
  BaseScreenState<FarmTalk> createState() => _FarmTalkState();
}

class _FarmTalkState extends BaseScreenState<FarmTalk>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 3, initialIndex: widget.currentPageIndex);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      // App Bar with Trailing Icon Button
      appBar: AppBarDesigns.getAppTitleAndIconButton(
        isBold: true,
        AppStrings.farmTalk,
        titleSize: 16,

        // row widget contain create text and icon button
        Row(
          children: [
            // create text
            CustomText(
              textKey: AppStrings.create,
              bold: true,
              size: 14,
            ),

            Icon(
              Icons.add_box_outlined,
              color: AppColors.invert,
            ),
          ],
        ).pOnly(right: 8).onInkTap(() {
          navigateToPageWithoutReplaceMent(CreateNewPost(
            message: StoreHelper.store.message!,
          ));
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Bar
          TabBar(
            labelColor: AppColors.orange,
            indicatorColor: AppColors.orange,
            controller: tabController,
            tabs: tabs(),
          ).hPCT(context: context, heightPCT: 5),

          10.heightBox,
          // Tab Bar View
          Expanded(
            child: TabBarView(controller: tabController, children: [
              FarmTalkExploreScreen(
                trendingTags: StoreHelper.store.trendingTags!,
                message: StoreHelper.store.message!,
              ),
              FarmTalkHomeScreen(
                message: StoreHelper.store.message!,
              ),
              MyPosts()
            ]),
          ),
        ],
      ),
    );
  }

  // list of tab widgets
  List<Widget> tabs() {
    return tabNames.map((e) => tabWidget(e)).toList();
  }

  // list of tab names
  List<String> tabNames = [
    AppStrings.explore,
    AppStrings.home,
    AppStrings.myPosts
  ];

  //Tab Widget
  Widget tabWidget(String title) {
    return CustomText(
      textKey: title,
    );
  }
}
