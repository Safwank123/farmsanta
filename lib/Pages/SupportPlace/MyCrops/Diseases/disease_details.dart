
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button_with_network_image.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../Models/SupportPlace/Disease/Disease.dart';
import '../../../base_screen.dart';

class DiseaseDetails extends BaseScreen {
  static String routeName = '/diseases-details-screen';
  final Disease disease;
  const DiseaseDetails({super.key, required this.disease});

  @override
  BaseScreenState<DiseaseDetails> createState() => _DiseaseDetailsState();
}

class _DiseaseDetailsState extends BaseScreenState<DiseaseDetails> {
  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.subHeading,
            borderRadius: BorderRadius.circular(3.5),
          ),
        ).w(120).h(7).p12(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    //Dummy Disease Image will be replaced with Model
                    WidgetHelper()
                        .getCachedImage(
                          widget.disease.photos[0].fileName.toString(),
                          double.infinity,
                          double.infinity,
                          boxFit: BoxFit.cover,
                        )
                        .whPCT(context: context, heightPCT: 50, widthPCT: 100),
                    //Crop Name Custom Button With NetworkImage
                    Positioned(
                      top: 15,
                      left: 10,
                      child: CustomButtonWithNetworkImage(
                        onTap: () {},
                        buttonColor: Colors.orange,
                        text: widget.disease.crops[0],
                        imageHeight: 20,
                        imageWidth: 20,
                        // imagePath:
                        //     "https://static.vecteezy.com/system/resources/previews/011/502/022/original/an-illustration-of-cute-mango-fruit-hand-drawn-cartoon-free-png.png",
                      ),
                    ),
                  ],
                ).pSymmetric(v: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      textKey:
                          "${AppStrings.diseases} : ${widget.disease.localName}",
                      style: AppTextStyle.bodyLarge,
                      color: const Color(0xFF3D3D3D),
                    ),
                    //TODO: Use Custom Icon
                    IconButton(
                      onPressed: () {
                        //TODO find use case

                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        size: 30.0,
                        color: Color(0xFF3D3D3D),
                      ),
                    )
                  ],
                ).pOnly(bottom: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      textKey: AppStrings.areyoufacingsamecropissue,
                      style: AppTextStyle.bodyMedium,
                      color: Colors.black,
                    ),
                    CustomButtonElevated(
                      onTap: () {},
                      text: AppStrings.askYourQueries,
                          //TODO add navigation to ask query screen
                      borderRadius: 20.0,
                      buttonColor: AppColors.primary,
                      textColor: AppColors.background,
                    ).pSymmetric(v: 10)
                  ],
                )
                    .px(5)
                    .box
                    .make()
                    .h(50)
                    .color(const Color(0xFFEFFFE8))
                    .cornerRadius(10)
                    .pOnly(bottom: 12),
                CustomText(
                  textAlign: TextAlign.left,
                  textKey: AppStrings.symptomandLifeCycle,
                  size: 15.0,
                  color: AppColors.subHeading,
                ).pOnly(bottom: 10),
                CustomText(
                  color: AppColors.subHeading,
                  size: 15,
                  textKey: widget.disease.symptomsOfAttack.toString(),
                ).pOnly(bottom: 20),
                CustomText(
                  textAlign: TextAlign.left,
                  textKey: AppStrings.preventiveMeasures,
                  size: 15.0,
                  color: AppColors.subHeading,
                ).pOnly(bottom: 10),
                CustomText(
                  color: AppColors.subHeading,
                  size: 15,
                  textKey: widget.disease.preventiveMeasures.toString(),
                ).pOnly(bottom: 20),
                CustomText(
                  textAlign: TextAlign.left,
                  textKey: AppStrings.favourableConditions,
                  size: 15.0,
                  color: AppColors.subHeading,
                ).pOnly(bottom: 10),
                CustomText(
                  color: AppColors.subHeading,
                  size: 15,
                  textKey: widget.disease.favourableConditions,
                ).pOnly(bottom: 20),
                CustomText(
                  textAlign: TextAlign.left,
                  textKey: AppStrings.culturalMechanicalControl,
                  size: 15.0,
                  color: AppColors.subHeading,
                ).pOnly(bottom: 10),
                CustomText(
                  color: AppColors.subHeading,
                  size: 15,
                  textKey: widget.disease.culturalMechanicalControl.toString(),
                ).pOnly(bottom: 20)
              ],
            ),
          ),
        )
      ],
    ).box.make().hPCT(context: context, heightPCT: 90).pSymmetric(h: 12);
  }
}
