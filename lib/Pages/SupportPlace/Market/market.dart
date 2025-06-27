import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/padding.dart';
import '../../../Constants/strings.dart';
import '../../../Functions/common.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_colors.dart';
import '../../../themeFiles/app_typography.dart';
import '../../Home/widgets/chart.dart';
import '../../base_screen.dart';

class MarketScreen extends BaseScreen {
  static String routeName = 'market-screen';
  const MarketScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends BaseScreenState<MarketScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomText(
          textKey: AppStrings.marketAnalysis,
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.heightBox,
            marketRateBarRow(),
            25.heightBox,
            WidgetHelper.searchBarAndTrailingIcon(
                    hintText: AppStrings.search,
                    icon: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                    backgroundColor: AppColors.gray)
                .pSymmetric(h: 15),
            25.heightBox,
            Container(
                    color: getColor(AppThemeColorsEnum.white),
                    child: const ProductRateChart().p(hDefaultPadding))
                .p(hDefaultPadding),
            25.heightBox,
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.1,
              color: AppColors.gray,
              child: CustomText(
                color: AppColors.subHeading,
                textKey: 'Current Commodity Rate:',
                textAlign: TextAlign.start,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//marketrate row
SingleChildScrollView marketRateBarRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        marketRateBar(
            marketProduct: 'Dshang-Poivre',
            xafVal: 'XAF-9000',
            perNumBasket: 'per 1 Basket',
            percent: '4%',
            incresed: true,
            darkGreen: true),
        marketRateBar(
            marketProduct: 'Dshang-Poivre',
            xafVal: 'XAF-9000',
            perNumBasket: 'per 1 Basket',
            percent: '4%',
            incresed: true,
            darkGreen: false),
        marketRateBar(
            marketProduct: 'Dshang-Poivre',
            xafVal: 'XAF-9000',
            perNumBasket: 'per 1 Basket',
            percent: '4%',
            incresed: true,
            darkGreen: false),
      ],
    ).pSymmetric(h: hDefaultPadding, v: vDefaultPadding),
  );
}

//one bar
Widget marketRateBar({
  required String marketProduct,
  required String xafVal,
  required String perNumBasket,
  required String percent,
  required bool incresed,
  required bool darkGreen,
}) {
  return Container(
    decoration: getBoxDecorationAllBorder(
      30,
      darkGreen
          ? getColor(AppThemeColorsEnum.primary)
          : getColor(AppThemeColorsEnum.greenLight),
      darkGreen
          ? getColor(AppThemeColorsEnum.primary)
          : getColor(AppThemeColorsEnum.primary),
    ),
    child: Row(
      children: [
        CustomText(
            bold: true,
            textKey: marketProduct,
            size: 8,
            color: darkGreen
                ? getColor(AppThemeColorsEnum.white)
                : getColor(AppThemeColorsEnum.primary)),
        10.widthBox,
        CustomText(
            bold: true,
            textKey: xafVal,
            size: 8,
            color: darkGreen
                ? getColor(AppThemeColorsEnum.white)
                : getColor(AppThemeColorsEnum.primary)),
        10.widthBox,
        CustomText(
            bold: true,
            textKey: perNumBasket,
            size: 8,
            color: darkGreen
                ? getColor(AppThemeColorsEnum.white)
                : getColor(AppThemeColorsEnum.primary)),
        10.widthBox,
        Row(
          children: [
            Icon(
              incresed ? Icons.arrow_upward : Icons.arrow_downward,
              color: darkGreen
                  ? getColor(AppThemeColorsEnum.white)
                  : getColor(AppThemeColorsEnum.primary),
              size: 12,
            ),
            CustomText(
                bold: true,
                textKey: percent,
                size: 8,
                color: darkGreen
                    ? getColor(AppThemeColorsEnum.white)
                    : getColor(AppThemeColorsEnum.primary)),
          ],
        ),
      ],
    ).pSymmetric(v: 6, h: 12),
  ).pOnly(right: 12);
}

//get Color
Color getColor(AppThemeColorsEnum AppThemeColorsEnum) {
  return AppThemeColors.getColor(AppThemeColorsEnum);
}
