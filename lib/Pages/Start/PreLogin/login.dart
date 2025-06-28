import 'package:country_code_picker/country_code_picker.dart';
import 'package:farmsanta_new/Constants/colors.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/Start/PreLogin/otp_screen.dart';
import 'package:farmsanta_new/Pages/Start/Signup/signup.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text_string.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_button.dart';
import '../../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../base_screen.dart';

class LoginScreen extends BaseScreen {
  static String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  BaseScreenState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseScreenState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileNumber = TextEditingController();
  String countryCode = "+237"; // Default fallback

  @override
  void initState() {
    super.initState();

    // Safely access selectedCountry
    final selectedCountry = StoreHelper.store.selectedCountry;
    if (selectedCountry != null) {
      countryCode = "+${selectedCountry.phoneCode}";
    } else {
      debugPrint("⚠️ selectedCountry or phoneCode is null. Using default +237.");
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeColors.getColor(AppThemeColorsEnum.white),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(ImageRoutes.loginBackground),
            Column(
              children: [
                CustomText(textKey: AppStrings.welcome),
                Form(
                  key: _formKey,
                  child: CustomInputField(
                    errorMessage: AppStrings.must10,
                    hint: AppStrings.enterNumber,
                    textEditingController: mobileNumber,
                    isMobileNumber: true,
                    fillColor:
                        AppThemeColors.getColor(AppThemeColorsEnum.gray200),
                    prefixWidget: CountryCodePicker(
                      initialSelection: countryCode,
                      onChanged: (value) {
                        countryCode = value.dialCode ?? "+237";
                      },
                      flagWidth: 18,
                      showDropDownButton: true,
                      padding: const EdgeInsetsDirectional.all(0),
                    ),
                  ).wFull(context),
                ),
                20.heightBox,
                CustomButtonElevated(
                  text: AppStrings.getStarted,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      StoreHelper.store.phoneNumber =
                          "$countryCode${mobileNumber.text}";
                      navigateToPageWithoutReplaceMentNamed(OtpScreen.routeName);
                    }
                  },
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      textKey: AppStrings.newUser,
                      size: 12,
                    ),
                    CustomTextString(text: " ? "),
                    CustomText(
                      textKey: AppStrings.signup,
                      size: 12,
                      color: primaryColor,
                      underLine: true,
                    ).onInkTap(() {
                      navigateToPageWithoutReplaceMentNamed(SignupScreen.routeName);
                    })
                  ],
                ),
                15.heightBox,
                CustomText(
                  textKey: AppStrings.byClickingTerms,
                  size: 10,
                  textAlign: TextAlign.center,
                ),
                15.heightBox,
                CustomText(
                  textKey: AppStrings.termsAndConditions,
                  size: 12,
                  color: primaryColor,
                  underLine: true,
                )
              ],
            ).p20(),
            Expanded(child: Image.asset(ImageRoutes.loginBottom)),
          ],
        ).wFull(context).hFull(context).scrollVertical(),
      ),
    );
  }
}
