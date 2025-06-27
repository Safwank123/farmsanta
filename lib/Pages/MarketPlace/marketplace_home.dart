

import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/MarketPlace/Purchase/purchase_order_model.dart';
import 'package:farmsanta_new/Models/MarketPlace/category_model.dart';
import 'package:farmsanta_new/Models/MarketPlace/offer_model.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Routes/image_routes.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';
import 'category_page.dart';

class MarketPlaceHome extends BaseScreen {
  bool isPurchase;
  PurchaseOrderModel purchaseOrderModel;
  MarketPlaceHome({required this.isPurchase, required this.purchaseOrderModel});

  @override
  BaseScreenState<MarketPlaceHome> createState() => _MarketPlaceHomeState();
}

class _MarketPlaceHomeState extends BaseScreenState<MarketPlaceHome> {
  bool isDelivery = false;
  final List<CategoryModel> _purchaseCategoryList = purchaseCategoryList;
  final List<CategoryModel> _rentalCategoryList =
      StoreHelper.store.rentalCategoryList;
  final List<OfferModel> _rentalOfferList = StoreHelper.store.rentalOfferList;
  final List<OfferModel> _purchaseOfferList = purchaseOfferList;
  final List<StoreModel> _purchaseStoreList =
      StoreHelper.store.purchaseStoreList;
  final List<StoreModel> _rentalStoreList = rentalStoreList;

  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Expanded App Bar
          SliverAppBar(
            // App Bar background color
            backgroundColor:
                widget.isPurchase ? AppColors.primary : AppColors.orange,

            // App Bar text
            title: CustomText(
              textKey: widget.isPurchase
                  ? AppStrings.buyProducts
                  : AppStrings.forRent,
              color: AppColors.white,
            ),
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, height * 0.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // search bar with icon
                  Row(children: [
                    CustomInputField(
                      textEditingController: searchTextEditingController,
                      prefixWidget: Icon(
                        MaterialSymbols.search,
                        color: AppThemeColors.getColor(
                            AppThemeColorsEnum.textColorTextField),
                      ),
                      hint: widget.isPurchase
                          ? AppStrings.searchProductsForBuyingSellers
                          : AppStrings.searchProductsForRent,
                    ).w(width * 0.77).h(height * 0.05),
                    5.widthBox,
                    CircleAvatar(
                      backgroundColor: AppColors.textFieldBackground,
                      child: Icon(
                        Icons.bookmark_border,
                        color: widget.isPurchase
                            ? AppColors.primary
                            : AppColors.orange,
                      ),
                    )
                  ]).pSymmetric(h: 15).w(width),

                  //some spacing
                  5.heightBox,

                  //select order type text
                  CustomText(
                    textKey: AppStrings.selectOrderType,
                    color: AppColors.white,
                    size: 5,
                  ).pSymmetric(h: 15),

                  // checkbox
                  Row(
                    children: [
                      // checkbox
                      Checkbox(
                          activeColor: widget.isPurchase
                              ? AppColors.greenLight
                              : AppColors.yellow,
                          value: !isDelivery,
                          onChanged: ((bool? value) {
                            setState(() {
                              isDelivery = !value!;
                            });
                          })),

                      // pickuporder text
                      CustomText(
                        textKey: AppStrings.pickupOrder,
                        color: AppColors.white,
                      ),

                      //checkbox
                      Checkbox(
                          activeColor: widget.isPurchase
                              ? AppColors.greenLight
                              : AppColors.yellow,
                          value: isDelivery,
                          onChanged: ((bool? value) {
                            setState(() {
                              isDelivery = value!;
                            });
                          })),

                      // delivery text
                      CustomText(
                        textKey: AppStrings.delivery,
                        color: AppColors.white,
                      )
                    ],
                  )
                ],
              ).h(height * 0.15),
            ),
          ),

          // Horizontal Scrolling Categories in circular Avator
          SliverToBoxAdapter(
            child: Stack(children: [
              Container(
                height: height * 0.05,
                color: widget.isPurchase ? AppColors.primary : AppColors.orange,
              ),
              ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // for purchase
                  if (widget.isPurchase)
                    for (int i = 0; i < _purchaseCategoryList.length; i++)
                      circularCategoryWidget(
                              image: _purchaseCategoryList[i].img,
                              text: _purchaseCategoryList[i].name)
                          .pOnly(right: 10)
                          .onTap(() {
                        widget.purchaseOrderModel.delivery = isDelivery;
                        navigateToPageReplaceMent(CategoryPage(
                          isPurchase: true,
                          purchaseOrderModel: widget.purchaseOrderModel,
                        ));
                      }),

                  // for rental
                  if (!widget.isPurchase)
                    for (int i = 0; i < _rentalCategoryList.length; i++)
                      circularCategoryWidget(
                              image: _rentalCategoryList[i].img,
                              text: _rentalCategoryList[i].name)
                          .pOnly(right: 10)
                          .onTap(() {
                        widget.purchaseOrderModel.delivery = isDelivery;
                        navigateToPageReplaceMent(CategoryPage(
                          isPurchase: false,
                          purchaseOrderModel: widget.purchaseOrderModel,
                        ));
                      }),
                ],
              ).h(height * 0.12).p(10),
            ]),
          ),

          // Active Offers
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    textKey: widget.isPurchase
                        ? AppStrings.nearBySellersActiveOffers
                        : AppStrings.topActiveRentalOffers),
                5.heightBox,
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // for purchase
                    if (widget.isPurchase)
                      for (int i = 0; i < _purchaseOfferList.length; i++)
                        activeOfferCard(offerName: _purchaseOfferList[i].name),

                    // for rental
                    if (!widget.isPurchase)
                      for (int i = 0; i < _rentalOfferList.length; i++)
                        activeOfferCard(offerName: _rentalOfferList[i].name)
                  ],
                ).h(height * 0.14),
              ],
            ).p(10).h(height * 0.21),
          ),

          // Rated stores
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    textKey: widget.isPurchase
                        ? '⭐4+ ${AppStrings.ratedSellerStores}'
                        : '⭐4+ ${AppStrings.ratedRentalStores}'),
                5.heightBox,
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // purchase
                    if (widget.isPurchase)
                      for (int i = 0; i < _purchaseStoreList.length; i++)
                        sellerStoreCard(
                            image: _purchaseStoreList[i].image,
                            rating: _purchaseStoreList[i].rating,
                            noOfReviewsInK:
                                _purchaseStoreList[i].reviews.length,
                            storeName: _purchaseStoreList[i].name,
                            address: _purchaseStoreList[i].address,
                            categoryList: _purchaseStoreList[i].categories),

                    // rental
                    if (!widget.isPurchase)
                      for (int i = 0; i < _rentalStoreList.length; i++)
                        sellerStoreCard(
                            image: _rentalStoreList[i].image,
                            rating: _rentalStoreList[i].rating,
                            noOfReviewsInK: _rentalStoreList[i].reviews.length,
                            storeName: _rentalStoreList[i].name,
                            address: _rentalStoreList[i].address,
                            categoryList: _rentalStoreList[i].categories),
                  ],
                ).h(height * 0.30),
                10.heightBox,
              ],
            ).p(10).color(AppColors.grayLight),
          ),

          // Nearest stores
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: AppStrings.nearestStores,
                  color: AppColors.white,
                ),
                5.heightBox,
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // for purchase
                    if (widget.isPurchase)
                      for (int i = 0; i < _purchaseStoreList.length; i++)
                        nearestStoreCard(
                          noOfReviewsInK: _purchaseStoreList[i].reviews.length,
                          rating: _purchaseStoreList[i].rating,
                          storeName: _purchaseStoreList[i].name,
                        ),

                    // for rental
                    if (!widget.isPurchase)
                      for (int i = 0; i < _rentalStoreList.length; i++)
                        nearestStoreCard(
                          noOfReviewsInK: _rentalStoreList[i].reviews.length,
                          rating: _rentalStoreList[i].rating,
                          storeName: _rentalStoreList[i].name,
                        )
                  ],
                ).h(height * 0.15),
              ],
            ).p(10).color(
                widget.isPurchase ? AppColors.primary : AppColors.orange),
          ),

          // Explore all stores
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: widget.isPurchase
                      ? AppStrings.exploreAllStores
                      : AppStrings.exploreAllRentalStores,
                  color: AppColors.gray,
                ),

                // some spacing
                5.heightBox,

                // sort by options
                Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      chip(text: "Fertilizer") // TODO: To be changed
                          .scale(scaleValue: 1.1)
                          .p(5),
                  ],
                ),

                // for purchase
                if (widget.isPurchase)
                  ListView.builder(
                    itemCount: _purchaseStoreList.length,
                    itemBuilder: (context, index) {
                      return storeInfoCard(
                        categoryList: _purchaseStoreList[index].categories,
                        noOfProduct: _purchaseStoreList[index].products.length,
                        image: _purchaseStoreList[index].image,
                        rating: _purchaseStoreList[index].rating,
                        address: _purchaseStoreList[index].address,
                        storeName: _purchaseStoreList[index].name,
                      ).pOnly(bottom: 5);
                    },
                  ).h(height * 0.55),

                // for rental
                if (!widget.isPurchase)
                  ListView.builder(
                    itemCount: _rentalStoreList.length,
                    itemBuilder: (context, index) {
                      return storeInfoCard(
                        categoryList: _rentalStoreList[index].categories,
                        noOfProduct: _rentalStoreList[index].products.length,
                        image: _rentalStoreList[index].image,
                        rating: _rentalStoreList[index].rating,
                        address: _rentalStoreList[index].address,
                        storeName: _rentalStoreList[index].name,
                      ).pOnly(bottom: 5);
                    },
                  ).h(height * 0.55)
              ],
            ).p(10).color(AppColors.grayLight),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: AppStrings.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.grid_view_rounded),
              label: AppStrings.categories),
          const BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: AppStrings.location),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: AppStrings.myAccount),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart), label: AppStrings.cart),
        ],
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.gray,
        backgroundColor: AppColors.background,
        selectedFontSize: 10,
        unselectedFontSize: 10,
      ),
    );
  }

