import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:farmsanta_new/Models/MarketPlace/Purchase/purchase_order_model.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/strings.dart';
import '../../Models/MarketPlace/Rental/rental_order_model.dart';
import '../../Models/MarketPlace/store_model.dart';
import '../../Widgets/classes/style_helper.dart';
import '../../themeFiles/app_typography.dart';

class ProductDetailPage extends StatefulWidget {
  final bool isPurchase;
  final StoreModel storeModel;
  final PurchaseOrderModel? purchaseOrderModel;
  final RentalOrderModel? rentalOrderModel;
  const ProductDetailPage({super.key, required this.isPurchase, required this.storeModel, this.rentalOrderModel, this.purchaseOrderModel});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}


class _ProductDetailPageState extends State<ProductDetailPage> {

  int item = 1;
  int currentIndex = 0;
  int selectedIndex = 0;
  bool? liked;


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

                //product images
                imageCarousel().color(AppColors.white),

                //product details
                productDetails(),
                10.heightBox,

                //select variants or Rent duration
                if(widget.isPurchase == true)
                  selectVariants(context)
                else
                  rentDuration(),
                10.heightBox,

                //location guide
                locationGuide(),
                10.heightBox,

                //product description
                productDescription(),
                10.heightBox,

                // about product
                productSpecification(),
                10.heightBox,

