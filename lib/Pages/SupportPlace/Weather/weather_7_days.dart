
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../Services/store_helper.dart';
import '../../../themeFiles/app_colors.dart';

class Weather7DaysScreen extends BaseScreen {
  const Weather7DaysScreen({super.key});

  @override
  BaseScreenState<Weather7DaysScreen> createState() =>
      _Weather7DaysScreenState();
}

class _Weather7DaysScreenState extends BaseScreenState<Weather7DaysScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    String? date;
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          DateTime now = DateTime.now().add(Duration(days: index + 1));
          date = DateFormat('dd/MM/yyyy').format(now);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![index + 1].weather![0].icon}.png",
                    height: 25,
                  ),
                  5.widthBox,
                  CustomText(
                    textKey: index == 0 ? AppStrings.tomorrow : date.toString(),
                    color: AppColors.enabledBlue,
                  ),
                ],
              ),
              iconDataWidget(
                data:
                    "${StoreHelper.store.weatherData!.weatherDetails!.daily![index + 1].temp!.max} °C",
                isBold: true,
                textColor: AppColors.enabledBlue,
                icon: Icon(
                  Icons.device_thermostat_sharp,
                  color: AppColors.enabledBlue,
                ),
              ),
              iconWindSpeedRainPercentageWidget(
                  rainPercentage:
                      "${StoreHelper.store.weatherData!.weatherDetails!.daily![index + 1].humidity}%",
                  windSpeed:
                      "${StoreHelper.store.weatherData!.weatherDetails!.daily![index + 1].windSpeed!.ceil()} Km/h"),
            ],
          )
              .p(5)
              .color(AppColors.blueLight)
              .cornerRadius(10)
              .pSymmetric(h: 7, v: 10);
        });
  }

  Widget iconDataWidget({
    required String data,
    required Icon icon,
    bool? isBold,
    Color? textColor,
    double? fontSize,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        5.widthBox,
        CustomText(
          textKey: data,
          bold: isBold ?? false,
          color: textColor,
          size: fontSize ?? 14,
        ),
      ],
    );
  }

  Widget iconWindSpeedRainPercentageWidget(
      {required String windSpeed, required String rainPercentage}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        iconDataWidget(
          textColor: AppColors.black,
          data: windSpeed,
          icon: Icon(
            Icons.air,
            color: AppColors.enabledBlue,
          ),
          fontSize: 10,
        ),
        iconDataWidget(
          textColor: AppColors.black,
          data: rainPercentage,
          icon: Icon(
            Icons.water_drop_outlined,
            color: AppColors.enabledBlue,
          ),
          fontSize: 10,
        ),
      ],
    );
  }
}
