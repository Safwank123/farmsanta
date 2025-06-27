// ignore_for_file: must_be_immutable

import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_button.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Routes/image_routes.dart';
import '../../../../../Widgets/classes/style_helper.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../base_screen.dart';

class AddCropCalender extends BaseScreen {
  static String routeName = '/add-crop-calender-screen';
  const AddCropCalender({Key? key}) : super(key: key);

  @override
  State<AddCropCalender> createState() => _AddCropCalenderState();
}

class _AddCropCalenderState extends State<AddCropCalender> {
  DateTime selectedDate = DateTime.now();
  String selectedCrops = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            //Create... Text
            CustomText(
              textKey: AppStrings.createYourCropCalender,
              style: AppTextStyle.titleLarge.copyWith(
                  color: AppColors.primary, fontWeight: FontWeight.w800),
            ),

            10.heightBox,
            //Select your ... Text
            CustomText(
              textKey: AppStrings.selectYourCrop,
              style: AppTextStyle.titleMedium.copyWith(color: AppColors.black),
            ),

            10.heightBox,

            //Crop
            selectedCrops != ""
                ? selectedcropwithimage(selectedCrops)
                : Container(),

            10.heightBox,
            //View Other Crops
            Row(mainAxisSize: MainAxisSize.min, children: [
              CustomText(
                textKey: AppStrings.viewOtherCrops,
                style:
                    AppTextStyle.bodySmall.copyWith(color: AppColors.primary),
              ),
              5.widthBox,
              const Icon(
                Icons.arrow_drop_down_sharp,
              )
            ]).onInkTap(() {
              _showCropSelectionBottomSheet(context);
            }),

            10.heightBox,

            //Select Crop S... Text
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(
                ImageRoutes.calenderIcon,
                width: 30,
              ),
              5.widthBox,
              CustomText(
                textKey: AppStrings.selectCropSowingDate,
                style: AppTextStyle.titleMedium,
              ),
            ]),

            //Date Picker
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                '${selectedDate.day}|${selectedDate.month}|${selectedDate.year}'
                    .split(' ')[0],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ).centered(),
            ).w(width * 0.35).pSymmetric(h: 10).onTap(() {
              _selectDate(context);
            }),

            20.heightBox,

            //Create Button
            CustomButtonElevated(
                    text: AppStrings.createCropCalender,
                    borderRadius: 5,
                    onTap: () {})
                .centered()
                .pSymmetric(h: width / 5)
          ],
        ).pSymmetric(h: 15),
      ),
    );
  }

  //datePicker

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  //Select Crop Bottom Sheet
  void _showCropSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.textFieldLintBackground,
      context: context,
      builder: (BuildContext context) {
        return CropSelectionScreen(
          onCropSelected: (crop) {
            setState(() {
              selectedCrops = crop;
            });
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  Widget selectedcropwithimage(String name) {
    return //
        Column(
      children: [
        //Crop
        Stack(
          alignment: Alignment.center,
          children: [
            WidgetHelper().getCircularCachedImage(
                "https://images.unsplash.com/photo-1511735643442-503bb3bd348a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3JvcHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
                60,
                60),
            SvgPicture.asset(ImageRoutes.selectedCrop),
            // Icon(
            //   Icons.check,
            //   color: AppColors.white,
            // ).circle(radius: 40, backgroundColor: AppColors.transperant, border: Border.all(color: AppColors.white, width: 2)).cornerRadius(50)
          ],
        ),
        5.heightBox,
        CustomText(
          textKey: name,
          style: AppTextStyle.bodySmall,
          color: AppColors.white,
        )
            .pSymmetric(v: 3, h: 6)
            .box
            .make()
            .color(AppColors.primary)
            .cornerRadius(25),
      ],
    );
  }
}

class Crop {
  final String name;
  Crop(this.name);
}

class CropSelectionScreen extends StatelessWidget {
  final Function(String) onCropSelected;

  CropSelectionScreen({
    super.key,
    required this.onCropSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: AppStrings.selectCrop,
              style:
                  AppTextStyle.titleMedium.copyWith(color: AppColors.primary),
            ),
            CustomText(
              textKey: AppStrings.done,
              style:
                  AppTextStyle.titleMedium.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        10.heightBox,
        CustomText(
          textKey: AppStrings.yourCrops,
          style: AppTextStyle.bodyLarge
              .copyWith(fontWeight: FontWeight.w800, color: AppColors.black),
        ),
        20.heightBox,
        CustomText(
          textKey: AppStrings.othercrops,
          style: AppTextStyle.bodyLarge.copyWith(
              fontWeight: FontWeight.w800, color: AppColors.subHeading),
        ),
        ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          scrollDirection: Axis.horizontal,
          itemCount: cropNames.length,
          itemBuilder: (context, index) {
            final crop = cropNames[index];
            return ActionChip(
                onPressed: () {
                  onCropSelected(crop);
                },
                backgroundColor: AppColors.white,
                side: BorderSide(color: AppColors.white),
                label: CustomText(
                  textKey: crop,
                  style: AppTextStyle.bodySmall,
                )).pSymmetric(h: 3);
          },
        ).h(cropNames.length * 10),
      ],
    ).p(15);
  }

  List<String> cropNames = StoreHelper.store.cropNameList;
}
