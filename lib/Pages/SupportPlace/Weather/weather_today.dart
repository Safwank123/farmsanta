
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Functions/logic_funtions.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Services/store_helper.dart';

class WeatherTodayScreen extends BaseScreen {
  const WeatherTodayScreen({super.key});

  @override
  BaseScreenState<WeatherTodayScreen> createState() =>
      _WeatherTodayScreenState();
}

class _WeatherTodayScreenState extends BaseScreenState<WeatherTodayScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/weather/ic_location.png',
                    color: AppColors.background,
                    height: 20,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey:
                        '${StoreHelper.store.weatherData!.weatherDetails!.location!.name}, ${StoreHelper.store.weatherData!.weatherDetails!.location!.country}',
                    color: AppColors.background,
                    style: AppTextStyle.labelMedium,
                  ),
                ],
              ),
              CustomText(
                textKey: AppStrings.today,
                color: AppColors.background,
                style: AppTextStyle.labelMedium,
              ),
            ],
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.current!.weather![0].icon}.png",
                    height: 100,
                  ),
                  10.heightBox,
                  CustomText(
                    color: AppColors.background,
                    textKey: StoreHelper.store.weatherData!.weatherDetails!
                        .current!.weather![0].description
                        .toString(),
                    style: AppTextStyle.labelSmall,
                  )
                ],
              ),
              Baseline(
                baseline: -10,
                baselineType: TextBaseline.alphabetic,
                child: CustomText(
                  textKey:
                      "${StoreHelper.store.weatherData!.weatherDetails!.current!.temp} °C",
                  color: AppColors.background,
                  style: AppTextStyle.headlineLarge,
                ),
              ),
            ],
          ).pSymmetric(h: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/weather/ic_wind.png',
                    height: 20,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey:
                        "${StoreHelper.store.weatherData!.weatherDetails!.current!.windSpeed} Km/h",
                    style: AppTextStyle.labelSmall,
                    color: AppColors.background,
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/weather/ic_humidity.png',
                    height: 25,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey:
                        "${StoreHelper.store.weatherData!.weatherDetails!.current!.humidity!} %",
                    style: AppTextStyle.labelSmall,
                    color: AppColors.background,
                  )
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/weather/ic_direction.png',
                    height: 25,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey: getDirection(StoreHelper
                        .store.weatherData!.weatherDetails!.current!.windDeg!),
                    style: AppTextStyle.labelSmall,
                    color: AppColors.background,
                  )
                ],
              )
            ],
          ).pSymmetric(v: 20),
          CustomText(
            textKey: AppStrings.todaysFarmingTips,
            style: AppTextStyle.titleSmall,
            color: AppColors.background,
          ),
          Container(
            decoration:
                StyleHelper.getBoxDecorationAll(10, AppColors.background),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              title: CustomText(
                textKey: StoreHelper.store.weatherData!.title!,
                style: AppTextStyle.bodyLarge,
              ),
              subtitle: CustomText(
                color: AppColors.subHeading,
                textKey: StoreHelper.store.weatherData!.message!,
                style: AppTextStyle.labelLarge,
              ),
            ),
          ).pSymmetric(v: 10),
          Container(
            decoration:
                StyleHelper.getBoxDecorationAll(10, AppColors.background),
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: CustomText(
                    textKey: AppStrings.harvesting,
                    style: AppTextStyle.bodyLarge,
                  ),
                  subtitle: CustomText(
                    color: AppColors.subHeading,
                    textKey: StoreHelper.store.weatherData!.harvesting!,
                    style: AppTextStyle.labelLarge,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: CustomText(
                    textKey: AppStrings.irrigation,
                    style: AppTextStyle.bodyLarge,
                  ),
                  subtitle: CustomText(
                    color: AppColors.subHeading,
                    textKey: StoreHelper.store.weatherData!.irrigation!,
                    style: AppTextStyle.labelLarge,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: CustomText(
                    textKey: AppStrings.weeding,
                    style: AppTextStyle.bodyLarge,
                  ),
                  subtitle: CustomText(
                    color: AppColors.subHeading,
                    textKey: StoreHelper.store.weatherData!.weeding!,
                    style: AppTextStyle.labelLarge,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: CustomText(
                    textKey: AppStrings.fertilizerApplication,
                    style: AppTextStyle.bodyLarge,
                  ),
                  subtitle: CustomText(
                    color: AppColors.subHeading,
                    textKey:
                        StoreHelper.store.weatherData!.pesticideApplication!,
                    style: AppTextStyle.labelLarge,
                  ),
                ),
              ],
            ),
          ),
          20.heightBox,
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFDDFFCC),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/weather/graph.png',
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  title: CustomText(
                    textKey: AppStrings.hourlyForecast,
                    color: AppColors.primary,
                    style: AppTextStyle.titleMedium,
                  ),
                  subtitle: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (StoreHelper.store.weatherData!.weatherDetails!
                                .hourly!.length /
                            2)
                        .floor(),
                    itemBuilder: (context, index) {
                      String suffix = index < 12 ? 'AM' : 'PM';
                      int hour = index % 12 == 0 ? 12 : index % 12;
                      return Column(
                        children: [
                          CustomText(
                            textKey: "$hour $suffix",
                            style: AppTextStyle.labelSmall,
                          ),
                          5.heightBox,
                          Image.asset(
                            "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.hourly![index].weather![0].icon}.png",
                            height: 25,
                          ),
                          5.heightBox,
                          CustomText(
                            textKey:
                                "${StoreHelper.store.weatherData!.weatherDetails!.hourly![index].temp}°C",
                            color: AppColors.primary,
                            size: 10,
                            bold: true,
                          ),
                        ],
                      ).pSymmetric(h: 5);
                    },
                  ).h(90).pSymmetric(h: 5, v: 20),
                ),
              ],
            ),
          ).pSymmetric(v: 10),
        ],
      ).pOnly(left: 10, right: 10, top: 15),
    );
  }
}
