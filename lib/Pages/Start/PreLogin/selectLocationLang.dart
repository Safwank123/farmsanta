
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Pages/Start/PreLogin/login.dart';
import 'package:farmsanta_new/Pages/SupportPlace/Market/market.dart' as AppThemeColors show getColor;
import 'package:farmsanta_new/Services/shared_helper.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/colors.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/Widgets/custom_button.dart';
import '../../base_screen.dart';

class SelectLocationLang extends BaseScreen {
  static String routeName = '/select-locationlang-screen';
  const SelectLocationLang({super.key});

  @override
  BaseScreenState<SelectLocationLang> createState() =>
      _SelectLocationLangState();
}

class _SelectLocationLangState extends BaseScreenState<SelectLocationLang> {
  TextEditingController location = TextEditingController();

  int selectedLanguage = SharedHelper.getSelectedLanguage();
  List<String> languageNames =
      SharedHelper.languages.map((e) => e.name).toList();

  List<String> countries = [];
  int selectedCountry = 0;
  String countryName = "";

  @override
  void initState() {
    super.initState();

    countries = StoreHelper.store.countries.map((e) => e.territoryName).toList();

    if (countries.isNotEmpty) {
      selectedCountry =
          countries.indexOf(StoreHelper.store.selectedCountryName);
      if (selectedCountry == -1) selectedCountry = 0;

      countryName = countries[selectedCountry];
    } else {
      selectedCountry = 0;
      countryName = "";
      debugPrint("⚠️ Country list is empty");
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              ImageRoutes.locationImage,
              fit: BoxFit.cover,
              height: context.percentHeight * 34,
            ).p(15).centered(),
            Expanded(
              child: Container(
                decoration: getBoxDecorationTop(
                    24,
                    AppThemeColors.getColor(
                        AppThemeColorsEnum.locationBackground)),
                child: Column(
                  children: [
                    CustomText(
                      textKey: AppStrings.locationLanguage,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                    20.heightBox,
                    if (countries.isNotEmpty)
                      getIconDropDown(
                        ImageRoutes.locationSelectLangloc,
                        Expanded(
                          child: WidgetHelper.getDropDown(
                            countryName,
                            selectedCountry,
                            (value) {
                              selectedCountry = countries.indexOf(value);
                              StoreHelper.store.selectedCountry =
                                  StoreHelper.store.countries[selectedCountry];
                              setState(() {});
                            },
                            countries,
                          ),
                        ),
                      ),
                    10.heightBox,

                    if (languageNames.isNotEmpty)
                      getIconDropDown(
                        ImageRoutes.languageSelectionImage,
                        Expanded(
                          child: WidgetHelper.getDropDown(
                            languageNames[0],
                            selectedLanguage,
                            (value) async {
                              int newIndex = languageNames.indexOf(value);
                              if (newIndex != selectedLanguage) {
                                selectedLanguage = newIndex;
                                await SharedHelper.changeLanguage(selectedLanguage);
                                setState(() {});
                              }
                            },
                            languageNames,
                          ),
                        ),
                      ).wFull(context),

                    20.heightBox,
                    CustomButtonElevated(
                      buttonColor:
                          AppThemeColors.getColor(AppThemeColorsEnum.yellow),
                      text: AppStrings.next,
                      onTap: () {
                        if (countries.isNotEmpty) {
                          StoreHelper.store.selectedCountry ??=
                              StoreHelper.store.countries[selectedCountry];
                          StoreHelper.store.selectedCountryName =
                              countries[selectedCountry];
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                    ).w64(context),
                  ],
                ).p16(),
              ).wFull(context),
            ),
          ],
        ).hFull(context),
      ),
    );
  }

  Widget getIconDropDown(String image, Widget dropDown) {
    return Container(
      decoration: StyleHelper.getBoxDecorationAll(
        8,
        AppThemeColors.getColor(AppThemeColorsEnum.white),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 20,
          ).pOnly(left: 10),
          const VerticalDivider(thickness: 0.5).h(40),
          dropDown,
        ],
      ),
    );
  }
}