                //policies
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(textKey: "Return/Replace Policy", color: AppColors.primary, bold: true,).p12().centered().box.make().color(AppColors.white).w(width*0.45),
                    CustomText(textKey: "Order Cancel Policy", color: AppColors.rentalPrimary, bold: true,).p12().centered().box.make().color(AppColors.white).w(width*0.45),
                  ],
                ),
                10.heightBox,

                //Review and Ratings
                productReviewsRating(),

              ],
            ),
          ).color(AppColors.grayLight);

  }


  Widget productReviewsRating(){
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(textKey: "Ratings & Reviews", ),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(children: [
                  CustomText(textKey: widget.storeModel.products[0].reviews[0].rating.toString(), color: AppColors.primary,size: 50,),
                  Icon(Icons.star, color: AppColors.primary, size: 50,)
                ],),
                CustomText(textKey: "8 Ratings", color: AppColors.subHeading, size: 20,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.primary, size: 10,),
                    CustomText(textKey: "5", color: AppColors.primary,size: 10,),
                    CustomText(textKey: "(0)", color: AppColors.primary,size: 10,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.greenDisable, size: 10,),
                    CustomText(textKey: "4", color: AppColors.greenDisable,size: 10,),
                    CustomText(textKey: "(0)", color: AppColors.primary,size: 10,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.greenLight, size: 10,),
                    CustomText(textKey: "3", color: AppColors.greenLight,size: 10,),
                    CustomText(textKey: "(0)", color: AppColors.primary,size: 10,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.yellow, size: 10),
                    CustomText(textKey: "2", color: AppColors.yellow,size: 10,),
                    CustomText(textKey: "(0)", color: AppColors.primary,size: 10,),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.red, size: 10,),
                    CustomText(textKey: "1", color: AppColors.red,size: 10,),
                    CustomText(textKey: "(0)", color: AppColors.primary,size: 10,),
                  ],
                )
              ],
            )
          ],
        ),
        CustomText(textKey: "${widget.storeModel.products[0].reviews.length} Review", color: AppColors.subHeading,),
        10.heightBox,
        for(int i=0; i<widget.storeModel.products[0].reviews.length; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(ImageRoutes.labImage),
                    radius: 28,
                  ),
                  10.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(textKey: widget.storeModel.products[0].reviews[i].username, color: AppColors.primary,),
                      CustomText(textKey: widget.storeModel.products[0].reviews[i].review),
                      Row(children: [
                        CustomText(textKey: widget.storeModel.products[0].reviews[i].rating.toString(), color: AppColors.primary,),
                        Icon(Icons.star, color: AppColors.primary, size: 10,)
                      ],)

                    ],
                  ),
                ],
              ).w(width*0.75),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.thumb_up, color: liked == null || liked == false? AppColors.gray: AppColors.blueDark, size: 18,).onTap(() {
                    setState(() {
                      liked = true;
                      // widget.storeModel.products[0].reviews[i].isLiked = true; //TODO: not needed as final in model
                    });
                  }),
                  Icon(Icons.thumb_down, color: liked== null || liked == true? AppColors.gray: AppColors.blueDark, size: 18,).onTap(() {
                    setState(() {
                      liked = false;
                      // widget.storeModel.products[0].reviews[i].isLiked = true;
                    });
                  }),
                ],
              ).w(width*0.15),
            ],
          ),
      ],
    ).p12().color(AppColors.white);
  }

  Widget productDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(textKey: "Product Description" , color: AppColors.black, size: 16,),
        7.heightBox,
        //TODO: need product description in model
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue.", maxLines: 4, style: TextStyle(color: AppColors.gray ,fontSize: 14),),
        CustomText(textKey: "Read More", color: AppColors.primary, size: 14,),
      ],
    ).p12().color(AppColors.white);
  }



  Widget imageCarousel(){
    List<Widget> items = [
      //TODO: need list of images for each product in model
      for(int i=0; i<1; i++)
        Image(image: AssetImage(widget.storeModel.products[i].image))
    ];
    return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),

            items: items,
          ),
          DotsIndicator(
            dotsCount: items.length,
            position: currentIndex.toDouble(),
          )
        ]
    );
  }

  Widget productDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //name and share
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: widget.storeModel.products[0].name, size: 16,).w(width*0.70),
            Icon(Icons.share, size: 25, color: AppColors.primary,)
          ],
        ),
        7.heightBox,

        //price
        Row(
          children: [
            Row(
              children: [
                CustomText(textKey: "MRP: \$ ${widget.storeModel.products[0].amount}"),
                if(widget.isPurchase == false)
                  CustomText(textKey: "/ ${widget.storeModel.products[0].rentalUnit}")
              ],
            ),
            if(widget.isPurchase == false)
              CustomText(textKey: "(+ Refundable Deposit \$ 50)",size: 12, color: AppColors.rentalPrimary,)
          ],
        ),
        
        7.heightBox,

        //rating
        Row(
          children: [
            Icon(Icons.star, size: 14, color: Colors.yellow,),
            CustomText(textKey: "${widget.storeModel.products[0].rating} Rating ", size: 14,),
            CustomText(textKey: "(12 Users)", size: 14, color: AppColors.gray,), //TODO: need to add in model
          ],
        ),
        7.heightBox,

        if(widget.isPurchase == false)
          CustomText(textKey: "Power Source . Engine Power . Brand" ,color: AppColors.primary,),

      ],
    ).p12().color(AppColors.white);
  }

  //ChoiceChips of Crops with index
  Widget choiceChipWithImage(int index, bool isSelected) {
    List variants = [
      for(int i=0; i<widget.storeModel.products[0].variants.length; i++)
        widget.storeModel.products[0].variants[i].variantName
    ];
    return RawChip(
      label: CustomText(
        textKey: variants[index],
        style: AppTextStyle.labelLarge,
        color:isSelected? AppColors.white : AppColors.gray,
      ).pSymmetric(h: 7),
      side: BorderSide(color: AppColors.gray),
      backgroundColor: isSelected? AppColors.primary : AppColors.background,
      selectedColor: AppColors.gray,
      onSelected: (bool selected) {
        setState(() {
          selectedIndex = index;
          isSelected = selected;
        });
      },
    );
  }

  Widget selectVariants(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //select variant text
        CustomText(textKey: "Select Variant"),
        7.heightBox,

        //variant options
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storeModel.products[0].variants.length,
          itemBuilder: (BuildContext context, int index) {
            bool isSelected = selectedIndex == index;
            return choiceChipWithImage(index, isSelected)
                .pSymmetric(h: 7);
          },
        ).hPCT(context: context, heightPCT: 4),
        10.heightBox,

        //no. of units text
        CustomText(textKey: "No. of Units :"),
        7.heightBox,
        // no. of units options
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(color: AppColors.red, onPressed: () { setState(() {item--;}); }, icon: const Icon(Icons.remove),),
              CustomText(textKey: "$item", size: 20,),
              IconButton(color: AppColors.primary, onPressed: () { setState(() {item++;}); }, icon: const Icon(Icons.add),)
            ]
        ).box.makeCentered().color(AppColors.grayLight).w(width*0.35).cornerRadius(25).h(height*0.05),

      ],
    ).p12().color(AppColors.white);
  }

  Widget locationGuide(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText (  textKey: !widget.purchaseOrderModel!.delivery ? "Store location" : "Pickup/Store Location", size: 14, color: AppColors.subHeading,),
            Row(
              children: [
                CustomText (textKey: !widget.purchaseOrderModel!.delivery ? "Delivery in " : "Pickup ready in ", size: 12, color: AppColors.gray,),
                CustomText (textKey: "1hr : 20min", size: 12, color: AppColors.primary,), //TODO:
              ],
            )
          ],
        ),

        10.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      children: [
                        CustomText( bold:  true, textKey: widget.storeModel.name, color: widget.isPurchase? AppColors.primary: AppColors.rentalPrimary,),
                      ]
                  ),

                  Row(
                      children: [
                        //store profile image
                        Icon(Icons.location_on, color: widget.isPurchase? AppColors.primary: AppColors.rentalPrimary, size: 20,),
                        // store name
                        3.widthBox,
                        CustomText( bold:  true, textKey: widget.storeModel.address,color: widget.isPurchase? AppColors.primary: AppColors.rentalPrimary),])]),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                CustomText(textKey: widget.storeModel.kmAway.toString()+ AppStrings.kmaway, color: AppColors.white,).p(3).box.make().color(widget.isPurchase? AppColors.primary: AppColors.rentalPrimary).cornerRadius(5).centered(),
                CustomText(textKey: AppStrings.fromyourlocation, color: AppColors.gray, style: const TextStyle(fontSize: 1),)],
            ),
          ],
        ),
        10.heightBox,
        Image(image: AssetImage(ImageRoutes.map)),
        10.heightBox,
        CustomText(textKey:  AppStrings.storelocationcondition , style: const TextStyle(fontSize: 1), color: widget.isPurchase? AppColors.primary: AppColors.rentalPrimary, size: 1,).p(3).box.make().color(widget.isPurchase? AppColors.blueLight : AppColors.lightpink).cornerRadius(5).centered(),
      ],
    ).p8().color(AppColors.white).cornerRadius(5);
  }

  Widget productSpecification(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(textKey: "Product Specification", size: 16,).p2(),
        5.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(textKey: "Weight: ", color: AppColors.primary,).p2(),
                CustomText(textKey: "Material: ", color: AppColors.primary,).p2(),
                CustomText(textKey: "Product Feature: ", color: AppColors.primary,).p2(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(textKey: "Power source: ", color: AppColors.primary,).p2(),
                CustomText(textKey: "Max Speed: ", color: AppColors.primary,).p2(),
                CustomText(textKey: "Product Feature: ", color: AppColors.primary,).p2(),
              ],
            )

          ],),
      ],
    ).p8().color(AppColors.white);
  }

  Widget rentDuration(){
    String pickupdate = DateFormat('dd LLLL, yyyy').format(widget.rentalOrderModel!.pickupDateTime);
    String dropoffdate = DateFormat('dd LLLL, yyyy').format(widget.rentalOrderModel!.dropoffDateTime);
    String pickuptime = DateFormat('hh:mm a').format(widget.rentalOrderModel!.pickupDateTime);
    String dropofftime = DateFormat('hh:mm a').format(widget.rentalOrderModel!.dropoffDateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "Rent Duration", color: AppColors.primary,),
            CustomText(textKey: "Change" , color: AppColors.primary,)
          ],
        ),
        Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "PICKUP DATE/TIME", color: AppColors.gray,),
            Icon(Icons.arrow_forward, color: AppColors.gray,),
            CustomText(textKey: "DROP OFF DATE/TIME" , color: AppColors.gray,)
          ],
        ),



      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: pickupdate, color: AppColors.rentalPrimary,),
            CustomText(textKey: dropoffdate , color: AppColors.rentalPrimary,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: pickuptime, color: AppColors.rentalPrimary,),
            CustomText(textKey: dropofftime , color: AppColors.rentalPrimary,)
          ],
        ),

        15.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "Final Rent: \$${widget.storeModel.products[0].amount}", color: AppColors.rentalPrimary,),
            Row(
              children: [
                CustomText(textKey: "View Summary" , color: AppColors.rentalPrimary,),
                5.widthBox,
                Icon(Icons.keyboard_arrow_down, size: 10, color: AppColors.white
               ).p2().box.make().color( widget.isPurchase
                    ? AppColors.primary
                    : AppColors.rentalPrimary,).cornerRadius(100).onTap(() { }),

              ],
            )

          ],
        ).p(10).box.make().color(AppColors.lightpink).cornerRadius(8).onTap(() { }),

      ],
    ).p12().color(AppColors.white);
  }





}
