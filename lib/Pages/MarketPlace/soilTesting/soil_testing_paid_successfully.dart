
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/strings.dart';
import '../../../Routes/image_routes.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../themeFiles/app_colors.dart';


import '../../base_screen.dart';

class SoilTestingPaidSuccessfully extends BaseScreen {
  const SoilTestingPaidSuccessfully({Key? key}) : super(key: key);

  @override
  BaseScreenState<SoilTestingPaidSuccessfully> createState() => _SoilTestingPaidSuccessfullyState();
}

class _SoilTestingPaidSuccessfullyState extends BaseScreenState<SoilTestingPaidSuccessfully> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageRoutes.soilTestingpaidsucessfully, height: 150, width: 150,),
                20.heightBox,
                CustomText(
                    size: 20,
                    color: AppColors.white,
                    bold: true,
                    textKey: "paid sucessfully".toUpperCase()),

                10.heightBox,

                CustomText(
                    size: 14,
                    color: AppColors.white,
                    textKey: "BOOKING ID: - 980TEST13")
              ],
            )
                .w(width)
                .h(height)
                .color(AppColors.greenLight),

          ],
        ),
      ),
    );
  }
}