// active offer card widget with offername and button
  Widget activeOfferCard({required String offerName}) {
    return Stack(
      children: [
        Image.asset(widget.isPurchase
            ? ImageRoutes.purchaseActiveOffer
            : ImageRoutes.rentalActiveOffer),
        Positioned(
          left: 22,
          bottom: 5,
          child: CustomText(
            textKey: ' ${AppStrings.shopNow} ',
            size: 10,
            bold: true,
            color: AppColors.primary,
          ).box.make().color(AppColors.white).cornerRadius(10).onInkTap(() {}),
        ),
        Positioned(
          top: 32,
          left: 25,
          child: CustomText(
            textKey: offerName,
            size: 10,
            bold: true,
            color: AppColors.white,
          ),
        )
      ],
    );
  }

// active seller store card widget with image, rating, noOfReviews, storename, address and categories chips
  Widget sellerStoreCard({
    required String image,
    required double rating,
    required int noOfReviewsInK,
    required String storeName,
    required String address,
    required List<CategoryModel> categoryList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //image
        Stack(
          children: [
            Image.asset(image),

            // rating and reviews tag
            Positioned(
                right: 2,
                bottom: 2,
                child: WidgetHelper.ratingReviewTag(
                        rating: rating, noOfReviewsInK: noOfReviewsInK)
                    .color(AppColors.white)
                    .cornerRadius(15))
          ],
        ),

        5.heightBox,
// store name with icon
        storeNameAndIcon(storeName: storeName),
        10.heightBox,

        // store address with icon
        titleIconRowWidget(
            icon: Icon(
              Icons.location_on,
              size: 15,
              color: widget.isPurchase ? AppColors.primary : AppColors.orange,
            ),
            title: address),
        10.heightBox,
        // Categories
        Row(
          children: [
            for (int i = 0; i < categoryList.length; i++)
              chip(text: categoryList[i].name),
            CustomText(
              textKey: ".....${categoryList.length}+",
              size: 10,
              color: widget.isPurchase ? AppColors.primary : AppColors.orange,
            ).scale(scaleValue: 0.7)
          ],
        )
      ],
    ).color(AppColors.white).cornerRadius(5).pOnly(right: 10);
  }

