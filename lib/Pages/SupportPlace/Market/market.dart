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
  const MarketScreen({super.key});

  @override
  BaseScreenState<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends BaseScreenState<MarketScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: CustomText(
          textKey: AppStrings.marketAnalysis,
          color: Colors.black,
          style: AppTextStyle.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.heightBox,
            marketRateBarRow(),
            20.heightBox,
            WidgetHelper.searchBarAndTrailingIcon(
              hintText: AppStrings.search,
              icon: const Icon(Icons.add, color: Colors.white),
              backgroundColor: AppColors.gray,
            ).pSymmetric(h: 16),
            20.heightBox,
            Container(
              decoration: BoxDecoration(
                color: getColor(AppThemeColorsEnum.white),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const ProductRateChart().p16(),
            ).pSymmetric(h: 16),
            25.heightBox,
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.greenLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomText(
                color: AppColors.white,
                textKey: 'Current Commodity Rate:289',
                textAlign: TextAlign.start,
                size: 20,
              ),
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}

// Horizontal scrolling market bar row
SingleChildScrollView marketRateBarRow() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: hDefaultPadding),
    child: Row(
      children: [
        marketRateBar(
          marketProduct: 'Dshang-Poivre',
          xafVal: 'XAF-9000',
          perNumBasket: 'per 1 Basket',
          percent: '4%',
          incresed: true,
          darkGreen: true,
        ),
        marketRateBar(
          marketProduct: 'Yaoundé-Tomato',
          xafVal: 'XAF-7000',
          perNumBasket: 'per 1 Box',
          percent: '2%',
          incresed: false,
          darkGreen: false,
        ),
        marketRateBar(
          marketProduct: 'Bamenda-Carrot',
          xafVal: 'XAF-3000',
          perNumBasket: 'per 1 Kg',
          percent: '6%',
          incresed: true,
          darkGreen: false,
        ),
      ],
    ),
  );
}

// Single market rate bar card
Widget marketRateBar({
  required String marketProduct,
  required String xafVal,
  required String perNumBasket,
  required String percent,
  required bool incresed,
  required bool darkGreen,
}) {
  final Color textColor = darkGreen
      ? getColor(AppThemeColorsEnum.white)
      : getColor(AppThemeColorsEnum.primary);

  final Color bgColor = darkGreen
      ? getColor(AppThemeColorsEnum.primary)
      : getColor(AppThemeColorsEnum.greenLight);

  return Container(
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 2),
        )
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          bold: true,
          textKey: marketProduct,
          size: 10,
          color: textColor,
        ),
        4.heightBox,
        CustomText(
          bold: true,
          textKey: xafVal,
          size: 10,
          color: textColor,
        ),
        4.heightBox,
        CustomText(
          textKey: perNumBasket,
          size: 9,
          color: textColor.withOpacity(0.9),
        ),
        4.heightBox,
        Row(
          children: [
            Icon(
              incresed ? Icons.arrow_upward : Icons.arrow_downward,
              color: textColor,
              size: 14,
            ),
            4.widthBox,
            CustomText(
              textKey: percent,
              bold: true,
              size: 9,
              color: textColor,
            ),
          ],
        ),
      ],
    ),
  );
}

// Theme color fetcher
Color getColor(AppThemeColorsEnum themeColor) {
  return AppThemeColors.getColor(themeColor);
}
