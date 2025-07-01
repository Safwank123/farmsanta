import 'dart:io'; // Required for FileImage

import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/CropCalender.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/CropStageCalendar.dart';
import 'package:farmsanta_new/Models/SupportPlace/CropCalender/Task.dart';
import 'package:farmsanta_new/Pages/SupportPlace/CropCalender/add_crop_calender.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:intl/intl.dart';

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
    'January': '🌱 Sow winter crops like carrots, cabbage, and spinach. Irrigate moderately.',
    'February': '🌻 Prepare for sunflower and maize sowing. Maintain field moisture.',
    'March': '🍅 Start planting tomatoes, chilies, and brinjal. Pest monitoring advised.',
    'April': '💧 Irrigate and protect seedlings from early heat stress.',
    'May': '🌾 Harvest rabi crops and prepare land for kharif season.',
    'June': '🌾 Begin sowing of rice, maize, and cotton. Start rainwater harvesting.',
    'July': '🌦️ Apply fertilizers and monitor monsoon patterns.',
    'August': '🌿 Weeding and pest control for kharif crops is essential.',
    'September': '🌽 Harvest early kharif crops like maize and pulses.',
    'October': '🌱 Start sowing wheat and mustard crops.',
    'November': '🌰 Irrigate wheat and sow onions and garlic.',
    'December': '🥬 Harvest kharif crops and sow cool-season vegetables.',
  };

  final Map<String, Map<String, String>> weatherInfo = {
    'January': {'temperature': '20°C', 'rainfall': '15 mm', 'humidity': '65%'},
    'February': {'temperature': '22°C', 'rainfall': '10 mm', 'humidity': '60%'},
    'March': {'temperature': '26°C', 'rainfall': '5 mm', 'humidity': '50%'},
    'April': {'temperature': '30°C', 'rainfall': '8 mm', 'humidity': '45%'},
    'May': {'temperature': '35°C', 'rainfall': '2 mm', 'humidity': '30%'},
    'June': {'temperature': '32°C', 'rainfall': '120 mm', 'humidity': '70%'},
    'July': {'temperature': '30°C', 'rainfall': '150 mm', 'humidity': '80%'},
    'August': {'temperature': '28°C', 'rainfall': '140 mm', 'humidity': '85%'},
    'September': {'temperature': '27°C', 'rainfall': '90 mm', 'humidity': '75%'},
    'October': {'temperature': '25°C', 'rainfall': '30 mm', 'humidity': '60%'},
    'November': {'temperature': '22°C', 'rainfall': '10 mm', 'humidity': '55%'},
    'December': {'temperature': '18°C', 'rainfall': '5 mm', 'humidity': '50%'},
  };

  @override
  void initState() {
    super.initState();
    if (widget.calenderModelList.isNotEmpty) {
      selectedIndex = 0;
      selectedMonth = widget.calenderModelList.first.month;
    } else {
      selectedMonth = DateFormat.MMMM().format(DateTime.now());
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    // REMOVE THE OUTER SingleChildScrollView HERE
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(),
            SliverToBoxAdapter(
              child: _buildDropdown(),
            ),
            SliverToBoxAdapter(
              child: _buildMonthInfo(),
            ),
            SliverToBoxAdapter(
              child: _buildWeatherInfoCard(),
            ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: _buildDatePicker().pOnly(left: 15, top: 10, bottom: 10),
              ),
            ),
            // --- Crop Stage Data as Sliver ---
            _buildSliverStageData(), // Call the new method that returns a Sliver
          ],
        ),
      ),
    );
  }

  /// Builds the custom SliverAppBar with a collapsing effect for crop details.
  SliverAppBar _buildSliverAppBar() {
    final bool hasCrops = widget.calenderModelList.isNotEmpty;
    final CropCalendar? selectedCrop = hasCrops ? widget.calenderModelList[selectedIndex] : null;

    double expandedHeight = hasCrops ? height * 0.35 : 200;
    double collapsedHeight = kToolbarHeight + 50;

    return SliverAppBar(
      pinned: true,
      expandedHeight: expandedHeight,
      collapsedHeight: collapsedHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double currentHeight = constraints.maxHeight;
            final bool isCollapsed = currentHeight <= collapsedHeight + 10;

            final double opacity = (currentHeight - collapsedHeight) / (expandedHeight - collapsedHeight);
            final double clampedOpacity = opacity.clamp(0.0, 1.0);

            return FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              centerTitle: false,
              title: Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: isCollapsed ? kToolbarHeight / 2 - 10 : kToolbarHeight / 2,
                  bottom: isCollapsed ? 10.0 : 0.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          textKey: AppStrings.cropCalendar,
                          color: Colors.white,
                          style: AppTextStyle.titleLarge.copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_box, color: Colors.white, size: 28),
                          onPressed: () async {
                            final CropCalendar? newCalendar = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddCropCalender()),
                            ) as CropCalendar?;

                            if (newCalendar != null && mounted) {
                              setState(() {
                                widget.calenderModelList.add(newCalendar);
                                widget.stageModelList.add([]);
                                selectedIndex = widget.calenderModelList.length - 1;
                                selectedMonth = newCalendar.month;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    if (!isCollapsed)
                      Expanded(
                        child: Opacity(
                          opacity: clampedOpacity,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (hasCrops && selectedCrop != null) ...[
                                  CircleAvatar(
                                    backgroundImage: selectedCrop.imagePath != null && selectedCrop.imagePath!.isNotEmpty
                                        ? FileImage(File(selectedCrop.imagePath!))
                                        : const AssetImage('assets/images/crops/avacado.jpg') as ImageProvider,
                                    radius: 35,
                                  ),
                                  8.heightBox,
                                  CustomText(
                                    textKey: selectedCrop.cropName ?? 'Selected Crop',
                                    style: AppTextStyle.headlineSmall.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  4.heightBox,
                                  if (selectedCrop.notes != null && selectedCrop.notes!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.note_alt, size: 16, color: Colors.white),
                                          6.widthBox,
                                          Expanded(
                                            child: Text(
                                              selectedCrop.notes!,
                                              style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (selectedCrop.location != null && selectedCrop.location!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.location_pin, size: 16, color: Colors.white),
                                          6.widthBox,
                                          Expanded(
                                            child: Text(
                                              selectedCrop.location!,
                                              style: AppTextStyle.bodySmall.copyWith(color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ] else
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.info_outline, color: Colors.white, size: 24),
                                        10.widthBox,
                                        Expanded(
                                          child: Text(
                                            "No crops added. Tap the ➕ icon to add a crop calendar.",
                                            style: AppTextStyle.bodyMedium.copyWith(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds the dropdown for selecting a crop/month.
  Widget _buildDropdown() {
    if (widget.calenderModelList.isEmpty) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.blueDark.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMonth,
          icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
          isExpanded: true,
          style: AppTextStyle.bodyLarge.copyWith(color: AppColors.primary),
          dropdownColor: Colors.white,
          items: widget.calenderModelList.map((calendar) {
            return DropdownMenuItem(
              value: calendar.month,
              child: Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.primary),
                  10.widthBox,
                  Text(calendar.month ?? 'Unknown Month'),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              final index = widget.calenderModelList.indexWhere((c) => c.month == value);
              if (index != -1) {
                setState(() {
                  selectedIndex = index;
                  selectedMonth = value;
                });
              }
            }
          },
        ),
      ),
    );
  }

  /// Builds a card displaying general crop information for the selected month.
  Widget _buildMonthInfo() {
    if (selectedMonth == null || !monthCropInfo.containsKey(selectedMonth!)) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF56ab2f), Color(0xFFa8e063)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.agriculture, color: Colors.white, size: 24),
              10.widthBox,
              CustomText(
                textKey: 'Crop Info for $selectedMonth',
                style: AppTextStyle.titleMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          12.heightBox,
          CustomText(
            textKey: monthCropInfo[selectedMonth!]!,
            style: AppTextStyle.bodyMedium.copyWith(color: Colors.white),
            lines: 3,
          ),
        ],
      ),
    );
  }

  /// Builds a card displaying weather information for the selected month.
  Widget _buildWeatherInfoCard() {
    if (selectedMonth == null || !weatherInfo.containsKey(selectedMonth!)) {
      return const SizedBox();
    }

    final weather = weatherInfo[selectedMonth!]!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textKey: 'Weather Info for $selectedMonth',
            style: AppTextStyle.titleMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
          ),
          16.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _weatherTile('🌡️ Temp', weather['temperature']!, AppColors.red),
              _weatherTile('🌧️ Rain', weather['rainfall']!, AppColors.blueLight),
              _weatherTile('💧 Humidity', weather['humidity']!, AppColors.orange),
            ],
          )
        ],
      ),
    );
  }

  /// Helper widget for displaying individual weather metrics.
  Widget _weatherTile(String label, String value, Color iconColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _getWeatherIcon(label),
          color: iconColor,
          size: 28,
        ),
        8.heightBox,
        CustomText(
          textKey: label,
          style: AppTextStyle.bodySmall.copyWith(color: AppColors.gray),
        ),
        4.heightBox,
        CustomText(
          textKey: value,
          style: AppTextStyle.titleMedium.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String label) {
    switch (label) {
      case '🌡️ Temp':
        return Icons.thermostat_outlined;
      case '🌧️ Rain':
        return Icons.cloudy_snowing;
      case '💧 Humidity':
        return Icons.water_drop_outlined;
      default:
        return Icons.info_outline;
    }
  }

  /// Builds the date picker button.
  Widget _buildDatePicker() {
    return CustomButtonElevated(
      customPrefix: Image.asset(ImageRoutes.prefixCalenderIcon, width: 20).pOnly(right: 3),
      onTap: () => _selectDate(context!),
      text: DateFormat('dd MMM yyyy').format(selectedDate), // Added year for clarity
      buttonColor: AppColors.blueDark,
      textColor: Colors.white,
    ).w(width * 0.45);
  }

  /// Builds the list of crop stages for the selected crop as a Sliver.
  SliverList _buildSliverStageData() {
    if (widget.calenderModelList.isEmpty ||
        selectedIndex < 0 ||
        selectedIndex >= widget.calenderModelList.length ||
        selectedIndex >= widget.stageModelList.length) {
      return SliverList(
        delegate: SliverChildListDelegate([
          _noDataText(),
        ]),
      );
    }

    final stages = widget.stageModelList[selectedIndex];
    if (stages.isEmpty) {
      return SliverList(
        delegate: SliverChildListDelegate([
          _noDataText(),
        ]),
      );
    }

    // Combine title and stage cards into a single SliverList
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i == 0) {
            // First item is the title
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: CustomText(
                textKey: 'Crop Stages',
                style: AppTextStyle.titleLarge.copyWith(color: AppColors.greenDisable, fontWeight: FontWeight.bold),
              ),
            );
          } else if (i == stages.length + 1) {
            // Last item is the extra space at the bottom
            return 60.heightBox;
          } else {
            // Remaining items are stage cards
            return _buildStageCard(stages[i - 1], i - 1);
          }
        },
        childCount: stages.length + 2, // Account for title and bottom space
      ),
    );
  }

  /// Displays a message when no crop stage data is available.
  Widget _noDataText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.agriculture_outlined, size: 60, color: AppColors.gray),
          20.heightBox,
          CustomText(
            textKey: "No Crop Stage Data available for this crop yet.",
            style: AppTextStyle.bodyMedium.copyWith(color: AppColors.gray),
            textAlign: TextAlign.center,
          ).pSymmetric(h: 30),
          10.heightBox,
          CustomText(
            textKey: "Add stages to see the calendar.",
            style: AppTextStyle.bodySmall.copyWith(color: AppColors.gray),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).p(20);
  }

  /// Builds an individual crop stage card.
  Widget _buildStageCard(CropStageCalendar model, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.heightBox,
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/crop_calender/pre_seedling_stage.png", // Ensure this path is correct
                width: width - 30,
                height: 150,
                fit: BoxFit.cover,
              ),
            ).pSymmetric(h: 15),
            Positioned(
              left: 30,
              top: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textKey: model.stageName ?? "Unnamed Stage",
                    style: AppTextStyle.titleLarge.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
                  ),
                  4.heightBox,
                  CustomText(
                    textKey: "${model.stageWeek ?? '-'} ${AppStrings.weeks}",
                    style: AppTextStyle.bodyLarge.copyWith(color: AppColors.white),
                  ),
                  8.heightBox,
                  CustomText(
                    textKey: "11 May - 15 May", // TODO: Implement dynamic dates from your CropStageCalendar model
                    style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
          ],
        ),
        15.heightBox,
        if (model.stageList != null && model.stageList!.isNotEmpty)
          ...model.stageList!.expand((week) => (week.tasklist ?? []).map((task) => _buildTaskCard(task))),
      ],
    );
  }

  /// Builds an individual task card within a crop stage.
  Widget _buildTaskCard(Tasklist task) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldLintBackground,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: CustomText(
                    textKey: task.oprationType ?? "Operation Type Missing",
                    style: AppTextStyle.titleSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                  ),
                ),
                8.heightBox,
                CustomText(
                  textKey: task.oprationDescription ?? "No description provided.",
                  lines: 3,
                  style: AppTextStyle.bodyMedium.copyWith(color: AppColors.greenDisable),
                ),
                8.heightBox,
                CustomText(
                  textKey: AppStrings.readMore,
                  style: AppTextStyle.titleSmall.copyWith(color: AppColors.blueDark, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Shows the date picker dialog.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primary,
            colorScheme: ColorScheme.light(primary: AppColors.primary),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  /// Helper to get month name (not directly used in current UI but kept for utility).
  String _getMonthName(DateTime? date) {
    if (date == null) return 'Unknown';
    return DateFormat.MMMM().format(date);
  }
}