// rating nearest store card widget with storename and rating review tag
  Widget nearestStoreCard(
      {required String storeName,
      required double rating,
      required int noOfReviewsInK}) {
    return Stack(
      children: [
        Image.asset(widget.isPurchase
            ? ImageRoutes.purchaseNearestStore
            : ImageRoutes.rentalNearestStore),
        Positioned(
            left: -1,
            bottom: 5,
            child: WidgetHelper.ratingReviewTag(
                    rating: rating, noOfReviewsInK: noOfReviewsInK)
                .scale(scaleValue: 0.8)
                .color(AppColors.white)
                .cornerRadius(15)),
        Positioned(
          bottom: 25,
          child: storeNameAndIcon(
                  storeName: storeName, storeNameColor: AppColors.white)
              .scale(scaleValue: 0.9),
        ),
      ],
    ).pOnly(right: 10);
  }

// store name and icon widget
  Widget storeNameAndIcon(
      {required String storeName, Color? storeNameColor, bool? isBold}) {
    return Row(
      children: [
        // image icon
        Image.asset(widget.isPurchase
            ? ImageRoutes.purchaseStoreIcon
            : ImageRoutes.rentalStoreIcon),
        5.widthBox,

        // store name
        CustomText(
          textKey: storeName,
          size: 10,
          color: storeNameColor ?? AppColors.gray,
          bold: isBold ?? true,
        )
      ],
    );
  }

