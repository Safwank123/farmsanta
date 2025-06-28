
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velocity_x/velocity_x.dart';

class Test extends BaseScreen {
  const Test({super.key});

  @override
  BaseScreenState<Test> createState() => _TestState();
}

class _TestState extends BaseScreenState<Test> {



  @override
  Widget buildWidget(BuildContext context) {
    return Container().hFull(context).wFull(context).color(getColor(AppThemeColorsEnum.orangeDisbled));
  }
  
}