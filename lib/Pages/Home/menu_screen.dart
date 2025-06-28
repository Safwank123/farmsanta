
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/Home/home.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/style_helper.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart' show AppColors;
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../SupportPlace/CropAdvisory/crop_advisory.dart';
import '../SupportPlace/CropCalender/crop_calender_home.dart';
import '../SupportPlace/FarmTalk/farm_talk.dart';
import '../SupportPlace/FertilizerCalculator/fertilizer_calculator.dart';
import '../SupportPlace/Market/market.dart';
import '../SupportPlace/MyQueries/my_queries.dart';
import '../SupportPlace/NutriSource/nutri_source.dart';
import '../SupportPlace/POP/pop.dart';
import '../base_screen.dart';

class MenuScreen extends BaseScreen {
  const MenuScreen({super.key});

  @override
  BaseScreenState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends BaseScreenState<MenuScreen> {
  List<String> drawerTitle = [
    AppStrings.home,
    AppStrings.myQueries,
    AppStrings.farmTalk,
    AppStrings.cropCalendar,
    AppStrings.advisory,
    AppStrings.pop,
    AppStrings.marketAnalysis,
    AppStrings.fertilizerCalculator,
    AppStrings.nutrisourceCatalouge,
    AppStrings.invite,
    AppStrings.language,
  ];
  List<String> navigationString = [
    HomeScreen.routeName,
    MyQueriesScreen.routeName,
    FarmTalk.routeName,
    CropCalenderScreen.routeName,
    CropAdvisoryScreen.routeName,
    PopScreen.routeName,
    MarketScreen.routeName,
    FertilizerCalculator.routeName,
    NutriSourceScreen.routeName,
    //Navigate to Invite & Language
    HomeScreen.routeName, HomeScreen.routeName,
  ];

  List<String> iconImageString = [
    'assets/images/icons/ic_home_new.png',
    'assets/images/icons/ic_my_queries_1.png',
    'assets/images/icons/ic_farm_talk_new.png',
    'assets/images/icons/ic_crop_calendar_new.png',
    'assets/images/icons/ic_advisory_green_new.png',
    'assets/images/icons/ic_pop_white_new.png',
    'assets/images/icons/ic_market_analysis_new.png',
    'assets/images/icons/ic_calculate_fertilizer.png',
    'assets/images/icons/menu_nutrisource.png',
    'assets/images/icons/ic_invite.png',
    'assets/images/icons/ic_language.png',
    '',
    'assets/images/icons/ic_about_us.png',
    'assets/images/icons/ic_logout_menu.png',
  ];

  int selectedIndex = 0;

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.background,
                  ).pOnly(bottom: 10),
                  CustomText(
                    //User's Name
                    textKey: "Nitin Sahu",
                    color: AppColors.background,
                    style: AppTextStyle.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: drawerTitle.length + 3,
                itemBuilder: (context, index) {
                  if (index < 11) {
                    return ListTile(
                      leading: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              iconImageString[index],
                              fit: BoxFit.fill,
                              width: 25,
                              color: selectedIndex == index
                                  ? AppColors.primary
                                  : AppColors.background,
                            ),
                            10.widthBox,
                            CustomText(
                              textKey: drawerTitle[index],
                              color: selectedIndex == index
                                  ? AppColors.primary
                                  : AppColors.background,
                              style: AppTextStyle.bodyMedium,
                            ),
                          ],
                        )
                            .pSymmetric(h: 15, v: 5)
                            .color(
                              selectedIndex == index
                                  ? AppColors.background
                                  : AppColors.primary,
                            )
                            .cornerRadius(25)
                            .onInkTap(
                          () {
                            setState(() {
                              selectedIndex = index;
                            });
                            if (selectedIndex != 0) {
                              navigateToPageWithoutReplaceMentNamed(
                                  navigationString[selectedIndex]);
                              ZoomDrawer.of(context)!.close();
                              setState(() {
                                selectedIndex = 0;
                              });
                            } else {
                              ZoomDrawer.of(context)!.close();
                            }
                          },
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    );
                  } else if (index == 11) {
                    return Divider(
                      color: AppColors.background,
                      thickness: 1.5,
                    ).pOnly(right: width * 0.4);
                  } else if (index == 12) {
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            iconImageString[index],
                            fit: BoxFit.fill,
                            width: 25,
                            color: selectedIndex == index
                                ? AppColors.primary
                                : AppColors.background,
                          ),
                          10.widthBox,
                          CustomText(
                            textKey: AppStrings.about,
                            color: selectedIndex == index
                                ? AppColors.primary
                                : AppColors.background,
                            style: AppTextStyle.bodyMedium,
                          ),
                        ],
                      )
                          .pSymmetric(h: 15, v: 5)
                          .color(
                            selectedIndex == index
                                ? AppColors.background
                                : AppColors.primary,
                          )
                          .cornerRadius(25)
                          .onInkTap(
                        () {
                          setState(
                            () {
                              selectedIndex = index;
                            },
                          );
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    );
                  } else if (index == 13) {
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            iconImageString[index],
                            fit: BoxFit.fill,
                            width: 25,
                          ),
                          10.widthBox,
                          CustomText(
                            textKey: AppStrings.logout,
                            color: selectedIndex == index
                                ? AppColors.primary
                                : AppColors.background,
                            style: AppTextStyle.bodyMedium,
                          ),
                        ],
                      )
                          .pSymmetric(h: 15, v: 5)
                          .color(
                            selectedIndex == index
                                ? AppColors.background
                                : AppColors.primary,
                          )
                          .cornerRadius(25)
                          .onInkTap(() {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                    );
                  }
                  return null;
                },
              ),
            ),
          ],
        ).pOnly(top: 40, left: 20, bottom: 30),
      ),
    );
  }
}
