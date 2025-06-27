
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';

import '../../base_screen.dart';

class NutriSourceScreen extends BaseScreen {
  static const String routeName = "/nutrisource-screen";
  const NutriSourceScreen({super.key});

  @override
  BaseScreenState<NutriSourceScreen> createState() => _NutriSourceScreenState();
}

class _NutriSourceScreenState extends BaseScreenState<NutriSourceScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomText(
          textKey: AppStrings.nutrisource,
          color: Colors.black,
          style: AppTextStyle.titleMedium,
        ),
        titleSpacing: 0,
      ),
      body: Center(
          child: CustomText(
        textKey: AppStrings.thisfeatureisInProgressItwillbeAvailableSoon,
        style: AppTextStyle.bodyMedium,
      )),
    );
  }
}
