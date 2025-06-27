import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../base_screen.dart';
import '/Widgets/Widgets/custom_text.dart';
import '/Widgets/classes/app_bar.dart';
import '../../../../../../Constants/colors.dart';
import '../../../../../../Constants/strings.dart';
import '../../../../../../Functions/common.dart';
import '../../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../../../../themeFiles/app_typography.dart';
import '/Models/SupportPlace/farmscout/advisory_details.dart';
import '/Models/SupportPlace/farmscout/advisory_table.dart';
import '/Models/SupportPlace/farmscout/farm_scouting.dart';

class SolvedQuery extends BaseScreen {
  static const String routeName = "/solved-query-screen";
  final int currentPageIndex;
  final String title;
  final FarmScouting farmScoutingModel;

  final AdvisoryDetails advisoryDetails;
  final AdvisoryTable advisoryTable;

  const SolvedQuery(
      {super.key,
      required this.title,
      this.currentPageIndex = 0,
      required this.advisoryDetails,
      required this.advisoryTable,
      required this.farmScoutingModel});

  @override
  BaseScreenState<SolvedQuery> createState() => _SolvedQueryState();
}

class _SolvedQueryState extends BaseScreenState<SolvedQuery>
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
    return Scaffold(
      // App Bar with Title and Icon Button
      appBar: AppBarDesigns.getAppTitleAndIconButton(
        '${widget.title} ${AppStrings.query}',
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: AppColors.gray,
          ),
        ),
      ),
      body: SingleChildScrollView(
        //  Column
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // image
              imageCardWithDateAndTag(
                image: widget.farmScoutingModel.images
                    .firstWhere((image) =>
                        image.status == AppStrings.solved.trim().toLowerCase())
                    .image!,
                tag: AppStrings.querySolved,
                date: DateFormat('d MMMM, y').format(
                    DateTime.parse(widget.farmScoutingModel.createdTimestamp!)),
              ).hPCT(context: context, heightPCT: 48),

              // some spacing
              10.heightBox,

              // plant value data
              CustomText(
                textKey:
                    '${AppStrings.plant.capitalized}: ${widget.farmScoutingModel.crop}',
                color: AppColors.primary,
              ),

              // some spacing
              10.heightBox,

              // Query Card
              queryCard(
                query: widget.farmScoutingModel.caption,
                isIcon: true,
              ),

              // some spacing
              10.heightBox,

              //Query solution tag and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageRoutes.circularLogo,
                        height: 20,
                        width: 20,
                      ),
                      5.widthBox,
                      CustomText(
                        textKey: AppStrings.querySolution,
                        color: AppColors.white,
                      )
                    ],
                  )
                      .pSymmetric(v: 5, h: 10)
                      .box
                      .make()
                      .color(AppColors.primary)
                      .cornerRadius(15)
                      .centered(),
                  CustomText(
                    textKey: DateFormat('d MMMM, y').format(DateTime.parse(
                        widget.farmScoutingModel.createdTimestamp!)),
                    color: AppColors.gray,
                  ),
                ],
              ),

              // some spacing
              10.heightBox,

              //tab bar section
              Column(
                children: [
                  // Tab Bar
                  TabBar(
                    // isScrollable: true,
                    controller: tabController,
                    tabs: tabs(),
                  ).hPCT(context: context, heightPCT: 5),

                  // Tab Bar View
                  Expanded(
                    child: TabBarView(controller: tabController, children: [
                      issueCharacteristicsContent(),
                      chemicalControlContent()
                    ]),
                  ),
                ],
              )
                  .h(height * 0.5)
                  .w(width)
                  .color(AppColors.grayLight)
                  .cornerRadius(10),

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
                        image.status == AppStrings.solved.trim().toLowerCase())
                    .comment!,
                color: AppColors.gray,
              ).w(width).box.make().p(5).color(AppColors.greenLight)
            ]).p16(),
      ),
    );
  }

