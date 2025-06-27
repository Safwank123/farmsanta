// ignore_for_file: empty_catches

import 'dart:async';


import 'package:farmsanta_new/Constants/padding.dart';
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Controller/market_service_controller.dart';
import 'package:farmsanta_new/Controller/master_controller.dart';
import 'package:farmsanta_new/Controller/message_service.dart';
import 'package:farmsanta_new/Controller/pop_controller.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Functions/logic_funtions.dart';
import 'package:farmsanta_new/Pages/SupportPlace/MyCrops/my_crops.dart';
import 'package:farmsanta_new/Pages/SupportPlace/POP/pop_details.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Weather/weather_home.dart';
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/Routes/image_routes.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/mututations/common.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import '../../Controller/farmer-controller.dart';
import '../../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../../Models/SupportPlace/Disease/Disease.dart';
import '../../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../../Models/message/message.dart';
import '../../Widgets/classes/card_helper.dart';
import '../../Widgets/classes/style_helper.dart';
import '../SupportPlace/CropAdvisory/crop_advisory.dart';
import '../SupportPlace/CropAdvisory/crop_advisory_details.dart';
import '../SupportPlace/CropCalender/crop_calender_home.dart';
import '../SupportPlace/FarmTalk/farm_talk.dart';
import '../SupportPlace/Market/market.dart';
import '../SupportPlace/MyCrops/Diseases/crop_diseases.dart';
import '../SupportPlace/MyCrops/Diseases/disease_details.dart';
import '../SupportPlace/MyQueries/DetailScreens/pending_query.dart';
import '../SupportPlace/MyQueries/DetailScreens/solved_query.dart';
import '../SupportPlace/MyQueries/my_queries.dart';
import '../SupportPlace/NutriSource/nutri_source.dart';
import '../SupportPlace/POP/pop.dart';

class FarmSupportPlace extends BaseScreen {
  const FarmSupportPlace({super.key});

  @override
  BaseScreenState<FarmSupportPlace> createState() => _FarmSupportPlaceState();
}

class _FarmSupportPlaceState extends BaseScreenState<FarmSupportPlace> {
  int selectedIndex = -1;
  String selectedCrop = "";

  String? todaysDate = DateFormat('dd MMM, yyyy').format(DateTime.now());
  String? currentTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget buildWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          farmSupportActivities(),

          //weather card
          // VxBuilder(
          //     builder: (context, store, status) {
          //       if (StoreHelper.store.weatherData != null) {
          //         return weatherCard();
          //       }

          //       return const SizedBox();
          //     },
          //     mutations: const {UpdateWeatherSection}),

          vDefaultPadding.heightBox,
          ...[],

