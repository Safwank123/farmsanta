// ignore_for_file: empty_catches

import 'dart:async';


import 'package:farmsanta_new/Constants/colors.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Controller/common_controller.dart';
import 'package:farmsanta_new/Core/shared_pref.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/Home/home.dart';
import 'package:farmsanta_new/Pages/Start/Signup/signup.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/api/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Controller/farmer-controller.dart';
import '../../../Widgets/Widgets/custom_button.dart';
import '../../../Widgets/Widgets/custom_text.dart';
import '../../../themeFiles/app_colors.dart';
import '../../base_screen.dart';

class OtpScreen extends BaseScreen {
  static String routeName = '/otp-screen';

  const OtpScreen({super.key});

  @override
  BaseScreenState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends BaseScreenState<OtpScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Image.asset(
            ImageRoutes.splashBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                AppBarDesigns.getBackButton(context).objectTopLeft(),
                CustomText(
                  textKey: AppStrings.enterSixDigitOTP,
                  style: Theme.of(context).textTheme.titleLarge,
                  bold: true,
                ).p8(),
                12.heightBox,
                WidgetHelper.getRichText(
                    context, "${AppStrings.sentOn} ", phoneNumber),
                10.heightBox,
                PinCodeTextField(
                  pinBoxWidth: 40,
                  pinBoxHeight: 40,
                  maxLength: 6,
                  maskCharacter: "*",
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinBoxColor: AppThemeColors.getColor(
                      AppThemeColorsEnum.textFieldBackground),
                  defaultBorderColor: AppThemeColors.getColor(
                      AppThemeColorsEnum.textFieldBackground),
                  hasTextBorderColor: AppThemeColors.getColor(
                      AppThemeColorsEnum.textFieldBackground),
                  pinBoxRadius: 5,
                  pinTextStyle: Theme.of(context).textTheme.titleMedium,
                  controller: controller,
                ),
                20.heightBox,
                CustomButtonElevated(
                  onTap: () {
                    // verifyOtpPre();
                    checkAndSend(true);
                  },
                  text: AppStrings.verify,
                ).w48(context).py8(),
                CustomText(
                  textKey: AppStrings.changeNumber,
                  size: 12,
                ).onInkTap(() {
                  Navigator.pop(context);
                }),
                15.heightBox,
                if (showResendOtp)
                  CustomText(
                    textKey: AppStrings.resendOTP,
                    size: 12,
                    color: primaryColor,
                  ).onInkTap(() {
                    controller.clear();
                    sendOtp();
                    time = 60;
                    showResendOtp = false;
                    startTimer();
                  })
                else
                  CustomText(
                    textKey: "${AppStrings.resendOTPin} $time",
                    size: 12,
                    color: primaryColor,
                  ),
              ])
              .color(Colors.white)
              .cornerRadius(15)
              .hThreeForth(context)
              .p(16)
              .centered(),
        ]),
      ),
    );
  }

  String phoneNumber = StoreHelper.store.phoneNumber;
  String otp = "";
  TextEditingController controller = TextEditingController();
  String phoneNumberWithoutPlus = "";
  String _verificationCode = "";
  bool isApiAuth = false;
  int time = 58;
  late Timer _timer;
  bool showResendOtp = false;
  @override
  void initState() {
    phoneNumberWithoutPlus = phoneNumber.replaceAll("+", "");
    super.initState();
    startTimer();
    sendOtp();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (time == 0) {
          _timer.cancel();
          setState(() {
            showResendOtp = true;
          });
        } else {
          time--;
          setState(() {});
        }
      },
    );
  }

  //function to send otp to customer mobile number
  Future<void> sendOtp() async {
    if (StoreHelper.store.selectedCountry!.territoryName == "Cameroon" &&
        phoneNumber.startsWith("+237")) {
      //cameroon otp
      isApiAuth = true;
      var otp2 = await CommonController.generateOtp(phoneNumberWithoutPlus);
      if (otp2 != "") {
        showToast("OTP - $otp2");
        otp = otp2;
      }
    } else {
      _verifyPhone();
    }
  }

  Future<void> _verifyPhone() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          var resp =
              await FirebaseAuth.instance.signInWithCredential(credential);
          if (resp.user != null) {
            checkAndSend(true);
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          showToast(AppStrings.verificationFailed);
        },
        codeAutoRetrievalTimeout: (verificationID) {},
        timeout: const Duration(seconds: 60),
        codeSent: (String verificationId, int? forceResendingToken) {
          _verificationCode = verificationId;
          showToast("Otp sent");
        },
      );
    } catch (e) {}
  }

  Future<void> verifyOtpPre() async {
    if (isApiAuth) {
      String text = controller.text;
      if (text.isEmptyOrNull || text.length != 6) {
        showToast("Please enter 6 digit otp sent to your mobile");
      } else if (text != otp) {
        showToast("Incorrect OTP");
      } else {
        checkAndSend(true);
      }
    } else {
      if (_verificationCode != "" &&
          controller.text.isNotEmptyAndNotNull &&
          controller.text.length == 6) {
        ProgressDialog dialog = ProgressDialog(context: context);
        dialog.show(msg: AppStrings.verifying);
        var data = await verifyOtp(controller.text);

        dialog.close();
        checkAndSend(data);
      } else {
        showToast("OTP not sent ,try again");
      }
    }
  }

  Future<bool> verifyOtp(String otpEntered) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: otpEntered));
      return true;
    } catch (e) {}
    return false;
  }

  Future<void> checkAndSend(bool data) async {
    if (data) {
      ProgressDialog dialog = ProgressDialog(context: context);
      dialog.show(msg: AppStrings.verifying);
      try {
        _timer.cancel();
      } catch (e) {}
      var data = await UserServiceApi.authenticate(
          {"userName": phoneNumberWithoutPlus, "password": "1234567"});
      if (data == 1) {
        var farmer = await FarmerController.getCurrentFarmer();
        if (farmer != null) {
          var farmer = await FarmerController.getCurrentFarmer();
          await SharedPref.setModelData(farmer, SharedPrefKeys.farmerDetails);
          StoreHelper.store.farmerMainModel = farmer;
          bool resp = await CommonController.subscribeToPush();
          await SharedPref.setBool(SharedPrefKeys.isTokenSent, resp);
          await SharedPref.setBool(SharedPrefKeys.isUserProfileCompleted, true);
          await SharedPref.setBool(SharedPrefKeys.userLoggedIn, true);
          dialog.close();
          navigateToPageReplaceMentNamed(HomeScreen.routeName);
        }
      } else if (data == 2) {
        dialog.close();
        navigateToPageReplaceMent( SignupScreen());
      } else {
        dialog.close();
        showToast("Some technical error");
      }
    } else {
      showToast(AppStrings.invalidOtp);
    }
  }

  @override
  void dispose() {
    try {
      _timer.cancel();
    } catch (e) {}
    super.dispose();
  }
}
