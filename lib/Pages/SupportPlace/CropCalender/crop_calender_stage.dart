// ignore_for_file: must_be_immutable



import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/StageWeek.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Models/SupportPlace/CropCalender/Task.dart';
import '../../../Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import '../../base_screen.dart';

class CropCalenderStageScreen extends BaseScreen {
  static const routeName = "/crop-calender-stage-screen";
  CropStageCalendar calenderStageModel;
  int stageId;
  CropCalenderStageScreen({
    super.key,
    required this.calenderStageModel,
    required this.stageId,
  });

  @override
  BaseScreenState<CropCalenderStageScreen> createState() =>
      _CropCalenderStageScreenState();
}

class _CropCalenderStageScreenState
    extends BaseScreenState<CropCalenderStageScreen> {
  List<String> stageNames = [];
  StageWeek? selectedStage;
  Tasklist? selectedTask;
  int taskWeekInfo = 0;
  int startWeek = 0;
  int finalWeek = 0;
  String selectedStageName = '';
  int selectedStageIndex = 0;

  @override
  void initState() {
    //Stores all the Stage names of a particular crop
    for (var stage in widget.calenderStageModel.stageList!) {
      for (var task in stage.tasklist!) {
        if (!stageNames.contains(task.oprationName)) {
          stageNames.add(task.oprationName!);
        }
      }
    }
    //Updates UI according to action
    updateStageWeekUI(widget.stageId);
    super.initState();
  }

  //Updating Week part of the UI when clicked Next or Previous
  void updateStageWeekUI(int stageID) {
    bool isExecuted = false;
    for (var stage in widget.calenderStageModel.stageList!) {
      if (stage.id == stageID) {
        for (var task in stage.tasklist!) {
          if (task.id == stage.tasklist![0].id!) {
            setState(() {
              selectedStage = stage;
              taskWeekInfo = stage.weekInfo!;
              selectedTask = task;
              selectedStageName = task.oprationName!;
            });
            break;
          }
        }
      }
    }
    //To fetch Start Week and Final Week
    for (var stage in widget.calenderStageModel.stageList!) {
      if (stage.tasklist![0].oprationName == selectedStageName && !isExecuted) {
        isExecuted = true;
        setState(() {
          startWeek = stage.weekInfo!;
        });
      }
      if (stage.tasklist![0].oprationName == selectedStageName && isExecuted) {
        setState(() {
          finalWeek = stage.weekInfo!;
        });
      }
    }
  }

  //Updates the UI when the Stage Slider is changed
  void updateStageUI(String stageName) {
    for (var stage in widget.calenderStageModel.stageList!) {
      for (var task in stage.tasklist!) {
        if (task.oprationName == stageName) {
          updateStageWeekUI(stage.id!);
          return;
        }
      }
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top Bar including Stage Slider & List of Tasks Stacked of the particular Stage
              SizedBox(
                height: height * 0.27,
                child: Stack(
                  children: [
                    Container(
                      color: AppColors.greenLight,
                      height: height * 0.25 - height * 0.075,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                //Stage Slider
                                Container(
                                  height: height * 0.03,
                                  decoration: StyleHelper.getBoxDecorationAll(
                                      height * 0.015, AppColors.background),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (selectedStageName ==
                                                  stageNames[0] ||
                                              selectedStageIndex == 0) {
                                            null;
                                          } else {
                                            setState(() {
                                              selectedStageIndex--;
                                              updateStageUI(stageNames[
                                                  selectedStageIndex]);
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.chevron_left_sharp,
                                          color: AppColors.greenLight,
                                        ).iconSize(25),
                                      ),
                                      10.widthBox,
                                      CustomText(
                                        textKey:
                                            "$selectedStageName ${AppStrings.stage}",
                                        style: AppTextStyle.labelLarge,
                                        color: AppColors.greenLight,
                                      ),
                                      10.widthBox,
                                      GestureDetector(
                                        onTap: () {
                                          if (selectedStageName ==
                                                  stageNames[
                                                      stageNames.length - 1] ||
                                              selectedStageIndex ==
                                                  stageNames.length - 1) {
                                            null;
                                          } else {
                                            setState(() {
                                              selectedStageIndex++;
                                              updateStageUI(stageNames[
                                                  selectedStageIndex]);
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.chevron_right_sharp,
                                          color: AppColors.greenLight,
                                        ).iconSize(25),
                                      ),
                                    ],
                                  ),
                                ),
                                (height * 0.015).heightBox,
                                //Stage Weeks
                                CustomText(
                                  textKey: startWeek.isNegative
                                      ? "0-1 ${AppStrings.beforeWeeks}"
                                      : "$startWeek-$finalWeek ${AppStrings.weeks}",
                                  style: AppTextStyle.titleSmall,
                                  color: AppColors.background,
                                ),
                                (height * 0.0025).heightBox,
                                //TODO: Need to be changed according to Sowing Date
                                CustomText(
                                  textKey: "11 May-15 Jun",
                                  style: AppTextStyle.labelSmall,
                                  color: AppColors.background,
                                ),
                              ],
                            ),
                          )
                        ],
                      ).pSymmetric(v: 20),
                    ),
                    //BackButton
                    Positioned(
                      top: 10,
                      child: IconButton(
                        color: AppColors.background,
                        icon: const Icon(Icons.chevron_left_sharp).iconSize(30),
                        onPressed: () {},
                      ),
                    ),
                    //List View of Operation Names of different tasks.
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedStage!.tasklist!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return taskListItem(
                                  selectedStage!.tasklist![index].oprationName!)
                              .pSymmetric(h: 5);
                        },
                      ).h(height * 0.115),
                    )
                  ],
                ),
              ),
              //Details of Tasks corrsponding to that Stage
              WidgetHelper()
                  .getCachedImage(
                    "https://img.freepik.com/premium-photo/spring-sowing-season-farmer-with-tractor-sows-corn-seeds-his-field-planting-corn-with-trailed-planter-farming-seeding-concept-agriculture-agricultural-machinery_194143-6605.jpg",
                    height * 0.35,
                    width,
                    boxFit: BoxFit.fitHeight,
                  )
                  .cornerRadius(5)
                  .pSymmetric(h: 15, v: 20),
              Container(
                decoration: StyleHelper.getBoxDecorationAll(
                  25,
                  AppColors.greenLight,
                ),
                child: CustomText(
                  textKey: "${selectedTask!.oprationName} ${AppStrings.stage}",
                  style: AppTextStyle.labelLarge,
                  color: AppColors.background,
                ).pSymmetric(v: 7, h: 10),
              ).pSymmetric(v: 15, h: 10),
              (height * 0.03).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    textKey: taskWeekInfo.isNegative
                        ? "${taskWeekInfo.abs()} ${AppStrings.weekBefore}"
                        : "${AppStrings.week} $taskWeekInfo",
                    color: AppColors.primary,
                    style: AppTextStyle.titleSmall,
                  ),
                  //TODO: Need to be changed according to Sowing Date
                  CustomText(
                    textKey: "(11 May-15 Jun)",
                    color: AppColors.subHeading,
                  )
                ],
              ).pSymmetric(h: 15),
              (height * 0.02).heightBox,
              //ListView for all tasks
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectedStage!.tasklist!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textKey: selectedStage!.tasklist![index].oprationType!,
                        color: AppColors.primary,
                        style: AppTextStyle.labelLarge,
                      ).pSymmetric(h: 15),
                      (height * 0.01).heightBox,
                      CustomText(
                        color: AppColors.black,
                        style: AppTextStyle.bodyMedium,
                        textKey: selectedStage!
                            .tasklist![index].oprationDescription!,
                      ).pSymmetric(h: 15, v: 5),
                    ],
                  );
                },
              ),
              (height * 0.04).heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Previous Button
                  Container(
                    decoration: StyleHelper.getBoxDecorationAll(
                      25,
                      selectedStage!.weekInfo == startWeek
                          ? AppColors.greenDisable
                          : AppColors.greenLight,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left_sharp,
                          color: selectedStage!.weekInfo == startWeek
                              ? AppColors.subHeading
                              : AppColors.background,
                        ).iconSize(25),
                        10.widthBox,
                        CustomText(
                          textKey: AppStrings.previous,
                          style: AppTextStyle.labelLarge,
                          color: selectedStage!.weekInfo == startWeek
                              ? AppColors.subHeading
                              : AppColors.background,
                        ),
                      ],
                    ).pSymmetric(v: 5, h: 10),
                  ).onInkTap(() {
                    if (selectedStage!.weekInfo == startWeek) {
                      null;
                    } else {
                      updateStageWeekUI(selectedStage!.id! - 1);
                    }
                  }),
                  //Next Button
                  Container(
                    decoration: StyleHelper.getBoxDecorationAll(
                      25,
                      selectedStage!.weekInfo == finalWeek
                          ? AppColors.greenDisable
                          : AppColors.greenLight,
                    ),
                    child: Row(
                      children: [
                        CustomText(
                          textKey: AppStrings.next,
                          style: AppTextStyle.labelLarge,
                          color: selectedStage!.weekInfo == finalWeek
                              ? AppColors.subHeading
                              : AppColors.background,
                        ),
                        10.widthBox,
                        Icon(
                          Icons.chevron_right_sharp,
                          color: selectedStage!.weekInfo == finalWeek
                              ? AppColors.subHeading
                              : AppColors.background,
                        ).iconSize(25),
                      ],
                    ).pSymmetric(v: 5, h: 10),
                  ).onInkTap(
                    () {
                      if (selectedStage!.weekInfo == finalWeek) {
                        null;
                      } else {
                        updateStageWeekUI(selectedStage!.id! + 1);
                      }
                    },
                  ),
                ],
              ).p(10)
            ],
          ),
        ),
      ),
    );
  }
}

Widget taskListItem(String operationName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.035),
          border: Border.all(color: AppColors.background, width: 1.0),
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.greenLight,
          radius: height * 0.035,
          backgroundImage: const NetworkImage(
              "https://cdn.shopify.com/s/files/1/1789/8583/articles/sprout1_600x.png?v=1611088320"),
        ),
      ),
      (height * 0.01).heightBox,
      Container(
        height: height * 0.03,
        decoration: BoxDecoration(
          color: AppColors.greenLight,
          borderRadius: BorderRadius.circular(height * 0.01),
        ),
        child: CustomText(
          textKey: operationName,
          style: AppTextStyle.labelSmall,
          color: AppColors.background,
        ).pSymmetric(v: 5, h: 8),
      )
    ],
  ).centered();
}
