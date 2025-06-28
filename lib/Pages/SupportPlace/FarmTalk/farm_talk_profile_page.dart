
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Models/message/message.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import '/Functions/common.dart';
import '/Widgets/Widgets/custom_text.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../../../themeFiles/custom_icons.dart';
import 'farmtalk_details.dart';

class FarmTalkProfilePage extends BaseScreen {
  static String routeName = '/farm-talk-profile-page';
  final Message message;
  final String username;
  const FarmTalkProfilePage(
      {super.key, required this.message, required this.username});

  @override
  BaseScreenState<FarmTalkProfilePage> createState() =>
      _FarmTalkProfilePageState();
}

class _FarmTalkProfilePageState extends BaseScreenState<FarmTalkProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget buildWidget(BuildContext context) {
    var titleMap = {
      0: "My Posts",
      1: "Followers",
      2: "Followings",
    };
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly(AppStrings.farmsanta),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Card(
                color: AppColors.white,
                child: Column(
                  children: [
                    60.heightBox,

                    // person name
                    CustomText(
                      textKey: widget.username,
                      color: AppColors.primary,
                    ),

                    //some spacing
                    5.heightBox,

                    // create new post button
                    CustomText(
                      textKey: "Following",
                      color: AppColors.white,
                      bold: true,
                      size: 16,
                    )
                        .pSymmetric(v: 4, h: 7)
                        .box
                        .make()
                        .color(AppColors.primary)
                        .cornerRadius(30)
                        .centered(),

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
                ).hPCT(context: context, heightPCT: 24),
              ).pLTRB(10, 40, 10, 0),

              // profile icon
              Positioned(
                top: 12,
                right: 0,
                left: 0,
                child: widget.username == AppStrings.farmsanta
                    ? CircleAvatar(
                        radius: 41,
                        backgroundColor: AppColors.white,
                        child: Image(
                          image: AssetImage(
                            ImageRoutes.mascotImage,
                          ),
                          height: 80,
                          width: 80,
                        ),
                      )
                    : Icon(
                        Icons.account_circle,
                        size: 90,
                      ),
              ),
            ],
          ).hOneThird(context),

          // tabbar of listview and gridview
          TabBar(
            dividerColor: AppColors.white,
            indicatorWeight: 0.1,
            controller: tabController,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.line_weight_sharp,
                  size: 40,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.grid_view_rounded,
                  size: 40,
                ),
              ),
            ],
          ).hPCT(context: context, heightPCT: 5),

          Expanded(
            child: TabBarView(
                controller: tabController,
                children: [PostListView(context), PostGridView()]),
          ),
        ],
      ).hFull(context)),
    );
  }

  //displaying data of post,follower and following widget
  Widget displayData({required String title, required String titleCount}) {
    return Column(
      children: [
        // display title count
        CustomText(
          size: 20,
          bold: true,
          textKey: titleCount,
          color: AppColors.subHeading,
        ),

        // display title
        CustomText(
          size: 15,
          bold: true,
          textKey: title,
          color: AppColors.subHeading,
        )
      ],
    );
  }

  //list view widget
  Widget PostListView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
              children: List.generate(
                  2,
                  (index) =>
                      FarmTalkPostCard(context, widget.message, onTap: () {
                        navigateToPageWithoutReplaceMent(
                            FarmTalkExploreDetailsScreen(
                          message: StoreHelper.store.message!,
                        ));
                      }))),
        ],
      ),
    );
  }

  // grid view widget
  Widget PostGridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      children: <Widget>[
        for (int i = 0; i < 1; i++)
          WidgetHelper()
              .getCachedImage(
                  widget.message.images[0].fileName, height * 0.8, width,
                  boxFit: BoxFit.fitHeight)
              .onTap(() {
            navigateToPageWithoutReplaceMent(FarmTalkExploreDetailsScreen(
                message: StoreHelper.store.message!));
          })
      ],
    );
  }

  Widget FarmTalkPostCard(
    BuildContext context,
    Message message, {
    dynamic onTap,
  }) {
    //Bottom Sheet
    void comments() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomInputField(
                prefixWidget: Icon(
                  MaterialSymbols.search,
                  size: 25,
                  color: AppColors.primary,
                ).onTap(() {}),

                showIcon: true,
                hint: AppStrings.comment,
                textEditingController: TextEditingController(),
                borderRadius: 25,
                fillColor: AppColors.grayLight,

                //filter icon
                suffixWidget: Icon(
                  MaterialSymbols.send,
                  size: 25,
                  color: AppColors.primary,
                ).onTap(() {}),
              ).p4(),

              //CommentSection
              CustomText(
                textKey: "View ${message.comments.length} Comments",
                size: 18,
              ).pSymmetric(v: 8, h: 2),

              for (int i = 0; i < message.comments.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 34,
                            ),
                            5.widthBox,
                            CustomText(
                              textKey: message.comments[i].createdBy,
                              color: AppColors.subHeading,
                            ),
                          ],
                        ),
                        CustomText(
                          textKey: message.comments[i].createdTimestamp,
                          color: AppColors.subHeading,
                        ),
                        Icon(
                          CustomIcons.menu,
                          color: AppColors.subHeading,
                          size: 16,
                        ),
                      ],
                    ),
                    CustomText(
                      textKey: message.comments[i].comment,
                      size: 18,
                      color: AppColors.subHeading,
                    ).pSymmetric(v: 2, h: 8),
                    Divider(
                      color: AppColors.gray,
                    ),
                  ],
                ).p2(),
            ],
          )
              .p4()
              .hPCT(context: context, heightPCT: 50)
              .box
              .make()
              .cornerRadius(5);
        },
      );
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Stack(
        children: [
          //image of card
          WidgetHelper()
              .getCachedImage(message.images[0].fileName, height * 0.45, width,
                  boxFit: BoxFit.fitHeight)
              .onTap(onTap),

          //date on left bottom Corner
          Positioned(
            bottom: 10,
            left: 10,
            child: CustomText(
              textKey: message.createdTimestamp,
              color: AppColors.white,
            )
                .p8()
                .box
                .make()
                .color(AppColors.black.withOpacity(0.5))
                .cornerRadius(100)
                .centered(),
          ),

          //like button
          Positioned(
              top: 15,
              right: 10,
              child: Icon(
                CustomIcons.like,
                color: AppColors.white,
                size: 22,
              )
                  .p8()
                  .box
                  .make()
                  .color(AppColors.black.withOpacity(0.5))
                  .cornerRadius(100)
                  .centered()
                  .onTap(null)),

          //comment button
          Positioned(
              top: 70,
              right: 10,
              child: Icon(
                Icons.comment,
                color: AppColors.white,
                size: 22,
              )
                  .p8()
                  .box
                  .make()
                  .color(AppColors.black.withOpacity(0.5))
                  .cornerRadius(100)
                  .centered()
                  .onTap(() {
                comments();
              })),

          //center arrow icon
          Positioned(
            top: 150,
            right: 0,
            left: 0,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 40,
              color: AppColors.transperant.withOpacity(0.5),
            )
                .p4()
                .box
                .make()
                .color(AppColors.white)
                .cornerRadius(100)
                .onInkTap(onTap)
                .centered(),
          ),
        ],
      ).p(10).box.make().color(AppColors.background),

      // like and comment button after image
      Row(
        children: [
          Icon(
            CustomIcons.like,
            size: 18,
            color: Colors.black,
          ),
          4.widthBox,
          CustomText(
            textKey: "${message.likes} likes",
            size: 18,
          ),
          20.widthBox,
          Icon(
            Icons.comment,
            size: 18,
            color: Colors.black,
          ),
          3.widthBox,
          CustomText(
            textKey: "${message.comments.length} comments",
            size: 18,
          ),
        ],
      ).pSymmetric(h: 34, v: 12),

      //text below image
      CustomText(
        textKey: message.title,
        size: 16,
      ).pSymmetric(h: 12),
      Text(
        message.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ).pSymmetric(h: 12),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomText(
          textKey: AppStrings.readmore,
          color: AppColors.primary,
        ),
        Icon(
          Icons.arrow_forward_sharp,
          color: AppColors.primary,
          size: 12,
        ),
      ]).onTap(onTap).pSymmetric(h: 12),

      //hashtags
      Row(
        children: [
          for (int i = 0; i < widget.message.tags.length; i++)
            CustomText(
              textKey: "#${widget.message.tags[i]}",
              color: Colors.blueAccent,
            ).pSymmetric(h: 2),
        ],
      ).pSymmetric(h: 12),
    ]);
  }
}
