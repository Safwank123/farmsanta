
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/card_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../themeFiles/app_colors.dart';
import '../../../Models/message/message.dart';
import '../../../Models/tags/trendingTags.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import 'farmtalk_details.dart';

class FarmTalkExploreScreen extends BaseScreen {
  static String routeName = '/farm-talk-explore-screen';
  final TrendingTags trendingTags;
  final Message message;
  const FarmTalkExploreScreen(
      {Key? key, required this.trendingTags, required this.message})
      : super(key: key);

  @override
  BaseScreenState<FarmTalkExploreScreen> createState() =>
      _FarmTalkExploreScreenState();
}

class _FarmTalkExploreScreenState extends BaseScreenState<FarmTalkExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: widget.trendingTags.tags.length,
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Search InputBox
            WidgetHelper.searchbarwithbothsideicon(AppStrings.search),

            // trending scroll view
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  textKey: "Trending : ",
                  color: AppColors.primary,
                  bold: true,
                  size: 16,
                ),
                Column(
                  children: [
                    WidgetHelper.customPillTabBar(
                        tabController: tabController,
                        tabTitles: widget.trendingTags.tags,
                        selectedColor: AppThemeColors.getColor(
                            AppThemeColorsEnum.primary)),
                  ],
                ).w64(context),
                PopupMenuButton(
                  onSelected: (value) {},
                  icon: Icon(Icons.sort),
                  itemBuilder: (BuildContext bc) {
                    return const [
                      PopupMenuItem(
                        child: Text("All posts"),
                        value: '/hello',
                      ),
                      PopupMenuItem(
                        child: Text("Most like Posts "),
                        value: '/about',
                      ),
                      PopupMenuItem(
                        child: Text("Most Commented Posts"),
                        value: '/contact',
                      )
                    ];
                  },
                )
              ],
            ).p4(),

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
