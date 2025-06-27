
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Constants/enums.dart';
import 'package:farmsanta_new/Constants/padding.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/Home/widgets/store_card.dart';
import 'package:farmsanta_new/Pages/MarketPlace/farm_store.dart';
import 'package:farmsanta_new/Pages/MarketPlace/marketplace_home.dart';
import 'package:farmsanta_new/Pages/MarketPlace/marketplace_store_page.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_switch.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/card_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../MarketPlace/dummy_array.dart';
import '../MarketPlace/soilTesting/soil_testing_home.dart';
import '../MarketPlace/soilTesting/soil_testing_lab.dart';

class FarmMarketplace extends BaseScreen {
  const FarmMarketplace({super.key});

  @override
  BaseScreenState<FarmMarketplace> createState() => _FarmMarketplaceState();
}

class _FarmMarketplaceState extends BaseScreenState<FarmMarketplace> {
  bool isDeliveryOrderSelected = false;

  @override
  Widget buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // order type switch
          selectOrderType(),
          widgetSpacing.heightBox,

          // marketplace activity widget
          marketplaceActivities(),
          widgetSpacing.heightBox,

          Column(
            children: [
              //Most Buying Products
              WidgetHelper.getRowIcon(AppStrings.mostBuyingProducts,
                      trailingText: AppStrings.allCategories,
                      iconData: Icons.arrow_forward_rounded,
                      color: getColor(AppThemeColorsEnum.primary),
                      onClick: () {})
                  .pSymmetric(h: hDefaultPadding, v: vDefaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: StoreHelper.store.homeStoreList.map((model) {
                    return ImagewithSingleTextCard(
                      storeName: model!.name!,
                      imageUrl: model.image!,
                      onTap: () {},
                    ).pOnly(right: listWidgetSpacing);
                  }).toList(),
                ).pSymmetric(h: hDefaultPadding),
              ),

              vDefaultPadding.heightBox,

              //Best Nearby Stores
              WidgetHelper.getRowIcon(AppStrings.bestNearbyStoresForBuying,
                      trailingText: AppStrings.viewAll,
                      iconData: Icons.arrow_forward_rounded,
                      color: getColor(AppThemeColorsEnum.primary),
                      onClick: () {})
                  .pSymmetric(h: hDefaultPadding, v: vDefaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: StoreHelper.store.homeStoreList.map((model) {
                    return StoreCardWidget(
                      storeName: model!.name,
                      isSaved: model.isSaved,
                      imageUrl: model.image,
                      productList: model.cropList,
                      distance: model.distance,
                      ratings: model.ratings,
                      themeColor: getColor(AppThemeColorsEnum.primary),
                      purchaseTypeEnum: PurchaseTypeEnum.buy,
                      onTap: () {},
                    ).pOnly(right: listWidgetSpacing);
                  }).toList(),
                ).pSymmetric(h: hDefaultPadding),
              ),
              vDefaultPadding.heightBox
            ],
          ).color(getColor(AppThemeColorsEnum.white)),

          bannerCard(context,
              title: 'Soil Testing',
              description: 'Test your soil here.',
              buttonTitle: 'View Labs',
              backgroundColor: getColor(AppThemeColorsEnum.lightGreen),
              imageURL:
                  'https://s01.sgp1.cdn.digitaloceanspaces.com/article/177176-sghezxuerl-1657886652.jpg'),

          Column(
            children: [
              //Most Rented
              WidgetHelper.getRowIcon(AppStrings.mostRentedCatagories,
                      trailingText: AppStrings.viewAll,
                      iconData: Icons.arrow_forward_rounded,
                      color: getColor(AppThemeColorsEnum.orange),
                      onClick: () {})
                  .pSymmetric(h: hDefaultPadding, v: vDefaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    imageWithCenterTextCard(context,
                        imageUrl:
                            'https://agfundernews.com/wp-content/uploads/2022/08/281832544_4872557739523316_4916680536175142455_n.jpeg',
                        text: 'Harvesting Machine'),
                    imageWithCenterTextCard(context,
                        imageUrl:
                            'https://agfundernews.com/wp-content/uploads/2022/08/281832544_4872557739523316_4916680536175142455_n.jpeg',
                        text: 'Tractors'),
                    imageWithCenterTextCard(context,
                        imageUrl:
                            'https://agfundernews.com/wp-content/uploads/2022/08/281832544_4872557739523316_4916680536175142455_n.jpeg',
                        text: 'Seed Drill'),
                  ],
                ).pSymmetric(h: hDefaultPadding),
              ),

              vDefaultPadding.heightBox,

              //Best Nearby Rent
              WidgetHelper.getRowIcon(AppStrings.bestNearbyStoresForRent,
                      trailingText: AppStrings.viewAll,
                      iconData: Icons.arrow_forward_rounded,
                      color: getColor(AppThemeColorsEnum.orange),
                      onClick: () {})
                  .pSymmetric(h: hDefaultPadding, v: vDefaultPadding),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: StoreHelper.store.homeStoreList.map((model) {
                    return StoreCardWidget(
                      storeName: model!.name,
                      isSaved: model.isSaved,
                      imageUrl: model.image,
                      productList: model.cropList,
                      distance: model.distance,
                      ratings: model.ratings,
                      themeColor: getColor(AppThemeColorsEnum.orange),
                      topOverlayText: 'Nearest',
                      purchaseTypeEnum: PurchaseTypeEnum.rent,
                      onTap: () {},
                    ).pOnly(right: 10);
                  }).toList(),
                ).pSymmetric(h: hDefaultPadding),
              ),
              vDefaultPadding.heightBox
            ],
          ).color(getColor(AppThemeColorsEnum.white)),

          bannerCard(context,
              title: 'Financial Services',
              description: 'Connect with best financial services providers.',
              buttonTitle: 'View All',
              backgroundColor: getColor(AppThemeColorsEnum.orange),
              imageURL:
                  'https://s01.sgp1.cdn.digitaloceanspaces.com/article/177176-sghezxuerl-1657886652.jpg'),
        ],
      ),
    );
  }

  Widget selectOrderType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: AppStrings.selectOrderType,
          size: 10,
          color: getColor(AppThemeColorsEnum.bodyTextColor),
        ),
        10.heightBox,
        Row(
          children: [
            CustomText(
              textKey: AppStrings.pickupOrder,
              size: 12,
              color: !isDeliveryOrderSelected
                  ? getColor(AppThemeColorsEnum.orange)
                  : getColor(AppThemeColorsEnum.subHeading),
              semiBold: true,
            ),
            12.widthBox,
            CustomSwitch(
              value: isDeliveryOrderSelected,
              selectedColor: getColor(AppThemeColorsEnum.orange),
              unselectedColor: getColor(AppThemeColorsEnum.orange),
              onChanged: (value) {
                setState(() {
                  isDeliveryOrderSelected = value;
                });
              },
            ),
            12.widthBox,
            CustomText(
              textKey: AppStrings.delivery,
              size: 12,
              color: isDeliveryOrderSelected
                  ? getColor(AppThemeColorsEnum.orange)
                  : getColor(AppThemeColorsEnum.subHeading),
              semiBold: true,
            ),
          ],
        )
      ],
    )
        .pSymmetric(h: 15, v: 10)
        .color(getColor(AppThemeColorsEnum.white))
        .wFull(context);
  }

  Widget marketplaceActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textKey: AppStrings.ourMarketplaceActivities,
          size: 12,
          color: getColor(AppThemeColorsEnum.titleColor),
        ),
        vDefaultPadding.heightBox,
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            activityCard(context,
                imagePath: ImageRoutes.activity1,
                title: AppStrings.buyProducts, onTap: () {
              navigateToPageWithoutReplaceMent(MarketPlaceHome(
                isPurchase: true,
 
                // StoreHelper.store.purchaseOrderList[0],
                // purchaseOrderModel: StoreHelper.store.purchaseOrderList[0],
                purchaseOrderModel: purchaseOrderList[0],
 
              ));
            }),
            activityCard(context,
                imagePath: ImageRoutes.activity2,
                title: AppStrings.forRent, onTap: () {
              navigateToPageWithoutReplaceMent(MarketPlaceHome(
                isPurchase: false,
                // purchaseOrderModel: StoreHelper.store.purchaseOrderList[0],
                purchaseOrderModel: purchaseOrderList[0],
              ));
            }),
            activityCard(context,
                imagePath: ImageRoutes.activity3,
                title: AppStrings.soilTest, onTap: () {
              navigateToPageWithoutReplaceMent(MarketPlaceStorePage(
                isPurchase: false,
                // storeModel: purchaseStoreList[0],
                storeModel: rentalStoreList[0],
              ));
            }),
            activityCard(context,
                imagePath: ImageRoutes.activity4,
                title: AppStrings.financialServices,
                onTap: () {}),
            activityCard(context,
                imagePath: ImageRoutes.activity5,
                title: AppStrings.offers, onTap: () {
              navigateToPageWithoutReplaceMent(FarmStore(
                store: storeData.first,
              ));
            }),
          ],
        ),
      ],
    )
        .pSymmetric(h: hDefaultPadding, v: vDefaultPadding)
        .color(getColor(AppThemeColorsEnum.white));
  }
}
