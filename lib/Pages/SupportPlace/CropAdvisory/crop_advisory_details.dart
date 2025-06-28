
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class CropAdvisoryDetailScreen extends BaseScreen {
  static const routeName = "/crop-advisory-details-screen";
  final CropAdvisoryModel model;
  int currentPageIndex;
  CropAdvisoryDetailScreen({super.key, required this.model, this.currentPageIndex = 0});

  @override
  BaseScreenState<CropAdvisoryDetailScreen> createState() =>
      _CropAdvisoryDetailScreenState();
}

class _CropAdvisoryDetailScreenState
    extends BaseScreenState<CropAdvisoryDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.back),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //image
                  WidgetHelper()
                      .getCachedImage(
                          getImagePath(widget.model.photos[0].fileName ?? ""),
                          height * 0.4,
                          width,
                          boxFit: BoxFit.fitHeight)
                      .cornerRadius(10.0),

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
                    )
                        .p(6)
                        .box
                        .make()
                        .color(AppColors.invert.withOpacity(0.4))
                        .cornerRadius(100)
                        .centered(),
                  )
                ],
              ),
              26.heightBox,

              //title
              CustomText(
                textKey: AppStrings.advisory + widget.model.advisoryTagName,
                color: Colors.black,
                bold: true,
              ),
              17.heightBox,

              //filter tabs
              Row(children: [
                WidgetHelper.filterTab(AppStrings.plant,
                    widget.model.cropName ?? "", AppColors.primary),
                10.widthBox,
                WidgetHelper.filterTab(AppStrings.growthStage,
                    widget.model.growthStageName ?? "", AppColors.primary),
              ]),
              17.heightBox,

              //description
              CustomText(
                textKey: widget.model.advisory,
                color: AppColors.subHeading,
              ),
              17.heightBox,

              //product recommendation title
              Row(
                children: [
                  Image(
                    image: AssetImage(ImageRoutes.logoIconWhiteBG),
                    width: 35,
                    height: 35,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey: AppStrings.productRecommendation,
                    color: AppColors.subHeading,
                  ),
                ],
              ).p8(),

              //product recommendation text
              CustomText(
                      textKey: widget.model.productRecommendation,
                      color: AppColors.subHeading)
                  .p8(),
              15.heightBox,

              // uploaded data

              Row(
                children: [
                  CustomText(
                    textKey: AppStrings.uploadedon,
                    color: AppColors.primary,
                  ),
                  CustomText(
                    textKey:
                        getFormatedDateTime1(widget.model.updatedTimestamp),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          ).box.make().p16(),
        ));
  }
}
