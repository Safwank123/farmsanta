
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductRateChart extends BaseScreen { 
  const ProductRateChart({super.key});

  @override
  BaseScreenState<ProductRateChart> createState() => _ProductRateChartState();
}

class _ProductRateChartState extends BaseScreenState<ProductRateChart> {
  List<ChartData> chartData = [
    const ChartData(price: 400, time: '1 AM'),
    const ChartData(price: 1500, time: '3 AM'),
    const ChartData(price: 900, time: '5 AM'),
    const ChartData(price: 1000, time: '7 AM'),
    const ChartData(price: 300, time: '9 AM'),
    const ChartData(price: 900, time: '11 AM'),
    const ChartData(price: 200, time: '1 PM'),
    const ChartData(price: 1200, time: '3 PM'),
    const ChartData(price: 400, time: '5 PM'),

  ];

  double getMaxY() {
    double maxY = chartData.reduce((current, next) =>
            current.price > next.price ? current : next).price;
    return maxY * 1.5;
  }

  double getMinY() {
    double minY = chartData.reduce((current, next) =>
            current.price < next.price ? current : next).price;
    return minY / 2;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text = chartData[value.toInt()].time;
    if(value.toInt() == 0 || value.toInt() == chartData.length - 1){
      text = "";
    }

    return CustomText(
      textKey: text,
      size: 8,
      color: getColor(AppThemeColorsEnum.primary),
      textAlign: TextAlign.center,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text = value.toStringAsFixed(0);
    if(value == getMinY() || value == getMaxY()){
      text = "";
    }

    return CustomText(
      textKey: text,
      size: 8,
      color: getColor(AppThemeColorsEnum.primary),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                // interval: chartData.length / 4,
                getTitlesWidget: bottomTitleWidgets,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                // interval: getMaxY() / 8,
                getTitlesWidget: leftTitleWidgets,
                reservedSize: 42,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
                left: BorderSide(
                    color: getColor(AppThemeColorsEnum.textColorTextField),
                    width: 1),
                bottom: BorderSide(
                    color: getColor(AppThemeColorsEnum.textColorTextField),
                    width: 1)),
          ),
          minY: getMinY(),
          maxY: getMaxY(),
          lineTouchData: LineTouchData(
              enabled: true,
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return spotIndexes.map((e) => TouchedSpotIndicatorData(
                  FlLine(dashArray: [4, 4], color: getColor(AppThemeColorsEnum.primary)), 
                  FlDotData(show: true)
                )).toList();
              },
              touchTooltipData: LineTouchTooltipData(
            //    tooltipBgColor: getColor(AppThemeColorsEnum.white),
                tooltipBorder: BorderSide(
                    color: getColor(AppThemeColorsEnum.textColorTextField),
                    width: 1),
                fitInsideHorizontally: true,
             //   tooltipRoundedRadius: 5,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots
                      .map((e) => LineTooltipItem(
                          'Time: ${chartData[e.x.toInt()].time}\nPrice: ${e.y.toStringAsFixed(2)}',
                          const TextStyle(),
                          textAlign: TextAlign.left))
                      .toList();
                },
              )),
          lineBarsData: [
            LineChartBarData(
              spots: [
                for (int i = 0; i < chartData.length; i++) ...{
                  FlSpot(i * 1.0, chartData[i].price)
                }
              ],
              isCurved: true,
              barWidth: 2,
              isStrokeCapRound: false,
              color: getColor(AppThemeColorsEnum.primary),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ChartData {
  final double price;
  final String time;

  const ChartData({
    required this.price,
    required this.time
  });
}