// list of tab widgets
  List<Widget> tabs() {
    return tabNames.map((e) => tabWidget(e)).toList();
  }

  // list of tab names
  List<String> tabNames = [
    AppStrings.issueCharacteristics,
    AppStrings.chemicalControl
  ];

  //Tab Widget
  Widget tabWidget(String title) {
    return CustomText(
      textKey: title,
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
          child: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: AppColors.white,
              ),
              CustomText(
                  textKey: tag,
                  style: AppTextStyle.bodyMedium
                      .copyWith(color: AppColors.white, fontSize: 12))
            ],
          )
              .pSymmetric(v: 5, h: 10)
              .box
              .make()
              .color(AppColors.primary)
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

  //issue characteristics content
  Widget issueCharacteristicsContent() {
    var issueCharacteristicsLabel = {
      0: AppStrings.name,
      1: AppStrings.symptomsOfAttack,
      2: AppStrings.favourableConditions,
      3: AppStrings.preventiveMeasures,
      4: AppStrings.culturalMechanicalControl,
      5: AppStrings.description,
      6: AppStrings.culturalControl,
    };
    var issueCharacteristicsvalues = {
      0: widget.advisoryDetails.localName,
      1: widget.advisoryDetails.symptomsOfAttack,
      2: widget.advisoryDetails.favourableConditions,
      3: widget.advisoryDetails.preventiveMeasures,
      4: widget.advisoryDetails.culturalMechanicalControl,
      5: widget.advisoryDetails.description,
      6: widget.advisoryDetails.culturalControl,
    };

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < issueCharacteristicsLabel.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // label
                CustomText(
                  textKey: '${issueCharacteristicsLabel[i]!}:',
                  bold: true,
                ),

                //content
                CustomText(
                  textKey: "${issueCharacteristicsvalues[i]}",
                ),
              ],
            ).p(15),
        ],
      ),
    );
  }

  //issue characteristics content
  Widget chemicalControlContent() {
    var issueCharacteristicsLabel = {
      0: AppStrings.formulation,
      1: AppStrings.formulationType,
      2: AppStrings.cultivarGroups,
      3: AppStrings.cultivars,
      4: AppStrings.dosageOnly,
      5: AppStrings.dosageMethod,
      6: AppStrings.waterRequirement,
      7: AppStrings.applicationMethod,
      8: AppStrings.toxicityLevel,
      9: AppStrings.modeOfAction,
    };

    var issueCharacteristicsValues = {
      0: widget.advisoryTable.formulation,
      1: widget.advisoryTable.formulationType,
      2: "",
      3: "", //TODO: parameter not present in its respective model
      4: '${widget.advisoryTable.dosage?.unit} ${widget.advisoryTable.dosage?.uom}',
      5: widget.advisoryTable.dosageMethod,
      6: '${widget.advisoryTable.waterRequirement?.unit} ${widget.advisoryTable.waterRequirement?.uom}',
      7: widget.advisoryTable.applicationMethod,
      8: widget.advisoryTable.toxicityLevel,
      9: widget.advisoryTable.modeOfAction,
    };

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < issueCharacteristicsLabel.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // label
                CustomText(
                  textKey: '${issueCharacteristicsLabel[i]!}:',
                  bold: true,
                ),

                //content
                CustomText(
                  textKey: '${issueCharacteristicsValues[i]}',
                ),
              ],
            ).p(15),
        ],
      ),
    );
  }
}

// tag widget for displaying icon and text on top of image
Widget tagWidget({
  required Icon icon,
  required String title,
  Color backgroundColor = primaryColor,
}) {
  return Container(
    decoration: getBoxDecorationAll(25, backgroundColor),
    child: Row(
      children: [
        icon,
        5.widthBox,
        CustomText(
          textKey: title,
          // size: 8,
          color: AppColors.white,
        ),
        5.widthBox,
      ],
    ),
  ).pSymmetric(v: 6, h: 12);
}

// Query Card
Widget queryCard(
    {required String query, required bool isIcon, Function()? onIconPressed}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingAndAnyWidgetInRowWithSpaceBetween(
        heading: AppStrings.query,
        widget: isIcon
            ? IconButton(
                onPressed: onIconPressed,
                icon: Icon(
                  Icons.message_rounded,
                  color: AppColors.primary,
                ))
            : Container(),
      ),

      // some spacing
      5.heightBox,

      // query
      CustomText(textKey: query)
    ],
  ).p12().box.make().color(AppColors.grayLight).cornerRadius(10);
}

// A row containing heading and any widget with space between
Widget headingAndAnyWidgetInRowWithSpaceBetween(
    {required String heading, required Widget widget}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        textKey: heading,
        color: AppColors.primary,
      ),
      widget,
    ],
  );
}
