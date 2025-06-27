import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../../Constants/strings.dart';
import '../../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../../themeFiles/app_colors.dart';
import '../../../base_screen.dart';
import '../../../../Routes/image_routes.dart';

class QuerySent extends BaseScreen {
  static const String routeName = "/query-sent-screen";
  const QuerySent({super.key});

  @override

  BaseScreenState<QuerySent> createState() => _QuerySentState();
}

class _QuerySentState extends BaseScreenState<QuerySent> {
  @override
  Widget buildWidget(BuildContext context) {
   

    return Scaffold(
      //background color
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Image.asset(ImageRoutes.message_image).h(150).w(150),

            //some spacing
            10.heightBox,

            // query sent text
            CustomText(
              size: 18,
              textAlign: TextAlign.center,
              textKey: AppStrings.querySent,
              color: AppColors.white,
              bold: true,
            ),

            //some spacing
            10.heightBox,

            // query success message
            CustomText(
              size: 18,
              textAlign: TextAlign.justify,
              textKey: AppStrings.querySuccessMessage,
              color: AppColors.white,
              bold: true,
            ).p20(),

            // done button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: CustomText(
                textKey: AppStrings.done,
                bold: true,
              ),
            ).color(AppColors.white).cornerRadius(15)
          ],
        ).centered(),
      ),
    );
  }

 
}
