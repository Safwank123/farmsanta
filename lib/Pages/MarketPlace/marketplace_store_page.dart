import 'package:dotted_border/dotted_border.dart';
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/MarketPlace/product_detail_page.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';


import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Models/MarketPlace/product_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Widgets/classes/widget_helper_class.dart';
import '../../themeFiles/app_colors.dart';
import '../base_screen.dart';
import 'cart_page_home_delivery_order.dart';
import 'cart_page_pickup_order.dart';

class MarketPlaceStorePage extends BaseScreen {
  static const String routeName = "/marketplace-store-page-screen";
  final StoreModel storeModel;
  final bool isPurchase;
  const MarketPlaceStorePage({
    super.key,
    required this.isPurchase,
    required this.storeModel,
  });

  @override
  BaseScreenState<MarketPlaceStorePage> createState() =>
      _MarketPlaceStorePageState();
}

class _MarketPlaceStorePageState extends BaseScreenState<MarketPlaceStorePage> {
  String selectedCategory = AppStrings.allProducts;

  String selectedVariant = "";
  int noOfUnits = 1;
  TextEditingController searchController = TextEditingController();

  @override
  Widget buildWidget(BuildContext context) {
    final List<ProductModel> filterProductList =
        widget.storeModel.products.where((element) {
      return selectedCategory == AppStrings.allProducts ||
          element.categoryId == selectedCategory;
    }).toList();

    return Scaffold(
      appBar: AppBarDesigns.getAppBarCircularBackButtonAndMoreVertIconButton(
        context,
        circularBackButtonColor:
            widget.isPurchase ? AppColors.primary : AppColors.orange,
      ),
      backgroundColor: AppColors.grayLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // store card
            storeCardWidget(storeModel: widget.storeModel)
                .color(AppColors.white)
                .cornerRadius(10)
                .pSymmetric(h: 10, v: 5),

            // horizontal divider
            VxDivider(
              width: 10,
              type: VxDividerType.horizontal,
              color: AppColors.textFieldBackground,
            ),

            // search bar and filter component
            Column(
              children: [
                // seach bar
                WidgetHelper.searchBarOnly(
                  AppStrings.searchProduct,
                  searchController,
                  suffixWidget: 10.widthBox,
                ).p(10).h(height * 0.07),

                // filter chips
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          BorderSide(
                              color: selectedCategory == AppStrings.allProducts
                                  ? widget.isPurchase
                                      ? AppColors.primary
                                      : AppColors.orange
                                  : AppColors.gray),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory =
                              selectedCategory = AppStrings.allProducts;
                        });
                      },
                      child: CustomText(
                        size: 12,
                        textKey: '  ${AppStrings.allProducts}  ',
                        color: selectedCategory == AppStrings.allProducts
                            ? widget.isPurchase
                                ? AppColors.primary
                                : AppColors.orange
                            : AppColors.gray,
                      ),
                    ).centered().p(8).h(30),
                    for (int i = 0;
                        i < widget.storeModel.categories.length;
                        i++)
                      TextButton(
                        style: ButtonStyle(
                          side: WidgetStateProperty.all(
                            BorderSide(
                                color: selectedCategory ==
                                        widget.storeModel.categories[i].uuid!
                                    ? widget.isPurchase
                                        ? AppColors.primary
                                        : AppColors.orange
                                    : AppColors.gray),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedCategory =
                                widget.storeModel.categories[i].uuid!;
                          });
                        },
                        child: CustomText(
                          size: 12,
                          textKey:
                              '  ${widget.storeModel.categories[i].name}  ',
                          color: selectedCategory ==
                                  widget.storeModel.categories[i].uuid!
                              ? widget.isPurchase
                                  ? AppColors.primary
                                  : AppColors.orange
                              : AppColors.gray,
                        ),
                      ).centered().p(8).h(30),
                  ],
                ).h(height * 0.06).w(width * 0.9),
              ],
            ).color(AppColors.white),

            // best seller text
            CustomText(
              textKey: AppStrings.bestSeller,
              color: AppColors.gray,
              size: 14,
            ).pSymmetric(h: 15, v: 8),

            // best seller list view
            DottedBorder(
              // radius: const Radius.circular(1),
              // color: AppColors.purple,
              child: ListView.builder(
                itemCount: filterProductList.length,
                // itemCount: widget.storeModel.products.length,
                itemBuilder: (context, index) => productCardWidget(
                        // productModel: widget.storeModel.products[index],
                        productModel: filterProductList[index])
                    .onTap(() {})
                    .color(AppColors.white)
                    .pOnly(bottom: 8)
                    .onTap(() {
                  _productdetailpage(context);
                }),
              ),
            ).h(height * 0.53).pSymmetric(h: 10),
          ],
        ),
      ),
    );
  }

  // store card widget contain store info
  Widget storeCardWidget({required StoreModel storeModel}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // store image with circular corners
        Image.asset(
          fit: BoxFit.fill,
          storeModel.image,
          // height: height * 0.1,
          // width: width * 0.28,
          height: 78,
          width: 82,
        ).cornerRadius(5).p(10),

        // store info
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // store name and bookmark icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // store name value
                CustomText(
                  size: 18,
                  bold: true,
                  textKey: storeModel.name,
                  color:
                      widget.isPurchase ? AppColors.primary : AppColors.orange,
                ),

                // bookmark icon
                CircleAvatar(
                  radius: 13,
                  backgroundColor: AppColors.textFieldBackground,
                  child: Icon(
                    size: 14,
                    Icons.bookmark_border,
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
                  ),
                )
              ],
            ).w(width * 0.64),

            // rating reviews tag
            WidgetHelper.ratingReviewTag(
              rating: storeModel.rating,
              noOfReviewsInK: storeModel.reviews.length,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // address with address icon
                titleIconRowWidget(
                  icon: Icon(
                    Icons.location_on,
                    size: 15,
                    color: widget.isPurchase
                        ? AppColors.primary
                        : AppColors.orange,
                  ),
                  title: storeModel.address,
                ),

                if (!widget.isPurchase)
                  Column(
                    children: [
                      CustomText(
                        size: 10,
                        color: AppColors.white,
                        textKey:
                            ' ${storeModel.kmAway.toString()} ${AppStrings.kmAway} ',
                      ).box.make().color(AppColors.orange).cornerRadius(2),
                      CustomText(
                        textKey: AppStrings.fromyourlocation,
                        size: 10,
                        color: AppColors.gray,
                      ).scale(scaleValue: 0.7),
                    ],
                  ),
              ],
            ).w(width * 0.64),
          ],
        ).h(height * 0.11),
      ],
    );
  }

  // product card widget contain product info
  Widget productCardWidget({required ProductModel productModel}) {
    return Row(
      children: [
        //product image and add button on top of it
        Stack(
          children: [
            // product image with circular corners
            Image.asset(
              fit: BoxFit.fill,
              productModel.image,
              height: 109,
              width: 95,
            ).cornerRadius(5).p(10),

            // add button with icon
            Positioned(
              left: 2,
              bottom: 5,
              child: TextButton.icon(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size(width * 0.3, 10)),
                  side: WidgetStateProperty.all(
                      BorderSide(color: AppColors.primary)),
                  iconSize: WidgetStateProperty.all(12),
                  backgroundColor: WidgetStateProperty.all(AppColors.white),
                ),
                onPressed: () {
                  // on press functionality for purchase
                  if (widget.isPurchase) {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(
                            builder: (BuildContext context,
                                void Function(void Function()) setState) {
                              return ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: variantBottomSheetWidget(setState,
                                        productModel: productModel)
                                    .w(width)
                                    .pSymmetric(h: 15, v: 10)
                                    .color(AppColors.white),
                              );
                            },
                          );
                        });
                  }
                  // on press functionality for rental
                  else {
                    // snack bar
                    final snackBar = SnackBar(
                      backgroundColor: AppColors.orange,
                      content: snackBarWidget(
                          noOfUnits: noOfUnits,
                          productPrice: productModel.amount),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },

                // add icon
                icon: Icon(
                  weight: 500,
                  Icons.add,
                  color: AppColors.primary,
                ),

                // add text
                label: CustomText(
                  bold: true,
                  textKey: AppStrings.add,
                  size: 12,
                ),
              ).h(30),
            )
          ],
        ),

        // product info
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product name
            CustomText(
              size: 12,
              bold: true,
              textKey: productModel.name,
            ),

            // prices with/without variant
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  size: 14,
                  bold: true,
                  textKey: widget.isPurchase
                      ? '₹ ${productModel.amount}'
                      : '\$ ${productModel.amount}/${productModel.rentalUnit}',
                ),
                if (widget.isPurchase)
                  CustomText(
                    color: AppColors.white,
                    size: 10,
                    textKey:
                        '  ${productModel.variants.length} ${AppStrings.variants}  ',
                  ).box.make().color(AppColors.greenLight).cornerRadius(10),
              ],
            ).w(width * 0.6),

            // rating reviews tag
            WidgetHelper.ratingReviewTag(
              rating: double.parse(productModel.rating),
              noOfReviewsInK: productModel.reviews.length,
            ),

            // view details button
            CustomText(
              color: AppColors.primary,
              size: 12,
              textKey: AppStrings.viewDetails,
            ).onInkTap(() {}),
          ],
        ).h(height * 0.14),
      ],
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

        // name
        CustomText(
          textKey: title,
          size: 12,
          color: widget.isPurchase
              ? titleColor ?? AppColors.primary
              : titleColor ?? AppColors.orange,
        )
      ],
    );
  }

  void _productdetailpage(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Column(children: [
            widget.isPurchase
                ? ProductDetailPage(
                    isPurchase: true,
                    storeModel: purchaseStoreList[0],
                    purchaseOrderModel: purchaseOrderList[0],
                  )
                : ProductDetailPage(
                    isPurchase: false, storeModel: rentalStoreList[0]),
            TextButton(
                    onPressed: () {
                      navigateToPageReplaceMent(purchaseOrderList[0].delivery
                          ? CartPageHomeDeliveryOrder(
                              isPurchase: widget.isPurchase ? true : false,
                              initialIndex: widget.isPurchase ? 0 : 1,
                            )
                          : CartPagePickUpOrder(
                              isPurchase: widget.isPurchase ? true : false,
                              initialIndex: widget.isPurchase ? 0 : 1,
                            ));
                    },
                    child: CustomText(
                      textKey: widget.isPurchase ? "Add to Cart" : "Book Now",
                      color: AppColors.white,
                    ))
                .w(width)
                .h(height * 0.05)
                .color(widget.isPurchase ? AppColors.primary : AppColors.orange)
                .cornerRadius(5)
                .p12(),
          ]).w(width).hPCT(context: context, heightPCT: 90);
        });
  }

