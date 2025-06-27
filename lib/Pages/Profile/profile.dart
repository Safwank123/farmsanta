
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/Profile/edit_profile.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/colors.dart';
import '../../Constants/strings.dart';
import '../../Models/User/user.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/Widgets/custom_text_string.dart';
import '../../Widgets/classes/card_helper.dart';
import '../base_screen.dart';

class ProfileScreen extends BaseScreen {
  static const String routeName = "/profile-screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  BaseScreenState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseScreenState<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  UserModel? user = StoreHelper.store.user;

  bool edit = false;
  int _currentIndex = 0;
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.profile),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //profile image with background
              Stack(
                children: [
                  //background Green Color
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    color: primaryColor,
                  ).centered(),
                  //Profile Picture
                  // Container(
                  //   child: WidgetHelper().getCircularAvatar(user!.image),
                  // ).h(100).w(100).centered().pOnly(top: 100),
                ],
              ),
              10.heightBox,

              //Name
              CustomTextString(
                text: user!.name,
                style: WidgetHelper.getTextStyle(true, 16, primaryColor),
              ).centered(),
              10.heightBox,

              //Edit Button
              CustomButtonElevated(
                  text: AppStrings.edit,
                  onTap: () {
                    // setState(() {
                    //   edit = true;
                    // });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfile(
                                  user: user!,
                                )));
                  }).centered(),

              10.heightBox,
              WidgetHelper.getTitlewithNumber(context, AppStrings.myFarm, 2),

              //farm Section
              VxSwiper.builder(
                enableInfiniteScroll: false,
                itemCount: StoreHelper.store.farmItem.length,
                height: context.percentHeight * 45,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return CardHelper.farmCard(
                    context,
                    () {},
                    false, //view (disable edit)
                    StoreHelper.store.farmItem[index].title,
                    StoreHelper.store.farmItem[index].subtitle,
                  );
                },
              ).h20(context),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HStack(
                    StoreHelper.store.farmItem.map((item) {
                      int index = StoreHelper.store.farmItem.indexOf(item);
                      return VxBox()
                          .square(12)
                          .color(index == _currentIndex
                              ? primaryColor
                              : Vx.gray200)
                          .roundedFull
                          .make()
                          .pOnly(right: 8);
                    }).toList(),
                  ).centered(),
                ],
              ).pSymmetric(v: 10),
              // CardHelper.farmCard(context, AppStrings.viewfarm, () {}, 'title', 'subtitle'),
              10.heightBox,
              WidgetHelper.getTitlewithNumber(context, AppStrings.myCrops, 2),

              //Crop section
              // SizedBox(
              //   height: 100,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: croplist.length,
              //     itemBuilder: (context, index) {
              //       var l1 = croplist[index];
              //       return CardHelper.cropCard(
              //         context,
              //         false, //disable edit icon
              //         l1[0],
              //         l1[1],
              //       );
              //     },
              //   ),
              // ),

              20.heightBox,

              //name, mobile number, dateofbirth, education, gender
              ...List.generate(5, (index) {
                var listElement = list[index];
                return WidgetHelper().getInfoContainers(
                  context,
                  listElement[0],
                  listElement[1],
                  listElement[2],
                );
              }),
              10.heightBox,

              //Address
              Container(
                decoration: getBoxDecorationAll(15, textFieldLightColor),
                child: Row(
                  children: [
                    WidgetHelper().getCachedImage(
                        'https://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-coriander-imported-herb-seeds-16969067036812.jpg?v=1634203694',
                        50,
                        50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(textKey: AppStrings.location),
                        WidgetHelper().getInfoText(
                            context, AppStrings.address, user!.address),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //country, district and village fields
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetHelper().getInfoText(context,
                                        AppStrings.country, user!.country),
                                    WidgetHelper().getInfoText(context,
                                        AppStrings.district, user!.district),
                                    WidgetHelper().getInfoText(context,
                                        AppStrings.village, user!.village),
                                  ],
                                ),
                                10.widthBox,
                                //state, subdistrict and pincode fields
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    WidgetHelper().getInfoText(
                                        context, AppStrings.state, user!.state),
                                    WidgetHelper().getInfoText(
                                        context,
                                        AppStrings.subdistrict,
                                        user!.subDistrict),
                                    WidgetHelper().getInfoText(context,
                                        AppStrings.pincode, user!.pinCode),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            10.widthBox,
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            10.widthBox,
                          ],
                        ),
                      ],
                    ).pOnly(left: 10)
                  ],
                ).p(10),
              ).pSymmetric(h: 15),
              10.heightBox,

              //datasource and havesmartphone
              ...List.generate(2, (index) {
                var listElement = list[index + 5];
                return WidgetHelper().getInfoContainers(
                  context,
                  listElement[0],
                  listElement[1],
                  listElement[2],
                );
              }),
            ],
          ).pOnly(bottom: 100),
        ));
  }
}
