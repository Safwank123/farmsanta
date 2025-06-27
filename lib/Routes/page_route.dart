
import 'package:farmsanta_new/Pages/Home/drawer_screen.dart';
import 'package:farmsanta_new/Pages/Start/PreLogin/login.dart';
import 'package:farmsanta_new/Pages/Start/PreLogin/otp_screen.dart';
import 'package:farmsanta_new/Pages/Start/PreLogin/selectLocationLang.dart';
import 'package:farmsanta_new/Pages/Start/Signup/add_crop.dart';
import 'package:farmsanta_new/Pages/Start/Signup/add_farm.dart';
import 'package:farmsanta_new/Pages/Start/Signup/farm_base.dart';
import 'package:farmsanta_new/Pages/Start/Signup/farm_draw.dart';
import 'package:farmsanta_new/Pages/Start/Signup/signup.dart';
import 'package:farmsanta_new/Pages/Start/onboarding.dart';
import 'package:farmsanta_new/Pages/SupportPlace/CropAdvisory/add_filter_screen.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Weather/weather_home.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:flutter/material.dart';

import '../Pages/Category/category.dart';
import '../Pages/Home/home.dart';
import '../Pages/Profile/edit_profile.dart';
import '../Pages/Profile/profile.dart';
import '../Pages/Start/splash.dart';
import '../Pages/SupportPlace/CropAdvisory/crop_advisory.dart';
import '../Pages/SupportPlace/CropCalender/add_crop_calender.dart';
import '../Pages/SupportPlace/CropCalender/crop_calender_home.dart';
import '../Pages/SupportPlace/FarmTalk/farm_talk.dart';
import '../Pages/SupportPlace/FarmTalk/farm_talk_my_posts.dart';
import '../Pages/SupportPlace/FertilizerCalculator/fertilizer_calculator.dart';
import '../Pages/SupportPlace/Market/market.dart';
import '../Pages/SupportPlace/MyCrops/Diseases/crop_diseases.dart';
import '../Pages/SupportPlace/MyCrops/my_crops.dart';
import '../Pages/SupportPlace/MyQueries/my_queries.dart';
import '../Pages/SupportPlace/NutriSource/nutri_source.dart';
import '../Pages/SupportPlace/POP/pop.dart';
import '../Pages/SupportPlace/POP/pop_saved.dart';

Map<String, WidgetBuilder> routes = {
  //Start Screens
  SplashScreen.routeName: (context) => const SplashScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),

  // Registration
  SelectLocationLang.routeName: (context) => const SelectLocationLang(),
  SignupScreen.routeName: (context) =>  SignupScreen(),
  FarmScreen.routeName: (context) => const FarmScreen(),
  FarmDrawScreen.routeName: (context) => const FarmDrawScreen(),
  AddFarmLocation.routeName: (context) => const AddFarmLocation(),
  AddCropScreen.routeName: (context) => const AddCropScreen(),

  // Login
  LoginScreen.routeName: (context) => LoginScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),

  //home
  DrawerScreen.routeName: (context) => DrawerScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),

  //CropCalender
  CropCalenderScreen.routeName: (context) => CropCalenderScreen(
        stageModelList: [StoreHelper.store.stageCalender],
        calenderModelList: StoreHelper.store.cropCalender,
      ),

  //Advisory
  AddFilterScreen.routeName: (context) => const AddFilterScreen(),
  //CropAdvisoryDetailScreen.routeName:(context) =>   CropAdvisoryDetailScreen(model: ),
  CropAdvisoryScreen.routeName: (context) => const CropAdvisoryScreen(),

  //Crop Calender
  AddCropCalender.routeName: (context) => const AddCropCalender(),
  CropCalenderScreen.routeName: (context) => const CropCalenderScreen(
        calenderModelList: [],
        stageModelList: [],
      ),
  //CropCalenderStageScreen.routeName: (context) => const CropCalenderStageScreen(stageId: 1, calenderStageModel: ,),

  //MyCrops
  MyCrops.routeName: (context) => const MyCrops(),

  //Disease
  CropDiseasesPage.routeName: (context) => const CropDiseasesPage(),
  //DiseaseDetails.routeName: (context) => const DiseaseDetails(disease:  ,),

  //Farm Talk
  //CreateNewPost.routeName: (context) => const CreateNewPost(message: null,),
  MyPosts.routeName: (context) => const MyPosts(),
  //FarmTalkProfilePage.routeName: (context) => const FarmTalkProfilePage(message: , username: '',),
  FarmTalk.routeName: (context) => const FarmTalk(),
  //FarmTalkExploreDetailsScreen.routeName: (context) => const FarmTalkExploreDetailsScreen(),
  //FarmTalkExploreScreen.routeName: (context) => const FarmTalkExploreScreen(message: null,),
  //FarmTalkHomeScreen.routeName: (context) => const FarmTalkHomeScreen(message: null,),

  //Fertilizer Calculator
  FertilizerCalculator.routeName: (context) => const FertilizerCalculator(),

  //Market
  MarketScreen.routeName: (context) => const MarketScreen(),

  //myqueries
  MyQueriesScreen.routeName: (context) => const MyQueriesScreen(),
  // PendingScreen.routeName: (context) => PendingScreen(),
  // SolvedScreen.routeName: (context) => SolvedScreen(),

  //PoP
  PopScreen.routeName: (context) => const PopScreen(),
  SavedPopScreen.routeName: (context) => const SavedPopScreen(),
  //PopDetailScreen.routeName: (context) =>   PopDetailScreen(model: null,),
  //PopCardScreen.routeName: (context) => const PopCardScreen(model: null,),

  //NutriSource
  NutriSourceScreen.routeName: (context) => const NutriSourceScreen(),

  //Weather
  WeatherHomeScreen.routeName: (context) => const WeatherHomeScreen(),

  //Product-page
  ProductPage.routeName: (context) => ProductPage(
        storeList: [],
      ),

  //Edit Profile
  EditProfile.routeName: (context) => EditProfile(
        user: StoreHelper.store.user!,
      ),

  //Profile Screen
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