// variant bottom sheet widget
  Widget variantBottomSheetWidget(void Function(void Function()) setState,
      {required ProductModel productModel}) {
    // String selectedVariant = "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // select variant text
        CustomText(
          textKey: AppStrings.selectVariant,
          size: 12,
          color: AppColors.gray,
        ),

        // some spacing
        5.heightBox,

        // horizontal listview elevated variant button
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i < productModel.variants.length; i++)
              ElevatedButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                      BorderSide(color: AppColors.gray)),
                  backgroundColor:
                      selectedVariant == productModel.variants[i].variantName
                          ? WidgetStateProperty.all(AppColors.primary)
                          : WidgetStateProperty.all(AppColors.grayLight),
                ),
                onPressed: () {
                  setState(() {
                    selectedVariant = productModel.variants[i].variantName;
                  });
                },
                child: CustomText(
                  size: 12,
                  color: selectedVariant == productModel.variants[i].variantName
                      ? AppColors.white
                      : AppColors.gray,
                  textKey: productModel.variants[i].variantName,
                ),
              ).p(10)
          ],
        ).h(height * 0.06).w(width * 0.9),

        // some spacing
        5.heightBox,

        // no. of units text
        CustomText(
          textKey: '${AppStrings.noOfUnits}:',
          size: 12,
          color: AppColors.gray,
        ),

        // some spacing
        10.heightBox,

        // unit increament decreament counter
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // - icon
            Icon(
              Icons.remove,
              color: AppColors.orange,
            ).onInkTap(() {
              setState(() {
                noOfUnits--;
              });
            }),

            // no of units value
            CustomText(
              bold: true,
              textKey: ' $noOfUnits ',
              color: AppColors.gray,
            ),

            // + icon
            Icon(
              Icons.add,
              color: AppColors.primary,
            ).onInkTap(() {
              setState(() {
                noOfUnits++;
              });
            }),
          ],
        ).w(width * 0.3).color(AppColors.grayLight).cornerRadius(15),

        // some spacing
        20.heightBox,

        // add to cart button
        TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  final productPrice = productModel.variants
                          .where(
                            (element) => element.variantName == selectedVariant,
                          )
                          .single
                          .price! *
                      noOfUnits;

                  // snack bar
                  final snackBar = SnackBar(
                    backgroundColor: AppColors.orange,
                    content: snackBarWidget(
                        noOfUnits: noOfUnits, productPrice: productPrice),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },

                // add to cart text
                child: CustomText(
                  textKey: AppStrings.addToCart,
                  color: AppColors.white,
                ))
            .w(width)
            .h(height * 0.05)
            .color(AppColors.primary)
            .cornerRadius(5),
      ],
    );
  }

  // snack bar widget
  Widget snackBarWidget(
      {required int noOfUnits, required double productPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // product price info
        Row(
          children: [
            // no of unit value
            CustomText(
              size: 12,
              textKey: '$noOfUnits ${AppStrings.itemAdded}',
            ),

            // product price value
            CustomText(
              color: AppColors.white,
              size: 12,
              textKey: ' | \$$productPrice',
              bold: true,
            ),

            // some spacing
            5.widthBox,

            // down arrow icon
            Icon(
              size: 15,
              Icons.arrow_drop_down_circle,
              color: AppColors.white,
            )
          ],
        ),

        // view cart button
        TextButton(
          onPressed: () {},
          child: CustomText(
            color: AppColors.orange,
            size: 12,
            textKey: AppStrings.viewCart.toUpperCase(),
          ),
        ).color(AppColors.white).cornerRadius(5)
      ],
    );
  }
}
