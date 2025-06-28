
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/arrays.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import '/Functions/common.dart';
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/widget_helper_class.dart';
import './create_new_post.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../themeFiles/app_colors.dart';

class MyPosts extends BaseScreen {
  static const String routeName = "/farm-talk-my-post-screen";
  final int currentPageIndex;
  const MyPosts({super.key, this.currentPageIndex = 0});

  @override
  BaseScreenState<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends BaseScreenState<MyPosts>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 2, initialIndex: widget.currentPageIndex);
  }

  @override
  Widget buildWidget(BuildContext context) {
    var titleMap = {
      0: "My Posts",
      1: "Followers",
      2: "Followings",
    };
    String image =
        "https://s3-alpha-sig.figma.com/img/ab44/5ed1/941179d842028951dd4647649b034e2f?Expires=1686528000&Signature=Kq5hrohw4rLndCw-dI9crVF39e~jbIWDWidP6r6qJHiyRm91WSnGsA8TV6tBx~itBPWuOHQ7AlQw1XADtQUgM91TSqCeGc-f2FY7NZH2n256ONWrEQrkYMBh6EPufGkGKkNhc11MejYAgpjwCB8KiLHpvivxKuxBHgMnZlzI6yC-a1pb5Otn~J8H7-WFk2OaEqWUERcPmi6MCLxt8IjVULJLLdQKVCqZy-DLShjp1Vji3a71kJGEeOEPpjpgj1DFCiyeN9D5oUnq-QzvyRWwdmkLbYoRrjc4Q9wNLl6M4-tDNQz2B37Cm8kK-2TWJKRBSJg2617o5JOIgoAW4f8-OA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
    return Scaffold(
      body: SingleChildScrollView(
        // Column
        child: Column(
          children: [
            // Stack
            Stack(
              children: [
                SizedBox(
                  height: height * 0.35,
                  child: Column(
                    children: [
                      // image
                      WidgetHelper().getCachedImage(
                          image, height * 0.2, double.infinity,
                          boxFit: BoxFit.fill),
                      Container(
                        height: height * 0.15,
                        color: AppColors.background,
                      )
                    ],
                  ),
                ),

                Positioned(
                  bottom: 10,

                  // card
                  child: Card(
                    color: AppColors.background,
                    child: Column(
                      children: [
                        // some spacing
                        50.heightBox,

                        // person name
                        CustomText(
                          textKey: AppStrings.farmSanta,
                          color: AppColors.primary,
                        ),

                        //some spacing
                        5.heightBox,

                        // create new post button
                        TextButton.icon(
                          onPressed: () {
                            navigateToPageWithoutReplaceMent(CreateNewPost(
                              message: StoreHelper.store.message!,
                            ));
                          },
                          icon: Icon(
                            Icons.add,
                            color: AppColors.white,
                          ),
                          label: CustomText(
                            textKey: AppStrings.createNewPost,
                            color: AppColors.white,
                          ),
                        )
                            .pSymmetric(v: 2, h: 5)
                            .box
                            .make()
                            .color(AppColors.primary)
                            .cornerRadius(30)
                            .centered()
                            .h(height * 0.05),

                        //some spacing
                        10.heightBox,

                        // row contains post, followers and following details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0; i < 3; i++)
                              displayData(title: titleMap[i]!, titleCount: "0")
                          ],
                        ),
                      ],
                    ).hPCT(context: context, heightPCT: 25),
                  ).pSymmetric(h: 15).wFull(context),
                ),

                // profile icon
                Positioned(
                  top: 30,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: AppColors.greenDisable,
                    radius: 40,
                    child: Icon(
                      Icons.person_rounded,
                      size: 80,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ).wFull(context),

            // Tab Bar
            TabBar(
              dividerColor: AppColors.background,
              labelColor: AppColors.primary,
              indicatorColor: AppColors.background,
              controller: tabController,
              tabs: const [
                // list view icon
                Icon(
                  Icons.line_weight_sharp,
                  size: 40,
                ),

                // grid view icon
                Icon(
                  Icons.grid_view_rounded,
                  size: 40,
                ),
              ],
            ).hPCT(context: context, heightPCT: 5),
          ],
        ),
      ),
    );
  }

// display title count and title in column fashion
  Widget displayData({required String title, required String titleCount}) {
    return Column(
      children: [
        // display title count
        CustomText(
          size: 20,
          bold: true,
          textKey: titleCount,
          color: AppColors.gray,
        ),

        // display title
        CustomText(
          size: 12,
          textKey: title,
          color: AppColors.gray,
        )
      ],
    );
  }
}
