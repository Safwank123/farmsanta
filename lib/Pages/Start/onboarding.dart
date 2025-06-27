
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors;
import 'package:farmsanta_new/Routes/image_routes.dart' show ImageRoutes;
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import '../../Widgets/Widgets/custom_button.dart';
import '../../Widgets/Widgets/custom_text.dart';
import '../base_screen.dart';
import 'PreLogin/selectLocationLang.dart';

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem(this.title, this.description, this.image);
}

class OnboardingScreen extends BaseScreen {
  static String routeName = '/onboarding-screen';

  const OnboardingScreen({super.key});
  @override
  BaseScreenState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends BaseScreenState<OnboardingScreen> {
  int _currentIndex = 0;

  //list of all the onboarding items
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(AppStrings.farmTalk, AppStrings.connectWithFarmers,
        ImageRoutes.mascotIntroImage),
    OnboardingItem(AppStrings.exploreAmazingFeatures, AppStrings.getAnswers,
        ImageRoutes.mascotIntroImage),
    OnboardingItem(AppStrings.cropAdvisory, AppStrings.agriExpert,
        ImageRoutes.mascotIntroImage),
    OnboardingItem(AppStrings.packageOfPractice, AppStrings.empowerWithAgriTech,
        ImageRoutes.mascotIntroImage),
    OnboardingItem(
        AppStrings.fertilizerCalculator,
        AppStrings.fertilizerCalculatorDescription,
        ImageRoutes.mascotIntroImage),
  ];

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar:

          //dotted row
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(onboardingItems.length, (index) {
          return VxCircle(
                  radius: 12,
                  backgroundColor: AppThemeColors.getColor(
                      index == _currentIndex
                          ? AppThemeColorsEnum.lightGreen
                          : AppThemeColorsEnum.gray200))
              .px4();
        }),
      ).centered().h(100),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo and heading
            Image.asset(
              ImageRoutes.circularLogo,
              width: 50,
            ),
            10.heightBox,
            CustomText(
              textKey: AppStrings.findSolution,
              textAlign: TextAlign.center,
              color: Colors.white,
            ).centered().px16(),
            30.heightBox,

            //get started button
            CustomButtonElevated(
              text: AppStrings.getStarted,
              customIcon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 15,
              ),
              buttonColor: AppThemeColors.getColor(AppThemeColorsEnum.orange),
              onTap: () {
                navigateToPageReplaceMentNamed(SelectLocationLang.routeName);
              },
            ).centered().w48(context),

            //image carosuel displaying different slides
            Expanded(
              child: VxSwiper.builder(
                itemCount: onboardingItems.length,
                viewportFraction: 1.0,
                height: context.percentHeight * 60,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  OnboardingItem item = onboardingItems[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(item.image)
                          .hPCT(context: context, heightPCT: 35),
                      30.heightBox,
                      CustomText(
                        textKey: item.title,
                        size: 18,
                        semiBold: true,
                        color:
                            AppThemeColors.getColor(AppThemeColorsEnum.white),
                      ),
                      CustomText(
                        textKey: item.description,
                        color:
                            AppThemeColors.getColor(AppThemeColorsEnum.white),
                        textAlign: TextAlign.center,
                      ).py8(),
                    ],
                  ).px32();
                },
              ),
            ),
          ],
        ).p16(),
      ),
    );
  }
}
