
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Weather/weather_7_days.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Weather/weather_today.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Weather/weather_tomorrow.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Widgets/classes/style_helper.dart';

class WeatherHomeScreen extends BaseScreen {
  static String routeName = 'weather-home-screen';
  const WeatherHomeScreen({super.key});

  @override
  BaseScreenState<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends BaseScreenState<WeatherHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            tabController.index == 2
                ? Container()
                : Image.asset(
                    'assets/images/weather/weatherBG.png',
                    width: width,
                    height:
                        tabController.index == 0 ? height * 0.75 : height * 0.6,
                    fit: tabController.index == 0 ? BoxFit.cover : BoxFit.fill,
                  ),
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.chevron_left,
                    size: 50,
                    color: tabController.index == 2
                        ? AppColors.invert
                        : AppColors.background,
                  ).onInkTap(() {
                    Navigator.pop(context);
                  }),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  title: CustomText(
                    color: tabController.index == 2
                        ? AppColors.invert
                        : AppColors.background,
                    style: AppTextStyle.titleMedium,
                    textKey: AppStrings.weatherForecast,
                  ),
                ),
                5.heightBox,
                WidgetHelper.customPillWeatherTabBar(
                  onPressed: (value) {
                    setState(() {
                      tabController.index = value;
                    });
                  },
                  selectedColor: AppColors.enabledBlue,
                  unSelectedColor: AppColors.disabledBlue,
                  tabController: tabController,
                  tabTitles: [
                    AppStrings.today,
                    AppStrings.tomorrow,
                    AppStrings.days7
                  ],
                ).pSymmetric(v: 15),
                Expanded(child: weatherTab()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget weatherTab() {
    if (tabController.index == 0) {
      return const WeatherTodayScreen();
    } else if (tabController.index == 1) {
      return const WeatherTomorrowScreen();
    } else {
      return const Weather7DaysScreen();
    }
  }
}