          // Latest Crop Advisories
          WidgetHelper.getRowIcon(AppStrings.latestCropAdvisories,
              trailingText: AppStrings.viewmore,
              color: getColor(AppThemeColorsEnum.subHeading), onClick: () {
            navigateToPageWithoutReplaceMent(const CropAdvisoryScreen());
          }).pSymmetric(h: hDefaultPadding, v: vDefaultPadding),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    StoreHelper.store.cropAdvisoriesList.length, (index) {
              return cropAdvisoriesCardList(
                      StoreHelper.store.cropAdvisoriesList[index])
                  .p4();
            })).pSymmetric(h: hDefaultPadding),
          ),
          10.heightBox,

          //PoP Card List
          WidgetHelper.getRowIcon(AppStrings.pop,
              trailingText: AppStrings.viewmore,
              color: getColor(AppThemeColorsEnum.subHeading), onClick: () {
            navigateToPageWithoutReplaceMent(const PopScreen());
          }).pSymmetric(h: hDefaultPadding, v: vDefaultPadding),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children:
                    List.generate(StoreHelper.store.popList.length, (index) {
              return popCardList(StoreHelper.store.popList[index]).p4();
            })).pSymmetric(h: hDefaultPadding),
          ),

          10.heightBox,

          //Market Analysis
          Column(
            children: [
              // WidgetHelper.getRowIcon(AppStrings.marketAnalysis,
              //     trailingText: AppStrings.viewAll,
              //     iconData: Icons.arrow_forward_rounded,
              //     color: getColor(AppThemeColorsEnum.primary),
              //     onClick: () {}),

              Container(
                color: getColor(AppThemeColorsEnum.white),
                child: Stack(children: [
                  CustomText(
                    textKey: "No Market: Data",
                    color: AppColors.primary,
                  ).centered(),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CustomText(
                      textKey: "INR / 0kg",
                      color: AppColors.white,
                      size: 10,
                    ).p4().box.make().color(AppColors.primary).cornerRadius(30),
                  )
                ]).h(100).w(width * 0.95),

                // const ProductRateChart()
              ),

              CustomText(
                textKey: AppStrings.viewmore,
                color: AppColors.white,
                size: 10,
              )
                  .pSymmetric(h: 34, v: 8)
                  .box
                  .make()
                  .color(AppColors.primary)
                  .cornerRadius(30)
                  .p8()
                  .onTap(() {
                navigateToPageWithoutReplaceMent(const MarketScreen());
              }),
            ],
          )
              .pSymmetric(h: hDefaultPadding)
              .box
              .make()
              .color(AppColors.grayLight)
              .cornerRadius(10),
          10.heightBox,

          // Farmer Queries
          WidgetHelper.getRowIcon(AppStrings.nearbyRelatedFarmerQueries,
              trailingText: "",
              iconData: Icons.arrow_forward_rounded,
              color: getColor(AppThemeColorsEnum.primary), onClick: () {
            navigateToPageWithoutReplaceMent(const MyQueriesScreen());
          }).pSymmetric(h: hDefaultPadding, v: vDefaultPadding),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
                    StoreHelper.store.farmScoutingList.length, (index) {
              return myQueriesCard(
                      StoreHelper.store.farmScoutingList[index], true)
                  .p4();
            })),
          ),

          10.heightBox,

          // Disease and insects cards list
          WidgetHelper.getRowIcon(AppStrings.diseasesandInsectsinCrops,
              iconData: Icons.arrow_forward_rounded,
              color: getColor(AppThemeColorsEnum.primary), onClick: () {
            StoreHelper.store.selectedCropUuidForDiseaseFromMyCrops =
                selectedCrop;
            navigateToPageWithoutReplaceMent(const CropDiseasesPage());
          }).pSymmetric(h: hDefaultPadding, v: vDefaultPadding),

          VxBuilder(
              builder: (context, store, status) {
                var diseaseList = selectedCrop != ""
                    ? StoreHelper.store.diseasesList.where((element) {
                        return element.crops.contains(selectedCrop);
                      }).toList()
                    : StoreHelper.store.diseasesList;
                print(
                    "list length is ${diseaseList.length} ${StoreHelper.store.cropNameList.length} ${StoreHelper.store.cropImageList.length}");
                return Column(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: StoreHelper.store.cropNameList.length,
                      itemBuilder: (BuildContext context, int index) {
                        bool isSelected = selectedIndex == index;
                        return choiceChipWithImage(
                                StoreHelper.store.cropImageList,
                                StoreHelper.store.cropNameList,
                                index,
                                isSelected)
                            .pSymmetric(h: 5);
                      },
                    ).hPCT(context: context, heightPCT: 5),

                    ListView.builder(
                      itemCount: diseaseList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return diseaseCardList(diseaseList[index]).p4().h(150);
                      },
                    ).h(200)
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //       children: List.generate(diseaseList.length, (index) {
                    //     print("calling index ${index}");
                    //     return diseaseCardList(diseaseList[index]).p4();
                    //   })).pSymmetric(h: hDefaultPadding),
                    // ),
                  ],
                );
              },
              mutations: const {UpdateDiseaseListSection})
        ],
      ),
    );
  }

  Widget farmSupportActivities() {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomText(
          //   textKey: AppStrings.farmSupportActivities,
          //   size: 12,
          //   color: getColor(AppThemeColorsEnum.subHeading),
          // ),
          vDefaultPadding.heightBox,
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              activityCard(context!,
                  imagePath: ImageRoutes.myCrops,
                  title: AppStrings.myCrops, onTap: () {
                navigateToPageWithoutReplaceMent(const MyCrops());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.myQueries,
                  title: AppStrings.myQueries, onTap: () {
                navigateToPageWithoutReplaceMent(const MyQueriesScreen());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.farmTalks,
                  title: AppStrings.farmTalks, onTap: () {
                navigateToPageWithoutReplaceMent(const FarmTalk());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.pop, title: AppStrings.pop, onTap: () {
                navigateToPageWithoutReplaceMent(const PopScreen());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.cropAdvisory,
                  title: AppStrings.cropAdvisory, onTap: () {
                navigateToPageWithoutReplaceMent(const CropAdvisoryScreen());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.nutrisource,
                  title: AppStrings.nutrisource, onTap: () {
                navigateToPageWithoutReplaceMent(const NutriSourceScreen());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.market,
                  title: AppStrings.market, onTap: () {
                navigateToPageWithoutReplaceMent(const MarketScreen());
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.cropCalendar,
                  title: AppStrings.cropCalendar, onTap: () {
                navigateToPageWithoutReplaceMent(CropCalenderScreen(
                  stageModelList: [StoreHelper.store.stageCalender],
                  calenderModelList: StoreHelper.store.cropCalender,
                ));
              }),
              activityCard(context!,
                  imagePath: ImageRoutes.myCrops,
                  title: AppStrings.fertilizerCalculator,
                  onTap: () {}),
            ],
          ),
        ],
      ),
    ).cornerRadius(20).p8();
  }

  Widget weatherCard() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xff2187F0), Color(0xff3EA7F3), Color(0xff5BC7F7)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [getBoxShadow()]),
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Location and Date
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WidgetHelper.getIconText(
                        '${StoreHelper.store.weatherData!.weatherDetails!.location!.name}, ${StoreHelper.store.weatherData!.weatherDetails!.location!.country}'
                            .toString(),
                        Icons.location_on_rounded,
                        onTap: () {},
                        color: AppThemeColors.getSingleColor(
                            AppThemeColorsEnum.white),
                        iconColor: AppThemeColors.getSingleColor(
                            AppThemeColorsEnum.white)),
                    CustomText(
                      textKey: todaysDate.toString(),
                      style: WidgetHelper.getTextStyle(
                          false,
                          16,
                          AppThemeColors.getSingleColor(
                              AppThemeColorsEnum.white)),
                    )
                  ],
                ).py4(),
              ),

              vDefaultPadding.heightBox,

              //temperature
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.current!.weather![0].icon}.png",
                        width: 70,
                      ),
                      CustomText(
                        textKey: StoreHelper.store.weatherData!.weatherDetails!
                            .current!.weather![0].description
                            .toString(),
                        style: AppTextStyle.labelMedium,
                        color: AppColors.background,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CustomText(
                        textKey:
                            "${StoreHelper.store.weatherData!.weatherDetails!.current!.temp} °C",
                        style: AppTextStyle.headlineMedium,
                        color: AppColors.background,
                      ),
                      CustomText(
                        textKey: currentTime.toString(),
                        style: AppTextStyle.bodySmall,
                        color: AppColors.background,
                      ),
                      10.heightBox
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetHelper.getIconText(
                          "${StoreHelper.store.weatherData!.weatherDetails!.current!.windSpeed} Km/h",
                          Icons.air,
                          onTap: () {},
                          textStyle: AppTextStyle.labelSmall,
                          color: AppColors.background,
                          iconColor: AppColors.background),
                      WidgetHelper.getIconText(
                          "${StoreHelper.store.weatherData!.weatherDetails!.current!.humidity!.floor()} %",
                          Icons.water_drop_outlined,
                          onTap: () {},
                          textStyle: AppTextStyle.labelSmall,
                          color: AppThemeColors.getSingleColor(
                              AppThemeColorsEnum.white),
                          iconColor: AppThemeColors.getSingleColor(
                              AppThemeColorsEnum.white)),
                      WidgetHelper.getIconText(
                          getDirection(StoreHelper.store.weatherData!
                              .weatherDetails!.current!.windDeg!),
                          Icons.directions,
                          onTap: () {},
                          textStyle: AppTextStyle.labelSmall,
                          color: AppThemeColors.getSingleColor(
                              AppThemeColorsEnum.white),
                          iconColor: AppThemeColors.getSingleColor(
                              AppThemeColorsEnum.white)),
                    ],
                  )
                ],
              ),
              10.heightBox,
              //Morning to Night Report
              Container(
                padding: const EdgeInsets.all(5),
                width: width,
                decoration: getBoxDecorationAll(5, Colors.blue),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          whetherData(
                              AppStrings.morning,
                              "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![0].weather![0].icon}.png",
                              '${StoreHelper.store.weatherData!.weatherDetails!.daily![0].temp!.morn} °C'),
                          whetherData(
                              AppStrings.afternoon,
                              "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![0].weather![0].icon}.png",
                              '${StoreHelper.store.weatherData!.weatherDetails!.daily![0].temp!.day} °C'),
                          whetherData(
                              AppStrings.evening,
                              "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![0].weather![0].icon}.png",
                              '${StoreHelper.store.weatherData!.weatherDetails!.daily![0].temp!.eve} °C'),
                          whetherData(
                              AppStrings.night,
                              "assets/images/weather/ic_${StoreHelper.store.weatherData!.weatherDetails!.daily![0].weather![0].icon}.png",
                              '${StoreHelper.store.weatherData!.weatherDetails!.daily![0].temp!.night} °C'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //ViewMore
              GestureDetector(
                onTap: () {
                  navigateToPageWithoutReplaceMentNamed(
                      WeatherHomeScreen.routeName);
                },
                child: Center(
                  child: CustomText(
                    textKey: AppStrings.viewmore,
                    style: AppTextStyle.titleMedium,
                    color: AppColors.background,
                  ),
                ),
              ).pOnly(top: 10),
            ],
          )),
    ).wFull(context!).p(15).glassMorphic();
  }

  //Wether Card Widgets
  Widget whetherData(String text, String image, String temperature) {
    return Column(children: [
      CustomText(
        textKey: text,
        style: WidgetHelper.getTextStyle(
            false, 12, AppThemeColors.getColor(AppThemeColorsEnum.white)),
      ),
      Image.asset(
        image,
        width: 35,
      ),
      CustomText(
        textKey: temperature,
        style: WidgetHelper.getTextStyle(
            true, 12, AppThemeColors.getColor(AppThemeColorsEnum.white)),
      ),
    ]);
  }

  bool loaded = false;
  int count = 0;
  late ProgressDialog dialog;

  @override
  getLocalData() async {
    //TODO fetch local database
    getData();
  }

  @override
  getData() async {
    // dialog = ProgressDialog(context: context);
    // dialog.show(msg: "Loading");
    //getting location
    getLocation();

    //getting crops
    var list = await MasterController.getAllCrops() ?? [];

    List<String> names = [];
    List<String> images = [];
    for (var ele in list) {
      {
        try {
          names.add(ele.cropName ?? "");
          try {
            images.add(getImagePath(ele.photos?.first.fileName ?? ""));
          } catch (e) {
            images.add("");
          }
        } catch (e) {}
      }
    }
    StoreHelper.store
      ..cropList = list
      ..cropNameList = names
      ..cropImageList = images;
    getData2();
  }

  getData2() async {
    //pop data
    getPopData();

    //fetch social messages
    // getSocialMessages();
    
    //fetching crop stages
    getCropStages();


    //fetching crop diseases
    getCropDisease();

    // //send firebase registration token to server
    // sendRegistrationToken();

    //get market price
    getMarketPrice();
  }

  setLoaded() {
    print("count is ${count}");
    if (count > 5) {
      // dialog.close();
      setState(() {
        loaded = true;
      });
    } else {
      count++;
    }
  }

  getLocation() async {
    var position = StoreHelper.store.position;
    if (position == null) {
      var status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);
        getWeatherData(
            position.latitude.toString(), position.longitude.toString());
        StoreHelper.store.position = position;
      }
    } else {
      getWeatherData(
          position.latitude.toString(), position.longitude.toString());
    }
  }

  getWeatherData(String lat, String long) async {
    StoreHelper.store.weatherData =
        await MasterController.getAllWeatherInfo(lat, long);
    setLoaded();
  }

  getPopData() async {
    var list = await POPController.getPopList() ?? [];

    StoreHelper.store.popList.addAll(list.map((e) {
      try {
        e.cropName = StoreHelper.getCropName(e.uuid!);
      } catch (e) {}
      return e;
    }));
    setLoaded();
  }

  getSocialMessages() async {
    List<Message> list = await MessageController.getPosts("") ?? [];

    StoreHelper.store.socialMessageList = list.map((e) {
      e.tags = e.tags.map((e) => e.replaceAll("#", "")).toList();
      return e;
    }).toList();
  }

  getCropStages() async {
    StoreHelper.store.cropStageList =
        await MasterController.getAllCropStages() ?? [];
    setLoaded();

    //fetching farm scouting
    getFarmScouting();

    //fetching crop advisories
    getCropAdvisories();

  }

  getCropAdvisories() async {
    var list = await MasterController.getCropAdvisories() ?? [];
    StoreHelper.store.cropAdvisoriesList = list.map((e) {
      e.cropName = StoreHelper.getCropName(e.crop);
      return e;
    }).toList();
    setLoaded();
  }

  getFarmScouting() async {
    var list = await FarmerController.getFarmScoutings(
            "", StoreHelper.store.farmerMainModel!.uuid!) ??
        [];

    List<FarmScouting> solved = [], pending = [];
    for (var element in list) {
      if (element.advisoryExist) {
        solved.add(element);
      } else {
        pending.add(element);
      }
    }

    StoreHelper.store
      ..farmScoutingList = list
      ..solvedFarmScoutingList = solved
      ..pendingFarmScoutingList = pending;

    setLoaded();
  }

  getCropDisease() async {
    var list = await MasterController.getAllCropDiseases() ?? [];
    list.sort((a, b) {
      return b.updatedTimestamp.compareTo(a.updatedTimestamp);
    });

    try {
      StoreHelper.store.diseasesList = list.map((e) {
        e.cultivarGroups = e.cultivarGroups.map((e) => e.trim()).toList();
        e.culturalMechanicalControl = e.culturalMechanicalControl?.trim();
        e.favourableConditions = e.favourableConditions.trim();
        e.localName = e.localName.trim();
        e.preventiveMeasures = e.preventiveMeasures?.trim();
        e.scientificName = e.scientificName.trim();
        e.symptomsOfAttack = e.symptomsOfAttack?.trim();
        return e;
      }).toList();
    } catch (e) {}

    setLoaded();
  }

  getMarketPrice() async {
    StoreHelper.store.priceListFarmSupport =
        await MarketServiceController.getPrice() ?? [];
    UpdateMarketPriceAppbar();
    setLoaded();
  }

  //TODO
  sendRegistrationToken() async {}

  //crop advisory card list widget
  Widget cropAdvisoriesCardList(CropAdvisoryModel model) {
    String formattedOrdered =
        DateFormat('dd Mon, yyyy').format(model.createdTimestamp);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(getImagePath(model.profileImage)),
                  radius: 10,
                  backgroundColor: AppColors.white,
                ),
                5.widthBox,
                CustomText(
                  textKey: model.firstName,
                  color: AppColors.gray,
                ),
              ],
            ),
            5.heightBox,
            Stack(
              children: [
                WidgetHelper().getCachedImage(
                  getImagePath(model.photos[0].fileName.toString()),
                  150,
                  130,
                  boxFit: BoxFit.fitHeight,
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: CustomText(
                    textKey: formattedOrdered,
                    style: AppTextStyle.labelLarge
                        .copyWith(color: AppColors.white),
                  )
                      .p2()
                      .onInkTap(() {})
                      .box
                      .make()
                      .color(Colors.black.withOpacity(0.4))
                      .cornerRadius(20)
                      .scale(scaleValue: 0.8, alignment: Alignment.bottomLeft),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.invert,
                    )
                        .iconSize(10)
                        .p4()
                        .box
                        .make()
                        .color(AppColors.white)
                        .cornerRadius(20))
              ],
            ).onTap(() {
              navigateToPageWithoutReplaceMent(const CropAdvisoryScreen());
            }),
            5.heightBox,
            CustomText(
              textKey: model.advisoryTagName,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        5.heightBox,
        CustomText(
          textKey: AppStrings.viewAdvisory,
          color: AppColors.white,
          size: 10,
        ).p8().box.make().color(AppColors.primary).cornerRadius(30).onTap(() {
          navigateToPageWithoutReplaceMent(CropAdvisoryDetailScreen(
            model: model,
          ));
        }),
      ],
    );
  }

  //Pop card list widget
  Widget popCardList(PoPModel model) {
    return Stack(
      children: [
        WidgetHelper().getCachedImage(
          getImagePath(model.photos![0].fileName.toString()),
          160,
          150,
          boxFit: BoxFit.fitHeight,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Row(
            children: [
              if (model.profileImage != null)
                CircleAvatar(
                    backgroundImage: NetworkImage(
                      getImagePath(model.profileImage ?? ""),
                    ),
                    radius: 10,
                    backgroundColor: AppColors.white),
              5.widthBox,
              CustomText(
                textKey: model.firstName ?? "",
                color: AppColors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.cropName!,
                  style:
                      AppTextStyle.labelLarge.copyWith(color: AppColors.white),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.invert,
              )
                  .iconSize(15)
                  .p4()
                  .box
                  .make()
                  .color(AppColors.white)
                  .cornerRadius(20)
            ],
          )
              .onInkTap(() {
                navigateToPageWithoutReplaceMent(PopDetailScreen(model: model));
              })
              .pOnly(top: 5, left: 10, bottom: 5, right: 5)
              .box
              .make()
              .color(Colors.black.withOpacity(0.4))
              .glassMorphic(blur: 2)
              .cornerRadius(20)
              .centered(),
        ),
      ],
    ).onTap(() {
      navigateToPageWithoutReplaceMent(const PopScreen());
    });
    ;
  }

  //Diseases card list widget
  Widget diseaseCardList(Disease model) {
    return Stack(
      children: [
        model.photos.isNotEmpty
            ? WidgetHelper().getCachedImage(
                getImagePath(model.photos[0].fileName.toString()),
                150,
                150,
                boxFit: BoxFit.fitHeight,
              )
            : SizedBox(
                height: 150,
                width: 150,
              ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.symptomsOfAttack ?? "",
                  style:
                      AppTextStyle.labelLarge.copyWith(color: AppColors.white),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.invert,
              )
                  .iconSize(15)
                  .p4()
                  .box
                  .make()
                  .color(AppColors.white)
                  .cornerRadius(20)
            ],
          )
              .onInkTap(() {})
              .pOnly(top: 5, left: 10, bottom: 5, right: 5)
              .box
              .make()
              .color(Colors.black.withOpacity(0.4))
              .glassMorphic(blur: 2)
              .cornerRadius(20)
              .centered(),
        )
      ],
    ).onTap(() {
      navigateToPageWithoutReplaceMent(DiseaseDetails(
        disease: model,
      ));
    });
  }

  //queries list widget
  Widget myQueriesCard(FarmScouting farmScoutingModel, bool isSolved) {
    // properties in map
    var propertyMap = {
      0: AppStrings.crop,
      1: AppStrings.growthStage,
      2: AppStrings.plantPartIssue,
    };

    // values in map
    var valueMap = {
      0: farmScoutingModel.cropName,
      1: farmScoutingModel.growthStage,
      2: farmScoutingModel.images[0].plantPart
    };

    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            // image
            WidgetHelper().getCachedImage(
                getImagePath(farmScoutingModel.images[0].image ?? ""), 80, 150),

            // date on top of image
            Positioned(
              bottom: 5,
              left: 5,
              child: CustomText(
                      textKey: DateFormat('d MMMM, y').format(
                          DateTime.parse(farmScoutingModel.createdTimestamp!)),
                      style: AppTextStyle.bodySmall
                          .copyWith(color: AppColors.white))
                  .pSymmetric(v: 5, h: 10)
                  .glassMorphic(blur: 4)
                  .box
                  .make()
                  .color(AppColors.invert.withOpacity(0.1))
                  .cornerRadius(15)
                  .centered(),
            )
          ],
        ),

        // some spacing
        5.heightBox,

        // property and value
        for (int i = 0; i < 3; i++)
          Column(
            children: [
              propertyValueWidget(
                  propertyColor: AppColors.gray,
                  property: propertyMap[i]!,
                  value: valueMap[i]!),
            ],
          ),

        // some spacing
        5.heightBox,

        //view Query Button
        CustomText(
          textKey: "View Query",
          color: AppColors.white,
        )
            .pSymmetric(h: 30, v: 4)
            .box
            .make()
            .color(AppColors.primary)
            .cornerRadius(20)
      ],
    )
        .pSymmetric(h: 5, v: 10)
        .box
        .make()
        .color(AppColors.grayLight)
        .onInkTap(() {
      if (isSolved) {
        navigateToPageWithoutReplaceMent(SolvedQuery(
          title: valueMap[0]!,
          advisoryDetails: StoreHelper.store.advisoryDetails!,
          advisoryTable: StoreHelper.store.advisoryTable!,
          farmScoutingModel: farmScoutingModel,
        ));
      } else {
        navigateToPageWithoutReplaceMent(PendingQuery(
          title: valueMap[0]!,
          farmScoutingModel: farmScoutingModel,
        ));
      }
    });
  }

