import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/CropCalender.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/Task.dart';
import 'package:farmsanta_new/Pages/SupportPlace/CropCalender/add_crop_calender.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Constants/strings.dart';

class CropCalenderScreen extends BaseScreen {
  static String routeName = '/crop-calender-screen';

  final List<CropCalendar> calenderModelList;
  final List<List<CropStageCalendar>> stageModelList;

  const CropCalenderScreen({
    super.key,
    required this.calenderModelList,
    required this.stageModelList,
  });

  @override
  BaseScreenState<CropCalenderScreen> createState() => _CropCalenderScreenState();
}

class _CropCalenderScreenState extends BaseScreenState<CropCalenderScreen> {
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  String? selectedMonth;

  final Map<String, String> monthCropInfo = {
    'January': 'Sow winter crops like carrots and cabbage.',
    'February': 'Prepare for sunflower and maize.',
    'March': 'Plant tomatoes and chilies.',
    'April': 'Irrigate and protect seedlings.',
    'May': 'Harvest rabi; prep for kharif.',
    'June': 'Sow rice, maize, cotton.',
    'July': 'Apply fertilizers, monitor rain.',
    'August': 'Do weeding and pest control.',
    'September': 'Harvest early kharif crops.',
    'October': 'Sow wheat and mustard.',
    'November': 'Irrigate wheat, sow onions.',
    'December': 'Harvest kharif; sow vegetables.',
  };

  @override
  void initState() {
    super.initState();
    if (widget.calenderModelList.isNotEmpty) {
      selectedMonth = _getMonthName(widget.calenderModelList.first.startDate);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverFillRemaining(
              hasScrollBody: true,
              child: ListView(
                children: [
                  _buildDropdown(),
                  _buildMonthInfo(),
                  _buildDatePicker(),
                  _buildStageData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: height * 0.15,
      collapsedHeight: 100,
      backgroundColor: AppColors.primary,
      title: CustomText(
        textKey: AppStrings.cropCalendar,
        color: AppColors.background,
        style: AppTextStyle.titleMedium,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add_box),
          onPressed: () => navigateToPageWithoutReplaceMent(const AddCropCalender()),
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          children: [
            Container(height: 50, width: width, color: AppColors.background),
            Transform.translate(
              offset: const Offset(0, -15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.calenderModelList.length, (index) {
                  return CardHelper.cropCalenderCard(
                    context!,
                    widget.calenderModelList[index],
                    AppColors.orange,
                    selected: selectedIndex == index,
                  ).onTap(() {
                    setState(() {
                      selectedIndex = index;
                      selectedMonth = _getMonthName(widget.calenderModelList[index].startDate);
                    });
                  });
                }),
              ).pSymmetric(h: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    if (widget.calenderModelList.isEmpty) return const SizedBox();
    return DropdownButton<String>(
      value: selectedMonth ?? _getMonthName(widget.calenderModelList.first.startDate),
      items: widget.calenderModelList.map((calendar) {
        final month = _getMonthName(calendar.startDate);
        return DropdownMenuItem(value: month, child: Text(month));
      }).toList(),
      onChanged: (value) {
        final index = widget.calenderModelList.indexWhere(
            (c) => _getMonthName(c.startDate) == value);
        if (index != -1) {
          setState(() {
            selectedMonth = value;
            selectedIndex = index;
          });
        }
      },
    ).pSymmetric(h: 15, v: 10);
  }

  Widget _buildMonthInfo() {
    if (selectedMonth == null || !monthCropInfo.containsKey(selectedMonth!)) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textKey: 'Crop Info for $selectedMonth',
            style: AppTextStyle.titleMedium.copyWith(color: AppColors.primary),
          ),
          8.heightBox,
          CustomText(
            textKey: monthCropInfo[selectedMonth!]!,
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return CustomButtonElevated(
      customPrefix: Image.asset(ImageRoutes.prefixCalenderIcon, width: 20).pOnly(right: 3),
      onTap: () => _selectDate(context!),
      text: "${selectedDate.toLocal()}".split(' ')[0],
    ).w(width * 0.35).pSymmetric(h: 15);
  }

  Widget _buildStageData() {
    if (widget.stageModelList.isEmpty || selectedIndex >= widget.stageModelList.length) {
      return _noDataText();
    }

    final stages = widget.stageModelList[selectedIndex];
    if (stages.isEmpty) return _noDataText();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(stages.length, (i) => _buildStageCard(stages[i], i)),
    );
  }

  Widget _noDataText() {
    return Center(
      child: CustomText(
        textKey: "No Crop Stage Data",
        style: AppTextStyle.bodyMedium,
      ).p(20),
    );
  }

  Widget _buildStageCard(CropStageCalendar model, int index) {
    return Column(
      children: [
        20.heightBox,
        Stack(
          children: [
            Image.asset("assets/images/crop_calender/pre_seedling_stage.png",
              width: width, height: 180, fit: BoxFit.cover),
            Positioned(
              left: 15,
              top: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey: model.stageName ?? "-",
                    style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white),
                  ),
                  CustomText(
                    textKey: "${model.stageWeek ?? '-'} ${AppStrings.weeks}",
                    style: AppTextStyle.bodyLarge.copyWith(color: AppColors.white),
                  ),
                  CustomText(
                    textKey: "11 May - 15 May", // TODO: Replace with dynamic date if needed
                    style: AppTextStyle.bodySmall.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        20.heightBox,
        if (model.stageList != null)
          for (var week in model.stageList!)
            for (var task in week.tasklist ?? [])
              _buildTaskCard(task),
      ],
    );
  }

  Widget _buildTaskCard(Tasklist task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              (task.taskImages != null && task.taskImages!.isNotEmpty)
                  ? task.taskImages!.first
                  : "assets/images/crop_calender/pre_seedling_stage.png",
            ),
          ),
          16.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: task.oprationType ?? "",
                  style: AppTextStyle.titleSmall.copyWith(color: AppColors.primary),
                )
                    .pSymmetric(h: 10, v: 6)
                    .box
                    .color(AppColors.textFieldLintBackground)
                    .withRounded(value: 5)
                    .make(),
                8.heightBox,
                CustomText(
                  textKey: task.oprationDescription ?? "",
                  lines: 3,
                  style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white),
                ),
                8.heightBox,
                CustomText(
                  textKey: AppStrings.readMore,
                  style: AppTextStyle.titleSmall.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  String _getMonthName(DateTime? date) {
    if (date == null) return 'Unknown';
    return [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ][date.month - 1];
  }
}
