import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../base_screen.dart';
import './DetailScreens/add_query_details.dart';
import './my_queries_pending.dart';
import './my_queries_solved.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';

class MyQueriesScreen extends BaseScreen {
  static const String routeName = "/myQueries-screen";
  final int currentPageIndex;
  const MyQueriesScreen({super.key, this.currentPageIndex = 0});

  @override
  BaseScreenState<MyQueriesScreen> createState() => _MyQueriesScreen();
}

class _MyQueriesScreen extends BaseScreenState<MyQueriesScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      // App Bar with Trailing Icon Button
      appBar: AppBarDesigns.getAppTitleAndIconButton(
        AppStrings.myQueries,
        IconButton(
          onPressed: () {
            navigateToPageWithoutReplaceMent(const AddQueryDetails());
          },
          icon: Icon(
            Icons.add_box_outlined,
            color: AppColors.invert,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Search and create query
          WidgetHelper.searchBarOnly(
                  AppStrings.searchYourQueries, searchController)
              .pSymmetric(h: 15),

          // Some Spacing
          15.heightBox,

          // Tab Bar
          TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: tabs(),
          ).hPCT(context: context, heightPCT: 5),

          // Tab Bar View
          Expanded(
            child: TabBarView(controller: tabController, children: [
              SolvedScreen(searchController),
              PendingScreen(searchController)
            ]),
          ),
        ],
      ),
    );
  }

  // list of tab widgets
  List<Widget> tabs() {
    return tabNames
        .map((e) => CustomText(
              textKey: e,
            ))
        .toList();
  }

  // list of tab names
  List<String> tabNames = [AppStrings.solved, AppStrings.pending];
  TextEditingController searchController = TextEditingController();

  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 2, initialIndex: widget.currentPageIndex);
  }
}
