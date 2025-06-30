// ignore_for_file: must_be_immutable

import 'package:farmsanta_new/Models/Common/crop_model.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../Widgets/classes/style_helper.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../base_screen.dart';

const List<CropModelShort> allCrops = [
  CropModelShort(uuid: '1', cropName: 'Almond', imagePath: 'assets/images/crops/avacado.jpg'),
  CropModelShort(uuid: '2', cropName: 'Avocado', imagePath: 'assets/images/crops/carrot.jpg'),
  CropModelShort(uuid: '3', cropName: 'Banana', imagePath: 'assets/images/crops/mattan.jpg'),
  CropModelShort(uuid: '4', cropName: 'Brinjal', imagePath: 'assets/images/crops/pacha.jpg'),
  CropModelShort(uuid: '5', cropName: 'Cabbage', imagePath: 'assets/images/crops/qf.jpg'),
  CropModelShort(uuid: '6', cropName: 'Chilli', imagePath: 'assets/images/crops/tommato.jpg'),
  CropModelShort(uuid: '7', cropName: 'Barley', imagePath: 'assets/images/crops/tommato.jpg'),
  CropModelShort(uuid: '8', cropName: 'Bean', imagePath: 'assets/images/crops/ulli.jpg'),
];

class AddCropCalender extends BaseScreen {
  static String routeName = '/add-crop-calender-screen';
  const AddCropCalender({super.key});

  @override
  State<AddCropCalender> createState() => _AddCropCalenderState();
}

class _AddCropCalenderState extends State<AddCropCalender> {
  DateTime selectedDate = DateTime.now();
  CropModelShort? selectedCrop;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            CustomText(
              textKey: AppStrings.createYourCropCalender,
              style: AppTextStyle.titleLarge.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            10.heightBox,
            CustomText(
              textKey: AppStrings.selectYourCrop,
              style: AppTextStyle.titleMedium.copyWith(color: AppColors.black),
            ),
            10.heightBox,

            // Selected Crop Display
            if (selectedCrop != null) selectedCropWithImage(selectedCrop!),

            10.heightBox,

            // View Other Crops Button
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  textKey: AppStrings.viewOtherCrops,
                  style: AppTextStyle.bodySmall.copyWith(color: AppColors.primary),
                ),
                5.widthBox,
                const Icon(Icons.arrow_drop_down_sharp),
              ],
            ).onInkTap(() {
              _showCropSelectionBottomSheet(context);
            }),

            10.heightBox,

            // Sowing Date Section
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(ImageRoutes.calenderIcon, width: 30),
              5.widthBox,
              CustomText(
                textKey: AppStrings.selectCropSowingDate,
                style: AppTextStyle.titleMedium,
              ),
            ]),

            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                '${selectedDate.day}|${selectedDate.month}|${selectedDate.year}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ).centered(),
            ).w(width * 0.35).pSymmetric(h: 10).onTap(() {
              _selectDate(context);
            }),

            20.heightBox,

            // Create Button
            CustomButtonElevated(
              text: AppStrings.createCropCalender,
              borderRadius: 5,
              onTap: () {
                // Handle submission
              },
            ).centered().pSymmetric(h: width / 5),
          ],
        ).pSymmetric(h: 15),
      ),
    );
  }

  Widget selectedCropWithImage(CropModelShort crop) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                crop.imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SvgPicture.asset(ImageRoutes.selectedCrop),
          ],
        ),
        5.heightBox,
        CustomText(
          textKey: crop.cropName,
          style: AppTextStyle.bodySmall,
          color: AppColors.white,
        )
            .pSymmetric(v: 3, h: 6)
            .box
            .color(AppColors.primary)
            .withRounded(value: 25)
            .make(),
      ],
    );
  }

  void _showCropSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.textFieldLintBackground,
      context: context,
      builder: (BuildContext context) {
        return CropSelectionScreen(
          onCropSelected: (crop) {
            setState(() {
              selectedCrop = crop;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}

class CropSelectionScreen extends StatelessWidget {
  final Function(CropModelShort) onCropSelected;

  const CropSelectionScreen({
    super.key,
    required this.onCropSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: allCrops.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final crop = allCrops[index];
          return GestureDetector(
            onTap: () => onCropSelected(crop),
            child: Column(
              children: [
                ClipOval(
                  child: Image.asset(
                    crop.imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                5.heightBox,
                CustomText(
                  textKey: crop.cropName,
                  style: AppTextStyle.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