// simple custom chip widget
  Widget chip({required String text}) {
    return Container(
      height: 20,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.circular(15)),
      child: CustomText(
        textKey: text,
        color: AppColors.gray,
      ).scale(scaleValue: 0.7).p(2),
    );
  }

// store info card widget with image, storename, ratingreviewtag, address, noOfproducts and categories
  Widget storeInfoCard({
    required String image,
    required String storeName,
    required String address,
    required double rating,
    required int noOfProduct,
    required List<CategoryModel> categoryList,
  }) {
    return Card(
      color: AppColors.white,
      elevation: 3,
      child: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                width: 0.20 * width,
              ).cornerRadius(5),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: WidgetHelper.ratingReviewTag(rating: rating)
                      .color(AppColors.white)
                      .cornerRadius(15)),
            ],
          ).p(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              storeNameAndIcon(
                  storeName: storeName,
                  isBold: false,
                  storeNameColor:
                      widget.isPurchase ? AppColors.primary : AppColors.orange),
              10.heightBox,
              Row(
                children: [
                  titleIconRowWidget(
                      titleColor: AppColors.gray,
                      icon: Icon(
                        Icons.location_on,
                        size: 15,
                        color: widget.isPurchase
                            ? AppColors.primary
                            : AppColors.orange,
                      ),
                      title: address),
                  15.widthBox,
                  titleIconRowWidget(
                      titleColor: AppColors.gray,
                      icon: Icon(
                        Icons.check_box_outline_blank_rounded,
                        size: 15,
                        color: widget.isPurchase
                            ? AppColors.primary
                            : AppColors.orange,
                      ),
                      title: "$noOfProduct Products"),
                ],
              ),
              10.heightBox,
              Row(
                children: [
                  for (int i = 0; i < categoryList.length; i++)
                    CustomText(
                      color: AppColors.gray,
                      textKey: " ${categoryList[i].name} |",
                      size: 5,
                    ),
                  CustomText(
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
                    textKey: "....more",
                    size: 5,
                  )
                ],
              )
            ],
          )
        ],
      ).color(AppColors.white).cornerRadius(10),
    );
  }

// title icon widget in row fashion
  Widget titleIconRowWidget(
      {required Icon icon, required String title, Color? titleColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // icon
        icon,
        5.widthBox,

        // store name
        CustomText(
          textKey: title,
          size: 10,
          color: widget.isPurchase
              ? titleColor ?? AppColors.primary
              : titleColor ?? AppColors.orange,
        )
      ],
    );
  }

// circular category widget with image and text below it
  Widget circularCategoryWidget({required String image, required String text}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 34,
          child: Image.asset(image),
        ),
        CustomText(
          textKey: text,
          size: 10,
          color: AppColors.gray,
        )
      ],
    );
  }
}
