
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/logic_funtions.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Services/store_helper.dart';

class WeatherTomorrowScreen extends BaseScreen {
  const WeatherTomorrowScreen({super.key});

  @override
  BaseScreenState<WeatherTomorrowScreen> createState() =>
      _WeatherTomorrowScreenState();
}

class _WeatherTomorrowScreenState
    extends BaseScreenState<WeatherTomorrowScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Column(
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
              textKey: AppStrings.tomorrow,
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
                  "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![1].weather![0].icon}.png",
                  height: 100,
                ),
                10.heightBox,
                CustomText(
                  color: AppColors.background,
                  textKey: StoreHelper.store.weatherData!.weatherDetails!
                      .daily![1].weather![0].description
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
                    "${StoreHelper.store.weatherData!.weatherDetails!.daily![1].temp!.max} °C",
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
                      "${StoreHelper.store.weatherData!.weatherDetails!.daily![1].windSpeed} Km/h",
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
                      "${StoreHelper.store.weatherData!.weatherDetails!.daily![1].humidity}%",
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
                      .store.weatherData!.weatherDetails!.daily![1].windDeg!),
                  style: AppTextStyle.labelSmall,
                  color: AppColors.background,
                )
              ],
            )
          ],
        ).pSymmetric(v: 20),
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
                          "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.hourly![index + 24].weather![0].icon}.png",
                          height: 25,
                        ),
                        5.heightBox,
                        CustomText(
                          textKey:
                              "${StoreHelper.store.weatherData!.weatherDetails!.hourly![index + 24].temp}°C",
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
    ).pOnly(left: 10, right: 10, top: 15);
  }
}
