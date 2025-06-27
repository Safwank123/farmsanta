
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreCardWidget extends StatelessWidget {
  final String? storeName;
  final String? imageUrl;
  final String? location;
  final bool? isSaved;
  final double? ratings;
  final double? distance;
  final List<String>? productList;
  final Function? onTap;
  final Color themeColor;
  final String? topOverlayText;
  final PurchaseTypeEnum purchaseTypeEnum;

  const StoreCardWidget({
    super.key,
    this.storeName,
    this.imageUrl,
    this.location,
    this.isSaved,
    this.ratings,
    this.distance,
    this.productList,
    this.onTap,
    this.themeColor = Colors.black,
    this.topOverlayText,
    this.purchaseTypeEnum = PurchaseTypeEnum.buy
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  width: 1,
                  color: AppThemeColors.getColor(AppThemeColorsEnum.borderColor)),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl!), fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      if(topOverlayText != null) Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: CustomText(
                            textKey: topOverlayText!,
                            size: 10,
                            color: AppThemeColors.getColor(AppThemeColorsEnum.white),
                          ).pSymmetric(h: 10, v: 2.5),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: getBoxDecorationAll(9.5, AppThemeColors.getColor(AppThemeColorsEnum.white)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                color: AppThemeColors.getColor(AppThemeColorsEnum.yellow),
                                size: 11,
                              ),
                              CustomText(
                                textKey: ratings!.toString(),
                                size: 8,
                              )
                            ],
                          ),
                        ).h(19).w(54),
                      ),
                    ],
                  ).p(5),
                ).h(133).w(165),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(5)),
                        color: AppThemeColors.getColor(AppThemeColorsEnum.white)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              purchaseTypeEnum == PurchaseTypeEnum.buy ? ImageRoutes.storeFront : ImageRoutes.forRent,
                              height: 18,
                              width: 18,
                            ),
                            10.widthBox,
                            CustomText(
                              textKey: storeName!,
                              size: 12,
                              bold: true,
                              color: AppThemeColors.getColor(AppThemeColorsEnum.subHeading),
                            )
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 18,
                                color: themeColor),
                            5.widthBox,
                            CustomText(
                              textKey: distance!.toString(),
                              size: 12,
                              color: themeColor,
                            )
                          ],
                        ),
                        10.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (String crop in productList!)
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: AppThemeColors.getColor(
                                            AppThemeColorsEnum.borderColor),
                                        width: 1),
                                  ),
                                  child: CustomText(
                                    textKey: crop,
                                    size: 8,
                                    color: AppThemeColors.getColor(
                                        AppThemeColorsEnum.bodyTextColor),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).h(240).w(165),
        ],
      ),
    );
  }
}
