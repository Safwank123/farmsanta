
import 'package:farmsanta_new/Constants/colors.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/arrays.dart';
import '../../Constants/strings.dart';
import '../../Models/User/user.dart';
import '../../Services/store_helper.dart';
import '../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../Widgets/Widgets/custom_text.dart';
import '../../Widgets/classes/app_bar.dart';
import '../../Widgets/classes/card_helper.dart';
import '../../Widgets/classes/widget_helper_class.dart';
import '../base_screen.dart';

class EditProfile extends BaseScreen {
  static const String routeName = "/edit-profile";
  final UserModel user;
  const EditProfile({required this.user, Key? key}) : super(key: key);

  @override
  BaseScreenState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends BaseScreenState<EditProfile> {
  final countryCode = TextEditingController();
  final secondaryNumber = TextEditingController();
  final email = TextEditingController();
  final firstName = TextEditingController();
  final middleName = TextEditingController();
  final lastName = TextEditingController();
  final gender = TextEditingController();
  final education = TextEditingController();
  final dob = TextEditingController();
  final farmSize = TextEditingController();

  void updateUserModel(UserModel userModel) {
    userModel.countryCode = countryCode.text;
    userModel.secondaryNumber = secondaryNumber.text;
    userModel.email = email.text;
    userModel.firstName = firstName.text;
    userModel.middleName = middleName.text;
    userModel.lastName = lastName.text;
    userModel.gender = gender.text;
    userModel.education = education.text;
    userModel.farmSize = farmSize.text;
    userModel.dob = dob.text;
  }

  UserModel? user = StoreHelper.store.user;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCode.text = widget.user.countryCode;
    email.text = widget.user.email;
    firstName.text = widget.user.firstName;
    middleName.text = widget.user.middleName;
    lastName.text = widget.user.lastName;
    gender.text = widget.user.gender;
    education.text = widget.user.education;
    farmSize.text = widget.user.farmSize;
    dob.text = widget.user.dob;
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBarDesigns.getAppTitleOnly(AppStrings.profile),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetHelper.getCircularAvatar(
              user!.image,
            ).h(100).w(100).centered().pOnly(top: 50),
            20.heightBox,
            CustomInputField(
              textEditingController: countryCode,
              hint: AppStrings.enterCountryCode,
              label: AppStrings.mobileNumber,
            ),
            10.heightBox,

            //Enter Email
            CustomInputField(
              textEditingController: email,
              hint: AppStrings.enterEmail,
              label: AppStrings.email,
            ),
            10.heightBox,

            //First and Middle Name

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInputField(
                  textEditingController: firstName,
                  hint: AppStrings.enterFirstName,
                  label: AppStrings.firstName,
                ).wPCT(context: context, widthPCT: 40),
                CustomInputField(
                  hint: AppStrings.enterMiddleName,
                  textEditingController: middleName,
                  label: AppStrings.middleName,
                ).wPCT(context: context, widthPCT: 40),
              ],
            ),

            10.heightBox,

            //Last Name
            CustomInputField(
              hint: AppStrings.enterLastName,
              textEditingController: lastName,
              label: AppStrings.lastName,
            ),
            10.heightBox,

            //Gender
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                color: primaryColor,
                textKey: AppStrings.gender,
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioListTile(
                  title:
                      Text(AppStrings.male), //how to pass translationenum here
                  onChanged: (value) {
                    if (value == true) {
                      value = false;
                    }
                  },
                  value: true,
                  activeColor: primaryColor,
                  groupValue: null,
                ).w40(context),
                RadioListTile(
                  title: Text(AppStrings.female),
                  onChanged: (value) {
                    if (value == true) {
                      value = true;
                    }
                  },
                  value: true,
                  activeColor: primaryColor,
                  groupValue: null,
                ).w40(context),
              ],
            ),
            10.heightBox,

            10.heightBox,

            //Add Farm
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                color: primaryColor,
                textKey: AppStrings.stateName,
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
            ),
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: croplist.length,
            //     itemBuilder: (context, index) {
            //       var l1 = croplist[index];
            //       return CardHelper.cropCard(
            //         context,
            //         true, //disable edit icon
            //         l1[0],
            //         l1[1],
            //       );
            //     },
            //   ),
            // ),

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
                  true, //enable edit
                  StoreHelper.store.farmItem[index].title,
                  StoreHelper.store.farmItem[index].subtitle,
                );
              },
            ).h20(context),

            //Done Button
            CustomButtonElevated(
              onTap: () {
                setState(() {
                  updateUserModel(user!);
                });
                Navigator.pop(context);
              },
              text: AppStrings.done,
            ),
          ],
        ).pSymmetric(h: 20).pOnly(bottom: 100),
      ),
    );
  }
}
