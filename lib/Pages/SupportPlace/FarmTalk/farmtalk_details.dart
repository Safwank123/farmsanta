import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Models/message/message.dart';
import '/Widgets/Widgets/custom_text.dart';
import '../../../../../Constants/strings.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../../../themeFiles/custom_icons.dart';
import '../../base_screen.dart';

class FarmTalkExploreDetailsScreen extends BaseScreen {
  static const routeName = "/farm-talk-explore-details-screen";
  final Message message;
  int currentPageIndex;
  FarmTalkExploreDetailsScreen( {required this.message, this.currentPageIndex = 0});

  @override
  BaseScreenState<FarmTalkExploreDetailsScreen> createState() => _FarmTalkExploreDetailsScreenState();
}

class _FarmTalkExploreDetailsScreenState extends BaseScreenState<FarmTalkExploreDetailsScreen> {

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.back),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  //image
                  WidgetHelper().getCachedImage(widget.message.images[0].fileName, height * 0.5, width, boxFit: BoxFit.fitHeight),

                  // farmsanta logo
                  Positioned(
                    left: 7,
                    top: 7,
                    child: Row(
                      children: [
                        Image.asset(
                          ImageRoutes.mascotIntroImage,
                          height: 35,
                          width: 35,
                        ),
                        CustomText(
                          textKey: AppStrings.farmsanta,
                          color: AppColors.white,
                        ),
                      ],
                    ).p4().box.make().color(AppColors.invert.withOpacity(0.4)).cornerRadius(100).centered(),
                  ),

                  //date on left bottom
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: CustomText(
                      textKey: widget.message.createdTimestamp,
                      color: AppColors.white,
                    ).p8().box.make().color(AppColors.invert.withOpacity(0.4)).cornerRadius(100).centered(),
                  ),
                ],
              ),
              10.heightBox,

              //row of like comment and save icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(
                      CustomIcons.like,
                      color: AppColors.red,
                      size: 20,
                    ),
                    10.widthBox,
                    Icon(
                      Icons.comment,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ]),
                  Icon(
                    CustomIcons.save,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ],
              ).p8(),
              10.heightBox,

              //title
              CustomText(
                textKey: widget.message.title,
                color: Colors.black,
              ),

              //description
              CustomText(
                textKey: widget.message.description,
                color: AppColors.subHeading,
              ),
              5.heightBox,

              //hastags
              Row(
                children: [
                  for(int i=0; i<widget.message.tags.length; i++)
                    CustomText(
                      textKey: "#${widget.message.tags[i]}",
                      color: Colors.blueAccent,
                    ).pSymmetric(h: 2),
                ],
              ).pSymmetric(h: 12),

              //
              Row(
                children: [
                  Icon(
                    CustomIcons.like,
                    size: 18,
                  ),
                  4.widthBox,
                  CustomText(
                    textKey: "${widget.message.likes} likes",
                    size: 18,
                  ),
                  10.widthBox,
                  Icon(
                    Icons.comment_outlined,
                    size: 18,
                  ).onTap(null),
                  3.widthBox,
                  CustomText(
                    textKey: "${widget.message.comments.length}  comments",
                    size: 18,
                  ),
                ],
              ).p16(),

              //CommentSection
              for(int i=0; i<widget.message.comments.length; i++)
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
                            textKey: widget.message.comments[i].createdBy,
                            color: AppColors.subHeading,
                          ),
                        ],
                      ),
                      CustomText(
                        textKey: widget.message.comments[i].createdTimestamp,
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
                    textKey: widget.message.comments[i].comment,
                    size: 18,
                    color: AppColors.subHeading,
                  ).pSymmetric(v: 2, h: 8),
                  Divider(
                    color: AppColors.gray,
                  ),
                ],
              ).p2(),
            ],
          ).box.make().p12(),
        ));
  }
}
