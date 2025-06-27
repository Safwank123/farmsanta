
import 'package:farmsanta_new/Constants/arrays.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Functions/common.dart';
import '../../Models/MarketPlace/Purchase/purchase_order_model.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../themeFiles/app_colors.dart';
import '../../themeFiles/custom_icons.dart';
import '../SupportPlace/Market/market.dart';
import '../base_screen.dart';
import 'marketplace_store_page.dart';

class CategoryPage extends BaseScreen {
  bool isPurchase;
  PurchaseOrderModel purchaseOrderModel;
  CategoryPage({required this.isPurchase, required this.purchaseOrderModel});

  @override
  BaseScreenState<CategoryPage> createState() => _CategoryPageState();
}

List sortByCategories = ["Filters", 'Categories', "Rating", 'Pickup Distance'];
List addedCategories = [];

class _CategoryPageState extends BaseScreenState<CategoryPage> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(

        //appbar //TODO: back button not visible
        appBar: AppBarDesigns.getAppTitleAndIconButton(
            "Fertilizers",
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: AppColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.black,
                  ),
                ),
              ],
            )),
        body: Column(
          children: [
            //sort by category list
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  decoration: getBoxDecorationAllBorder(
                      15, getColor(AppThemeColorsEnum.white), AppColors.gray),
                  child: CustomText(
                    textKey: "Sort By",
                    style: TextStyle(fontSize: 1),
                    color: AppColors.black,
                  )
                      .box
                      .make()
                      .color(AppColors.white)
                      .cornerRadius(10)
                      .centered()
                      .p(4),
                ).p(3),
                for (int i = 0; i < sortByCategories.length; i++)
                  sortByWidget(sortByCategories[i])
                      .pSymmetric(v: 3, h: 6)
                      .onInkTap(() {
                    if (!addedCategories.contains(sortByCategories[i])) {
                      setState(() {
                        addedCategories.add(sortByCategories[i]);
                      });
                    }
                  }),
              ],
            ).h(height * 0.04).wFull(context).color(AppColors.white),

            //selected category list
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < addedCategories.length; i++)
                  addedCategoryWidget(addedCategories[i])
                      .pSymmetric(v: 3, h: 6)
                      .onInkTap(() {
                    setState(() {
                      addedCategories.removeAt(i);
                    });
                  }),
              ],
            ).h(height * 0.04).wFull(context).color(AppColors.white),

            3.heightBox,
            ListView(
              children: [
                //list of stores
                for (int i = 0;
                    i < StoreHelper.store.purchaseStoreList.length;
                    i++)
                  Column(
                    children: [
                      5.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //store profile image
                              widget.isPurchase
                                  ? Image(
                                      image: AssetImage(
                                          ImageRoutes.farmerstoreimage),
                                      height: 30,
                                      width: 30,
                                    )
                                  : Image(
                                      image: AssetImage(
                                          ImageRoutes.rentalstoreimage),
                                      height: 25,
                                      width: 25,
                                    ),

                              //store name
                              3.widthBox,
                              CustomText(
                                textKey: widget.isPurchase
                                    ? StoreHelper
                                        .store.purchaseStoreList[i].name
                                    : rentalStoreList[i].name,
                                bold: true,
                              ),

                              //rating
                              20.widthBox,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  CustomText(
                                      textKey: widget.isPurchase
                                          ? "${StoreHelper.store.purchaseStoreList[i].rating} (12k)"
                                          : "${rentalStoreList[i].rating} (12k)") //TODO: need to add no. of user in storemodel
                                ],
                              )
                                  .p(2)
                                  .box
                                  .make()
                                  .color(AppColors.grayLight)
                                  .cornerRadius(100)
                                  .centered(),
                            ],
                          ),

                          // nearest store tag
                          if (widget.isPurchase &&
                              StoreHelper.store.purchaseStoreList[i].kmAway <=
                                  5)
                            CustomText(
                              textKey: AppStrings.neareststore,
                              color: AppColors.white,
                              size: 10,
                            )
                                .p(3)
                                .box
                                .make()
                                .color(AppColors.primary)
                                .cornerRadius(5)
                                .centered()
                          else if (!widget.isPurchase &&
                              rentalStoreList[i].kmAway <= 5)
                            CustomText(
                              textKey: AppStrings.neareststore,
                              color: AppColors.white,
                              size: 10,
                            )
                                .p(3)
                                .box
                                .make()
                                .color(AppColors.rentalPrimary)
                                .cornerRadius(5)
                                .centered(),
                        ],
                      ).pSymmetric(h: 8, v: 4).color(AppColors.white),

                      //individual store list
                      ListView(scrollDirection: Axis.horizontal, children: [
                        //store Image card
                        viewStoreWidget(widget: widget, i: i)
                            .h(115)
                            .w(125)
                            .p2(),

                        //all product card
                        for (int j = 0;
                            j <
                                (widget.isPurchase
                                    ? StoreHelper.store.purchaseStoreList[i]
                                        .products.length
                                    : rentalStoreList[i].products.length);
                            j++)
                          productDetailWidget(widget: widget, i: i, j: j)
                              .h(115)
                              .w(125)
                              .p2()
                              .color(AppColors.white),

                        SizedBox(
                                child: CustomText(
                          textKey: "View all",
                          color: AppColors.white,
                        ).centered())
                            .w(102)
                            .h(103)
                            .color(widget.isPurchase
                                ? AppColors.primary
                                : AppColors.rentalPrimary)
                            .cornerRadius(5)
                            .onTap(() {
                              if(widget.isPurchase)
                                MarketPlaceStorePage(isPurchase: widget.isPurchase, storeModel: purchaseStoreList[0],);
                              else
                                MarketPlaceStorePage(isPurchase: widget.isPurchase, storeModel: rentalStoreList[0],);
                        })
                      ])
                          .pSymmetric(h: 8, v: 4)
                          .wFull(context)
                          .h(height * 0.20)
                          .color(AppColors.white),
                    ],
                  ),
              ],
            ).hFourFifth(context)
          ],
        ).color(AppColors.gray));
  }
}

