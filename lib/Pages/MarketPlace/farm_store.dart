
import 'package:farmsanta_new/Models/MarketPlace/product_model.dart';
import 'package:farmsanta_new/Models/MarketPlace/store_model.dart';
import 'package:farmsanta_new/Pages/MarketPlace/dummy_array.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart' show AppTextStyle;
import 'package:farmsanta_new/themeFiles/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../Widgets/classes/style_helper.dart';
import '../base_screen.dart';

class FarmStore extends BaseScreen {
  final StoreModel store;
  const FarmStore({super.key, required this.store});

  @override
  BaseScreenState<FarmStore> createState() => _FarmStoreState();
}

class _FarmStoreState extends BaseScreenState<FarmStore> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      //back and menu button
      appBar: AppBarDesigns.getAppTitleAndIconButton(
          "",
          Icon(
            CustomIcons.menu,
            color: AppColors.gray,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //store card
          farmStoreCard(storeData.first).pSymmetric(h: 15),

          //search section
          CustomInputField(hint: AppStrings.search,textEditingController: TextEditingController(),),

          //filter tabs
          Row(
            children: [
              TabBar( controller: _tabController,tabs: [
              ...widget.store.categories.map((e) => CustomText(textKey: e.name)),
              ], onTap: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
              }, ).expand(flex: 7),
              CustomButtonElevated(text: AppStrings.filter, onTap: (onTap){})
            ],
          ),


          //List of cards
          TabBarView(
            controller: _tabController,
            children: [
              Column(
                children: [
                  10.heightBox,
                  CustomText(textKey: AppStrings.bestSeller),
                  10.heightBox,
                  ListView.builder(
                    itemCount: widget.store.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = widget.store.products[index];


                      return productCard(product);
                    },
                  ).expand(),
                ],
              )
            ],
          ).expand(),





        ],
      ),
    );
  }

  Widget farmStoreCard(StoreModel store) {
        int rating = 5;
        return Row(
          children: [
            WidgetHelper()
                .getCachedImage(boxFit: BoxFit.fitHeight, store.image, 100, 100)
                .expand(flex: 3),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textKey: store.name,
                  style: AppTextStyle.titleMedium.copyWith(color: AppColors.primary),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.orange,
                    ),
                    CustomText(
                      textKey: store.rating.toString(),
                      bold: true,
                    ),
                    CustomText(textKey: "( $rating )"),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.primary,
                    ),
                    CustomText(textKey: store.address)
                  ],
                )
              ],
            ).p(5).expand(flex: 6),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Icon(Icons.bookmark_border_rounded),
              ],
            ).expand(),
          ],
        ).p(5).color(AppColors.white).box.make();


  }

  //productCard
  Widget productCard(ProductModel product) {
    return Row(
      children: [
        Stack(
          children: [
            WidgetHelper()
                .getCachedImage(boxFit: BoxFit.fitHeight, product.image, 100, 100)
               ,
            CustomButtonElevated(text: AppStrings.add, onTap: (){}).positioned(bottom: 2, left: 10)
          ],
        ).expand(flex: 3),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name and quantity
            WidgetHelper.getRichCustomText(product.name," ${product.quantity.toString()}Kg", style1: AppTextStyle.bodyMedium.copyWith(color: AppColors.black), style2: AppTextStyle.bodyMedium.copyWith(color: AppColors.orange)),
            //price
            WidgetHelper.getRichCustomText("₹", product.amount.toString() , style1: AppTextStyle.bodyLarge.copyWith(color: AppColors.black), style2: AppTextStyle.bodyLarge.copyWith(color: AppColors.black)),

            //rating and reviews
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.orange,
                ),

                WidgetHelper.getRichCustomText( product.rating.toString()," ${product.reviews.length}", style1: AppTextStyle.titleMedium , style2: AppTextStyle.bodyMedium.copyWith(color: AppColors.orange)),


              ],
            ),
            
            //view details
            CustomText(textKey: AppStrings.viewDetails, style: AppTextStyle.bodyMedium.copyWith(color: AppColors.primary),).onTap(() { })
          ],
        ).p(5).expand(flex: 6),
        //variant name
        CustomText(textKey:  "${product.variants.length.toString()}  ${ product.variants.length != 1 ? AppStrings.variants: AppStrings.variant}", style: AppTextStyle.bodyMedium.copyWith(color: AppColors.white),).p(4).box.make().color(AppColors.primary).cornerRadius(25).centered().expand(flex: 3),
      ],
    ).p(5).color(AppColors.white).box.make();
  }



}