// widget contain property and value in row
  Widget propertyValueWidget(
      {required String property,
      required String value,
      Color propertyColor = primaryColor,
      Color valueColor = primaryColor}) {
    return Row(
      children: [
        CustomText(
          textKey: '$property:',
          color: propertyColor,
        ),
        5.widthBox,
        CustomText(
          textKey: value,
          color: valueColor,
        ),
      ],
    );
  }

  //ChoiceChips of Crops with index
  Widget choiceChipWithImage(
      List images, List name, int index, bool isSelected) {
    return RawChip(
      avatar: WidgetHelper().getCachedImage(
        images[index],
        20,
        20,
        boxFit: BoxFit.fitHeight,
      ),
      showCheckmark: false,
      label: CustomText(
        textKey: name[index],
        style: AppTextStyle.labelLarge,
        color: isSelected ? AppColors.background : AppColors.primary,
      ),
      backgroundColor: AppColors.background,
      selectedColor: AppColors.primary,
      selected: selectedIndex == index,
      onSelected: (bool selected) {
        selectedIndex = index;
        selectedCrop = name[selectedIndex];
        UpdateDiseaseListSection();
      },
    );
  }
}

class LoadingModelFarmSupport {
  bool weatherLoaded = false;
  bool cropAdvisoryLoaded = false;
  bool diseaseLoaded = false;
}