Widget addedCategoryWidget(String text) {
  return Stack(
    children: [
      Container(
        decoration: getBoxDecorationAllBorder(
            25, getColor(AppThemeColorsEnum.white), AppColors.orange),
        child: CustomText(
          textKey: text,
          size: 4,
          color: AppColors.white,
        ).p(5).box.make().color(AppColors.orange).cornerRadius(100).centered(),
      ),
      Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            width: 12,
            height: 12,
            child: Transform.rotate(
              angle: 45 * 0.0174533,
              child: const Icon(
                Icons.add,
                color: Colors.orange,
                size: 12,
              ),
            ),
          ).color(AppColors.white).cornerRadius(10))
    ],
  );
}

Widget sortByWidget(String text) {
  return Stack(children: [
    Container(
      decoration: getBoxDecorationAllBorder(
          25, getColor(AppThemeColorsEnum.white), AppColors.gray),
      child: CustomText(
        textKey: text,
        size: 4,
        color: AppColors.black,
      ).p(6).box.make().cornerRadius(100).centered(),
    ),
    if (addedCategories.contains(text))
      Positioned(
        top: 0,
        right: 0,
        child: ClipOval(
          child: Container(
            width: 10,
            height: 10,
            color: Colors.orange,
          ),
        ),
      )
  ]);
}

Widget productDetailWidget(
    {required CategoryPage widget, required int i, required int j}) {
  return Container(
    decoration: getBoxDecorationAllBorder(
        5, getColor(AppThemeColorsEnum.white), AppColors.gray),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage(widget.isPurchase
              ? StoreHelper.store.purchaseStoreList[i].products[j].image
              : rentalStoreList[i].products[j].image),
          width: 70,
          height: 70,
        ).p(6),
        CustomText(
          textKey: widget.isPurchase
              ? StoreHelper.store.purchaseStoreList[i].products[j].name
              : rentalStoreList[i].products[j].name,
          size: 1,
        ),
        Row(
          children: [
            if (widget.isPurchase == false)
              CustomText(
                textKey: "Brand: Mahindra",
                color: AppColors.gray,
              ) //TODO: parameter not present in model

            else
              CustomText(
                textKey:
                    "${StoreHelper.store.purchaseStoreList[i].products[j].quantity} kg",
                size: 1,
                color: widget.isPurchase
                    ? AppColors.primary
                    : AppColors.rentalPrimary,
              ),
          ],
        ),
        5.heightBox,
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey:
                  "\$${widget.isPurchase ? StoreHelper.store.purchaseStoreList[i].products[j].amount : rentalStoreList[i].products[j].amount} ",
              style: const TextStyle(
                  decoration: TextDecoration.lineThrough, fontSize: 1),
              size: 1,
              color: AppColors.gray,
            ),
            if (widget.isPurchase)
              CustomText(
                textKey: "\$20",
                size: 1,
                bold: true,
                style: TextStyle(fontSize: 1),
              ) //TODO: get new amount from model
            else
              CustomText(
                textKey: "\$20",
                size: 1,
                bold: true,
              ),
            CustomText(
                textKey: StoreHelper.store.purchaseStoreList[i].products[j]
                        .offersId!.percentageOff
                        .toString() +
                    "% off",
                size: 1,
                color: AppColors.primary,
                style: TextStyle(fontSize: 1)),
          ],
        )),
      ],
    ).p2(),
  );
}

Widget viewStoreWidget({required CategoryPage widget, required int i}) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.isPurchase
                    ? StoreHelper.store.purchaseStoreList[i].image
                    : rentalStoreList[i].image),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: getBoxDecorationBottom(5,
              widget.isPurchase ? AppColors.primary : AppColors.rentalPrimary),
          alignment: Alignment.center,
          child: CustomText(
            textKey: "View Store",
            size: 12,
            color: AppThemeColors.getColor(AppThemeColorsEnum.white),
          ),
        ).h(30),
      ),
      Positioned(
        top: 5,
        right: 5,
        child: Icon(
          CustomIcons.save,
          size: 15,
          color:
              widget.isPurchase ? AppColors.primary : AppColors.rentalPrimary,
        ).p4().box.make().color(AppColors.white).cornerRadius(100),
      ),
    ],
  );
}
