import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';
import '../../../themeFiles/app_typography.dart';


class LabTestDetailPage extends StatefulWidget {
  const LabTestDetailPage({super.key, });

  @override
  State<LabTestDetailPage> createState() => _LabTestDetailPageState();
}

class _LabTestDetailPageState extends State<LabTestDetailPage> {
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
          WidgetHelper().getCachedImage("https://c.files.bbci.co.uk/7BB3/production/_87476613_4d8eea22-7691-48e3-b522-fdc555433e87.jpg", height*0.25, width, boxFit: BoxFit.fitWidth),

          //product details
          productDetails(),
          10.heightBox,

          //about test
          aboutTest(),
          10.heightBox,

          //soil collection mode
          soilcollectionmode(),
          10.heightBox,

          //select no. of samples
          sampleUnits(),
          10.heightBox,

          // selected Farm Location
          selectedFarmLocation(),
          10.heightBox,

          //location guide
          locationGuide(),
          10.heightBox,

          //About us
          aboutUs(),
          5.heightBox,

          //policies
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(textKey: "Booking Cancellation Policy", color: AppColors.rentalPrimary, bold: true,).p12().centered().box.make().color(AppColors.white).w(width*0.98),
            ],
          ),
          5.heightBox,

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
                  CustomText(textKey: "5", color: AppColors.primary,size: 50,),
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
        CustomText(textKey: "1 Review", color: AppColors.subHeading,),
        10.heightBox,
        for(int i=0; i<1; i++)
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
                      CustomText(textKey: "Misha", color: AppColors.primary,),
                      CustomText(textKey: "Nice!"),
                      Row(children: [
                        CustomText(textKey: "5", color: AppColors.primary,),
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

  Widget aboutUs(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(textKey: "About us" , color: AppColors.black, size: 16,),
        7.heightBox,
        //TODO: need product description in model
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue.", maxLines: 3, style: TextStyle(color: AppColors.gray ,fontSize: 14), overflow: TextOverflow.ellipsis,),
        CustomText(textKey: "Read More", color: AppColors.soilTestPrimary, size: 14,),
      ],
    ).p12().color(AppColors.white);
  }

  Widget selectedFarmLocation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "Selected Farm Location".toUpperCase(), color: AppColors.gray,),
            CustomText(textKey: AppStrings.change, color: AppColors.soilTestPrimary,),
          ],
        ),
        5.heightBox,
        CustomText(textKey: "Farm".toUpperCase(), color: AppColors.soilTestPrimary, bold: true,).p4(),
        CustomText(textKey: "#350 Farm No.,Village Name, Street Address, State, City Pincode").p4()
      ],
    ).p12().color(AppColors.white);
  }

  Widget sampleUnits(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //no. of units text
        CustomText(textKey: "No. of Samples (Min. 4 Samples for Expert Visit)"),
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

        15.heightBox, 
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            CustomText(textKey: "Final charges: \$40", color: AppColors.soilTestPrimary,),
            Row(
              children: [
                CustomText(textKey: "View Summary" , color: AppColors.soilTestPrimary,),
                5.widthBox, 
                Icon(Icons.keyboard_arrow_down, size: 10, color: AppColors.white).p2().box.make().color( AppColors.soilTestPrimary).cornerRadius(100).onTap(() { }),
              ],
            )
          ],
        ).p(10).box.make().color(AppColors.lightpink).cornerRadius(8).onTap(() { }),
      ],
    ).p12().color(AppColors.white);
  }


  Widget imageCarousel(){
    List<Widget> items = [
      //TODO: need list of images for each product in model
      for(int i=0; i<1; i++)
        Image(image: AssetImage(ImageRoutes.labImage))
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
            CustomText(textKey: "Lab test", size: 16, color: AppColors.black,).w(width*0.70),
            Icon(Icons.share, size: 25, color: AppColors.primary,)
          ],
        ),
        7.heightBox,

        //price
        Row(
          children: [
            CustomText(textKey: "MRP: \$ 50"),
            CustomText(textKey: "/ Sample")
          ],),

        7.heightBox,

        //rating
        Row(
          children: [
            Icon(Icons.star, size: 14, color: Colors.yellow,),
            CustomText(textKey: "2 Rating ", size: 14,),
            CustomText(textKey: "(12 Users)", size: 14, color: AppColors.gray,), //TODO: need to add in model
          ],
        ),
      ],
    ).p12().color(AppColors.white);
  }

  //ChoiceChips of Crops with index
  Widget choiceChipWithImage(int index, bool isSelected) {
    List variants = [
      for(int i=0; i<3; i++)
        "1kg"
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


  Widget locationGuide(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText (  textKey: "Lab Location", size: 14, color: AppColors.subHeading,),

          ],
        ),

        5.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomText( bold:  true, textKey: "name", color:AppColors.soilTestPrimary,),


                  Row(
                      children: [
                        //store profile image
                        Icon(Icons.location_on, color: AppColors.soilTestPrimary, size: 20,),
                        // store name
                        3.widthBox,
                        CustomText( bold:  true, textKey: "near Ankleshwar",color:AppColors.soilTestPrimary,),])]),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:[
                CustomText(textKey: "5${AppStrings.kmaway}", color: AppColors.white,).p(3).box.make().color(AppColors.soilTestPrimary,).cornerRadius(5).centered(),
                CustomText(textKey: AppStrings.fromyourlocation, color: AppColors.gray, style: const TextStyle(fontSize: 1),)],
            ),
          ],
        ),
        10.heightBox,
        Image(image: AssetImage(ImageRoutes.map)),
        10.heightBox,
        CustomText(textKey: "Lab Direction and contact details with owner will be shared after booking" , style: const TextStyle(fontSize: 1), color: AppColors.soilTestPrimary, size: 1,).p(3).box.make().color( AppColors.lightpink).cornerRadius(5).centered(),
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

  Widget aboutTest(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(textKey: "Test Content:" " pH Level, Volatile/Non-Volatile Substa-nce, Mineral Type and its Level").w(width*0.9)
          ],
        ),
        7.heightBox,
        Row(
          children: [
            CustomText(textKey: "Test Type : Continuous Test").w(width*0.9)
          ],
        ),
        7.heightBox,
        CustomText(textKey: "Know More", bold: true,)
      ],
    ).p12().color(AppColors.white);
  }

  Widget soilcollectionmode(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.heightBox,

        CustomText(textKey: "Soil Collection Mode: ", color: AppColors.gray,),
        5.heightBox,
        CustomText(textKey: "By Lab Expert", color: AppColors.white,).p4().box.make().color(AppColors.soilTestPrimary).cornerRadius(5),

        10.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "soil collection".toUpperCase(), color: AppColors.gray,),
            Icon(Icons.arrow_forward, color: AppColors.gray,),
            CustomText(textKey: "get report on".toUpperCase() , color: AppColors.gray,)
          ],
        ),



        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "10 april 2023", color: AppColors.orange,),
            CustomText(textKey: "10 april 2023" , color: AppColors.soilTestPrimary,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "3:00 am", color: AppColors.orange,),
            CustomText(textKey: "3:00 am", color: AppColors.orange,),
            CustomText(textKey: "3:00 apm", color: AppColors.soilTestPrimary,)
          ],
        ),

      ],
    ).p12().color(AppColors.white);
  }

  Widget rentDuration(){
    // String pickupdate = DateFormat('dd LLLL, yyyy').format(widget.rentalOrderModel!.pickupDateTime);
    // String dropoffdate = DateFormat('dd LLLL, yyyy').format(widget.rentalOrderModel!.dropoffDateTime);
    // String pickuptime = DateFormat('hh:mm a').format(widget.rentalOrderModel!.pickupDateTime);
    // String dropofftime = DateFormat('hh:mm a').format(widget.rentalOrderModel!.dropoffDateTime);
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
            CustomText(textKey: "10 april 2023", color: AppColors.rentalPrimary,),
            CustomText(textKey: "10 april 2023" , color: AppColors.rentalPrimary,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "3:00 am", color: AppColors.rentalPrimary,),
            CustomText(textKey: "3:00 apm", color: AppColors.rentalPrimary,)
          ],
        ),
        15.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(textKey: "Final Rent: \$40", color: AppColors.rentalPrimary,),
            Row(
              children: [
                CustomText(textKey: "View Summary" , color: AppColors.rentalPrimary,),
                5.widthBox,
                Icon(Icons.keyboard_arrow_down, size: 10, color: AppColors.white
                ).p2().box.make().color( AppColors.soilTestPrimary).cornerRadius(100).onTap(() { }),
              ],
            )

          ],
        ).p(10).box.make().color(AppColors.lightpink).cornerRadius(8).onTap(() { }),

      ],
    ).p12().color(AppColors.white);
  }

}

