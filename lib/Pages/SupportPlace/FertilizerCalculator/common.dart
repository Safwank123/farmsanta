import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Widgets/Widgets/custom_text.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../../../Widgets/classes/widget_helper_class.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../../../themeFiles/app_typography.dart';
import '../../base_screen.dart';

class Common extends BaseScreen {
  final Widget widget;
  const Common({super.key, required this.widget});

  @override
  BaseScreenState<Common> createState() => _CommonState();
}

class _CommonState extends BaseScreenState<Common> {
  @override
  Widget buildWidget(BuildContext context) {
    String image =
        "https://purepng.com/public/uploads/large/purepng.com-farmeragriculturefarmerraw-materialsraising-field-cropslaborerclipartcartoon-1421526887019sr1ue.png";
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.greenLight,
          leading: IconButton(
            iconSize: 30,
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {},
          ),
          title: CustomText(
            textKey: AppStrings.fertilizerCalculator,
            color: AppColors.background,
            style: AppTextStyle.titleMedium,
          ),
          titleSpacing: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              Hero(
                tag: AppStrings.fertilizerCalculatorTag,
                child: WidgetHelper()
                    .getCachedImage(image, height * 0.30, width * 0.60)
                    .centered()
                    .box
                    .make()
                    .wFull(context)
                    .h(height * 0.22)
                    .color(AppColors.greenLight),
              ),
              widget.widget,
            ],
          ),
        ));
  }
}
