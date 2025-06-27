
import 'package:farmsanta_new/Controller/master_controller.dart';
import 'package:farmsanta_new/Core/shared_pref.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Models/Farmer/Farmer.dart';
import 'package:farmsanta_new/Models/User/user.dart';
import 'package:farmsanta_new/Pages/Home/drawer_screen.dart';
import 'package:farmsanta_new/Pages/Start/Signup/signup.dart' hide Farmer;
import 'package:farmsanta_new/Pages/Start/onboarding.dart';
import 'package:farmsanta_new/Services/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Services/store_helper.dart';
import '../base_screen.dart';

class SplashScreen extends BaseScreen {
  static String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);
  @override
  BaseScreenState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends BaseScreenState<SplashScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [],
    ).wFull(context).hFull(context));
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    print("called start timer");
    await MasterController.getTerritoriesList();
    await MasterController.getLanguages();
    bool loggedIn = SharedPref.getBoolean(SharedPrefKeys.userLoggedIn);
    if (loggedIn) {
      var farmer =
          SharedPref.getModelData(SharedPrefKeys.farmerDetails, Farmer.fromMap);
      StoreHelper.store
        ..user = SharedPref.getModelData(
            SharedPrefKeys.userDetails, UserModel.fromMap)
        ..farmerMainModel = farmer;
      SharedHelper.authToken =
          SharedPref.getString(SharedPrefKeys.authTokenKey);
      var status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.bestForNavigation)
            .then((value) => StoreHelper.store.position = value);
      }

      if (farmer != null) {
        navigateToPageReplaceMentNamed(DrawerScreen.routeName);
      } else {
        navigateToPageReplaceMentNamed(SignupScreen.routeName);
      }
    } else {
      navigateToPageReplaceMentNamed(OnboardingScreen.routeName);
    }
  }
}
