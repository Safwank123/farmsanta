
import 'package:farmsanta_new/Constants/colors.dart';
import 'package:farmsanta_new/Core/extension.dart';
import 'package:farmsanta_new/Models/User/user.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/theme_dark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/padding.dart';
import '../../Constants/strings.dart';
import '../../Functions/common.dart';
import '../../Models/Home/Price.dart';
import '../../Pages/SupportPlace/Market/market.dart';
import '../../mututations/common.dart';
import '../Widgets/custom_edit_text_white_back.dart';

ScrollController controller = ScrollController();

class AppBarDesigns {
  // appbar to display title and drawer or actions (optional)
  static AppBar getTitleAndDrawerAppbarWithProfile(Widget? leading,
      {List<Widget>? actions}) {
    UserModel? model = StoreHelper.store.user;
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: Image.asset(ImageRoutes.imgLogo),
      actions: [
        //when image is not there
        model!.image == ""
            ? const Icon(Icons.person)

            // when image is there
            : WidgetHelper.getCircularAvatar(model.image).pOnly(right: 15),
        10.widthBox
      ],
    );
  }

  static AppBar getTitleAndDrawerAppbarWithNotification(
      BuildContext context, Widget? leading,
      {List<Widget>? actions, TextEditingController? textEditingController}) {
    return AppBar(
      leading: leading,
      centerTitle: true,
      title: Image.asset(
        ImageRoutes.logoColor,
        width: 140,
      ),
      toolbarHeight: height * 0.06,
      bottom: PreferredSize(
        preferredSize: Size(width, height * 0.20),
        child: Column(
          children: [
            itemRateBarRow(),
            CustomInputField(
              textEditingController: textEditingController!,
              borderRadius: 40,
              suffixWidget: Icon(
                MaterialSymbols.search,
                color: AppThemeColors.getColor(
                    AppThemeColorsEnum.textColorTextField),
              ),
              hint: AppStrings.search,
            ).h(40).pOnly(left: 15, right: 15, bottom: 20, top: 25)
          ],
        ),
      ),
      flexibleSpace: SvgPicture.asset(
        "assets/images/svg/HomeScreenAppbarBackground.svg",
        height: height,
        width: width,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  static VxBuilder<Object?> itemRateBarRow() {
    return VxBuilder(
        builder: (context, store, status) {
          var list = StoreHelper.store.priceListFarmSupport;
          return ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String price = getPrice(list[index]);

              return itemRateBar(priceData: price);
            },
          ).pSymmetric(h: hDefaultPadding, v: vDefaultPadding).h(50);
        },
        mutations: const {UpdateMarketPriceAppbar});
  }

  static String getPrice(Price item) {
    try {
      var name =
          "${item.tickerCode} ${item.productName?.substring(item.productName!.indexOf(":") + 1) ?? ""}";
      var value = item.currentPrice!.currency ??
          "\$${item.currentPrice!.value ?? 0.00}";

      var unit =
          "${(item.packaging!.unit ?? 0.00).toInt()} ${item.packaging!.uom ?? ""}";
      var changePercentage = "0";
      try {
        changePercentage =
            "${(item.currentPrice!.value ?? 0.0 - item.previousPrice!.value) / (item.currentPrice!.value ?? 0.0).round()}%";
      } catch (e) {}

      var symbol = (item.currentPrice!.value ?? 0.0) > item.previousPrice!.value
          ? getSymbol(0x2191)
          : getSymbol(0x2193);

      return "$name $value ${AppStrings.per.translate()} $unit $changePercentage $symbol";
    } catch (e) {
      return "";
    }
  }

  static String getSymbol(int sy) {
    return String.fromCharCode(sy);
  }

  static Widget itemRateBar({required String priceData}) {
    return Container(
      decoration: getBoxDecorationAll(25, getColor(AppThemeColorsEnum.primary)),
      child: Row(
        children: [
          CustomText(
            textKey: priceData,
            size: 8,
            color: getColor(AppThemeColorsEnum.white),
          ),
        ],
      ).pSymmetric(v: 6, h: 12),
    ).pOnly(right: 12);
  }

  // appbar for displaying title and back button
  static AppBar getAppbarWithBackAndTitle(BuildContext context,
      {double? elevation, List<Widget>? actions}) {
    return AppBar(
      elevation: elevation,
      title: Image.asset(ImageRoutes.imgLogo),
      actions: actions,
      leading: getBackButton(context),
    );
  }

  // app bar with zero height
  static AppBar getAppBar() {
    return AppBar(
      backgroundColor: primaryColor,
      toolbarHeight: 0,
    );
  }

  //app bar with title and trailing icon button
  static AppBar getAppTitleAndIconButton(String title, Widget iconButton,
      {Color? backgroundColor, bool isBold = false, double titleSize = 18}) {
    return AppBar(
      title: CustomText(
        textKey: title,
        color: AppColors.invert,
        size: titleSize,
        bold: isBold,
      ),
      actions: [iconButton],
      leading: Builder(
        builder: (BuildContext context) {
          bool canPop = ModalRoute.of(context)?.canPop ?? false;
          return canPop
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                    color: AppColors.invert,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container();
        },
      ),
      backgroundColor: backgroundColor ?? AppColors.background,
    );
  }

  //app bar with title only
  static AppBar getAppTitleOnly(
    String title, {
    double? titleSize,
    Color? backgroundColor,
    TextStyle? style,
    Color? color = BLACK_COLOR,
    Color? iconColor = primaryColor,
    double? toolbarHeight,
    IconData? iconData,
    double? iconSize,
  }) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      title: CustomText(
        textKey: title,
        size: titleSize ?? 18,
        style: style,
        color: color,
      ),
      leading: Builder(
        builder: (BuildContext context) {
          bool canPop = ModalRoute.of(context)?.canPop ?? false;
          return canPop
              ? IconButton(
                  icon: Icon(
                    iconData ?? Icons.arrow_back_ios_new_rounded,
                    size: iconSize ?? 24,
                    color: iconColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container();
        },
      ),
      backgroundColor: backgroundColor ?? AppColors.background,
    );
  }

// app bar with leading circular back button and trailing more_vert dots icon button
  static AppBar getAppBarCircularBackButtonAndMoreVertIconButton(BuildContext context,
      {Color? circularBackButtonColor}) {
    return AppBar(
      toolbarHeight: height * 0.08,
      backgroundColor: AppColors.grayLight,
      leading: AppBarDesigns.getBackButton(context, iconSize: 20)
          .circle(backgroundColor: circularBackButtonColor ?? AppColors.primary)
          .p(10),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }

  //back button
  static Widget getBackButton(BuildContext context, {double? iconSize}) {
    return IconButton(
        iconSize: iconSize ?? 30,
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pop(0);
          }
        },
        icon: Icon(
          Icons.chevron_left,
          size: iconSize ?? 30,
        ));
  }
}
