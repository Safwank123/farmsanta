
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<StatefulWidget> createState();
}

abstract class BaseScreenState<Page extends BaseScreen> extends State<Page> {
  Color getColor(AppThemeColorsEnum AppThemeColorsEnum) {
    return AppThemeColors.getColor(AppThemeColorsEnum);
  }

  Color getSingleColor(AppThemeColorsEnum AppThemeColorsEnum,
      {bool isDark = false}) {
    return AppThemeColors.getSingleColor(AppThemeColorsEnum, isDark: isDark);
  }

  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }

  @override
  void initState() {
    super.initState();

    //fetch data from api
    // if (fetchApiData) {
    //   getApiData();
    // }
    getLocalData();
  }

  //variable and function for api
  bool fetchApiData = false, dataLoaded = false, isListScreen = false;
  Function? apiListFunction, apiDetailFunction;
  dynamic getApiData() async {
    if (isListScreen) {
      return await apiListFunction!();
    } else {
      return await apiDetailFunction!();
    }
  }

  Future<void> getData() async {

  }


  Future<void> getLocalData() async {


  }



  


  //TODO localdatabase sync
}
