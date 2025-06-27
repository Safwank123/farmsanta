import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../../../base_screen.dart';
import './solved_query.dart';
import '../../../../../../Constants/strings.dart';
import '../../../../../../Routes/image_routes.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../../Widgets/classes/app_bar.dart';
import '../../../../../../Widgets/classes/style_helper.dart';
import '../../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../../../../themeFiles/app_typography.dart';
import '../Widgets/my_queries_card.dart';

class PendingQuery extends BaseScreen {
  static const String routeName = "/pending-query-screen";
  final String title;

  final FarmScouting farmScoutingModel;

  const PendingQuery(
      {super.key, required this.title, required this.farmScoutingModel});

  @override
  BaseScreenState<PendingQuery> createState() => _PendingQueryState();
}

class _PendingQueryState extends BaseScreenState<PendingQuery> {
  @override
  Widget buildWidget(BuildContext context) {
    var propertyMap = {
      0: AppStrings.plant.capitalized,
      1: AppStrings.location,
      2: AppStrings.growthStage,
      3: AppStrings.plantPartIssue,
    };

    var valueMap = {
      0: widget.farmScoutingModel.crop,
      1: widget.farmScoutingModel.territory![0],
      2: widget.farmScoutingModel.cropStage,
      3: widget.farmScoutingModel.images
          .where((image) =>
              image.status == AppStrings.pending.trim().toLowerCase())
          .toList()[0]
          .plantPart,
    };

    return Scaffold(
      // App Bar with Title
      appBar: AppBarDesigns.getAppTitleOnly(
        iconColor: AppColors.invert,
        '${widget.title} ${AppStrings.query}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      body: SingleChildScrollView(
        //  Column
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          // image
          imageCardWithDateAndTag(
                  image: widget.farmScoutingModel.images
                      .firstWhere((image) =>
                          image.status ==
                          AppStrings.pending.trim().toLowerCase())
                      .image!,
                  tag: AppStrings.pendingQuery,
                  date: DateFormat('d MMMM, y').format(DateTime.parse(
                      widget.farmScoutingModel.createdTimestamp!)))
              .hPCT(context: context, heightPCT: 48),

          10.heightBox,

          // property value data
          for (int i = 0; i < 4; i++)
            propertyValueWidget(property: propertyMap[i]!, value: valueMap[i]!),

          // some spacing
          10.heightBox,

          // Query Card
          queryCard(query: widget.farmScoutingModel.caption, isIcon: false),

          // some spacing
          10.heightBox,

          // Query Solution Card
          querySolutionCard(context),

          // some spacing
          10.heightBox,

          // personalize notes text
          Row(
            children: [
              Image.asset(
                ImageRoutes.circularLogo,
                height: 25,
                width: 25,
              ),
              5.widthBox,
              CustomText(
                textKey: AppStrings.personalizedNotes,
                color: AppColors.gray,
              )
            ],
          ),

          // some spacing
          10.heightBox,

          // thank you for using FS App
          CustomText(
            textKey: widget.farmScoutingModel.images
                .firstWhere((image) =>
                    image.status == AppStrings.pending.trim().toLowerCase())
                .comment!,
            color: AppColors.gray,
          ).w(width).box.make().p(5).color(AppColors.greenLight)
        ]).p16(),
      ),
    );
  }

  // imaga card widget with date and tag widget
  Widget imageCardWithDateAndTag(
      {required String tag, required String date, required String image}) {
    return Stack(
      children: [
        // image
        WidgetHelper()
            .getCachedImage(image, height * 0.48, width, boxFit: BoxFit.cover),
        Positioned(
          top: 5,
          left: 5,
          child: CustomText(
                  textKey: tag,
                  style: AppTextStyle.bodyMedium
                      .copyWith(color: AppColors.white, fontSize: 12))
              .pSymmetric(v: 5, h: 10)
              .box
              .make()
              .color(AppColors.orange)
              .cornerRadius(15)
              .centered(),
        ),

        Positioned(
          bottom: 5,
          left: 5,
          child: CustomText(
                  textKey: date,
                  style: AppTextStyle.bodySmall
                      .copyWith(color: AppColors.white, fontSize: 12))
              .pSymmetric(v: 5, h: 10)
              .box
              .make()
              .color(AppColors.invert.withOpacity(0.5))
              .cornerRadius(15)
              .centered(),
        )
      ],
    ).box.make().cornerRadius(15).pOnly(right: 10);
  }

  // Query Solution Card
  Widget querySolutionCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // heading
        CustomText(
          textKey: AppStrings.querySolution,
          color: AppColors.primary,
        ),

        20.heightBox,
        // Pending Query tag
        CustomText(
                textKey: '${AppStrings.pending} ${AppStrings.query}',
                style: AppTextStyle.bodySmall.copyWith(color: AppColors.white))
            .pSymmetric(v: 5, h: 10)
            .box
            .make()
            .color(AppColors.invert.withOpacity(0.1))
            .cornerRadius(15)
            .centered(),
      ],
    )
        .p12()
        .wFull(context)
        .hPCT(context: context, heightPCT: 20)
        .box
        .make()
        .color(AppColors.grayLight)
        .cornerRadius(10);
  }
}
