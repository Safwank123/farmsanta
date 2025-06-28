import 'dart:math';

import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../Constants/strings.dart';
import '../../../Models/SupportPlace/CropCalender/CropCalender.dart';
import '../../../Models/SupportPlace/CropCalender/Task.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/classes/card_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import '../../base_screen.dart';
import 'add_crop_calender.dart';
import 'crop_calender_stage.dart';

class CropCalenderScreen extends BaseScreen {
  static String routeName = '/crop-calender-screen';
  final List<CropCalendar> calenderModelList;
  final List<List<CropStageCalendar>> stageModelList;
  const CropCalenderScreen(
      {super.key,
      required this.calenderModelList,
      required this.stageModelList});

  @override
  BaseScreenState<CropCalenderScreen> createState() =>
      _CropCalenderScreenState();
}

class _CropCalenderScreenState extends BaseScreenState<CropCalenderScreen> {
  int selectedIndex = 0;
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      //Top appbar

      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            //Crops on extended appbar
            SliverAppBar(
              expandedHeight: height * 0.15,
              collapsedHeight: 100,
              elevation: 0,
              backgroundColor: AppColors.primary,
              titleSpacing: 0,

              automaticallyImplyLeading: false,
              // expandedHeight: 70,
              title: CustomText(
                textKey: AppStrings.cropCalendar,
                color: AppColors.background,
                style: AppTextStyle.titleMedium,
              ),
              // flexibleSpace: FlexibleSpaceBar(
              //   centerTitle: true,
              //   title:
              // ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateToPageWithoutReplaceMent(AddCropCalender());
                  },
                  icon: const Icon(Icons.add_box),
                )
              ],
              // floating: true,
              // pinned: true,
              bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 40),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: 50,
                            color: AppColors.background,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        offset: const Offset(0, -15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              widget.calenderModelList.length, (index) {
                            return CardHelper.cropCalenderCard(
                              context,
                              widget.calenderModelList[index],
                              AppColors.orange,
                              selected: selectedIndex == index,
                            ).onTap(() {
                              setState(() {
                                selectedIndex = index;
                              });
                            });
                          }),
                        ).pSymmetric(h: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Rest Body
            SliverFillRemaining(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Calender Button
                    CustomButtonElevated(
                      customPrefix: Image.asset(
                        ImageRoutes.prefixCalenderIcon,
                        width: 20,
                      ).pOnly(right: 3),
                      onTap: () => _selectDate(context),
                      text: "${selectedDate.toLocal()}".split(' ')[0],
                    ).w(width * 0.35).pSymmetric(h: 15),

                    ...(widget.stageModelList)
                        .map((e) => stageWidget(e))
                        ,
                  ]
                  //mach with crop
                  ),
            ))
          ],
        ),
      ),
    );
  }

  Widget stageWidget(List<CropStageCalendar> modelList) {
    return Column(
      children: [
        //...(modelList).map((e) => stage(e)).toList(),
        for (int i = 0; i < modelList.length; i++) stage(modelList[i], i)
      ],
    );
  }

  Widget stage(CropStageCalendar model, int index) {
    return Column(
      children: [
        20.heightBox,
        Stack(
          children: [
            //background image
            Image.asset(
              "assets/images/crop_calender/pre_seedling_stage.png",
              width: width,
            ),

            //Title
            Positioned(
              left: 15,
              top: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey: model.stageName ?? "-",
                    style: AppTextStyle.bodyMedium
                        .copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  CustomText(
                    textKey: "${model.stageWeek} ${AppStrings.weeks}",
                    style:
                        AppTextStyle.bodyLarge.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                  //TODO date pending
                  CustomText(
                    textKey: "11 May - 15 May",
                    style:
                        AppTextStyle.bodySmall.copyWith(color: AppColors.white),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),

        20.heightBox,

        //Task Group
        if (model.stageList != null)
          ...(model.stageList!).map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey:
                        "${e.weekInfo?.abs() ?? ""} ${e.weekInfo!.isNegative ? AppStrings.weekBefore : AppStrings.weeks}",
                    style: AppTextStyle.titleSmall
                        .copyWith(color: AppColors.greenLight),
                  ).pSymmetric(h: 15),
                  10.heightBox,
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < min(3, e.tasklist!.length); i++)
                        if (i % 3 == 0)
                          taskCard(e.tasklist![i]).onTap(() {
                            navigateToPageWithoutReplaceMent(
                                CropCalenderStageScreen(
                              stageId: model.stageList![i].id!,
                              calenderStageModel: model,
                            ));
                          })
                        else
                          subtaskCard(e.tasklist![i]).onTap(() {
                            navigateToPageWithoutReplaceMent(
                                CropCalenderStageScreen(
                              stageId: model.stageList![i].id!,
                              calenderStageModel: model,
                            ));
                          })
                    ],
                  ).pSymmetric(h: 15)
                ],
              ))
      ],
    );
  }

  Widget taskCard(Tasklist model) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage:
              AssetImage("assets/images/crop_calender/pre_seedling_stage.png"),
        )
            .box
            .withDecoration(
                getBoxDecorationAllBorder(60, AppColors.white, AppColors.white))
            .make(),
        20.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                    textKey: model.oprationType!,
                    style: AppTextStyle.titleSmall
                        .copyWith(color: AppColors.primary))
                .pSymmetric(h: 12, v: 7)
                .box
                .make()
                .color(AppColors.textFieldLintBackground)
                .cornerRadius(5),
            10.heightBox,
            CustomText(
                textKey: model.oprationDescription!, //where to get description
                lines: 3,
                style:
                    AppTextStyle.bodyMedium.copyWith(color: AppColors.white)),
            10.heightBox,
            CustomText(
                textKey: AppStrings.readMore,
                style:
                    AppTextStyle.titleSmall.copyWith(color: AppColors.white)),
          ],
        ).expand()
      ],
    ).w(width).pSymmetric(h: 15, v: 10).box.make().color(AppColors.greenLight);
  }

  Widget subtaskCard(
    Tasklist list,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            WidgetHelper()
                .getCachedImage(list.taskImages![0], 100, width)
                .box
                .alignTopCenter
                .make(),
            CustomText(
                    textKey: list.oprationType!,
                    style: AppTextStyle.titleSmall
                        .copyWith(color: AppColors.primary, fontSize: 12))
                .pSymmetric(h: 5, v: 3)
                .box
                .make()
                .color(AppColors.textFieldLintBackground)
                .cornerRadius(5)
                .centered()
                .pOnly(top: 10, left: 5, right: 5),
          ],
        ),
        5.heightBox,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textKey: list.oprationDescription!,
              overflow: TextOverflow.ellipsis,
              lines: 3,
              style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white),
            ),
            CustomText(
                textKey: AppStrings.readMore,
                style:
                    AppTextStyle.titleSmall.copyWith(color: AppColors.white)),
          ],
        ).p(10),
      ],
    ).w(width / 2.2).color(AppColors.greenLight).pSymmetric(v: 10);
  }

  //datePicker
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

// List<StageModel> stages = [
//   StageModel("Pre-Seeding ", "description", "image", DateTime.now()),
// ];
