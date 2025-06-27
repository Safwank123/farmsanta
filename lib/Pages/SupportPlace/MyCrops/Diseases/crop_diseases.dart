// ignore_for_file: prefer_const_constructors

import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart' as StyleHelper;
import 'package:farmsanta_new/Pages/SupportPlace/MyCrops/Diseases/disease_details.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:farmsanta_new/themeFiles/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../Models/SupportPlace/Disease/Disease.dart';
import '../../../../Services/store_helper.dart';
import '../../../base_screen.dart';

class CropDiseasesPage extends BaseScreen {
  static String routeName = '/crop-diseases-screen';
  const CropDiseasesPage({super.key});

  @override
  BaseScreenState<CropDiseasesPage> createState() => _CropDiseasesPageState();
}

class _CropDiseasesPageState extends BaseScreenState<CropDiseasesPage> {
  List<String> cropNames = [];
  List<Disease?> diseaseList = [];
  List<String> cropsImage = [];

  int selectedIndex = -1;
  String selectedCrop = '';
  List<String> localDiseaseNames = [];
  List<String> diseasePhotos = [];
  List<Disease> localDiseaseList = [];

  void getLocalNamesAndPhotosForCrop(String cropName) {
    localDiseaseNames.clear();
    diseasePhotos.clear();
    for (var disease in diseaseList) {
      if (disease!.crops.contains(cropName)) {
        localDiseaseNames.add(disease.localName);
        diseasePhotos.add(disease.photos[0].fileName!);
        localDiseaseList.add(disease);
      }
    }
  }

  @override
  void initState() {
    var store = StoreHelper.store;
    if (store.callFromMyCrops) {
      cropNames = store.myCropNames;
      cropsImage = store.myCropImages;
      StoreHelper.store.callFromMyCrops = false;
    } else {
      // for (var element in store.cropList) {
      //   cropNames.add(element.cropName!);
      //   cropsImage.add(element.photos![0].fileName!);
      // }

      cropNames.addAll(store.cropNameList);
      cropsImage.addAll(store.cropImageList);
    }
    var selectedCropFromBack = store.selectedCropUuidForDiseaseFromMyCrops;
    diseaseList = selectedCropFromBack != ""
        ? store.diseasesList
            .where((element) => element.crops.contains(selectedCropFromBack))
            .toList()
        : store.diseasesList;

    if (selectedCropFromBack != "") {
      StoreHelper.store.selectedCropUuidForDiseaseFromMyCrops = "";
    }

    //first time loading of first index crop
    if (cropNames.isNotEmpty) {
      selectedCrop = "";
      selectedIndex = -1;
    }
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: AppColors.background,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_sharp,
              color: AppColors.primary,
            ).iconSize(30),
          ),
          title: CustomText(
            textKey: AppStrings.cropDiseases,
            color: AppColors.primary,
            style: AppTextStyle.titleLarge,
            textAlign: TextAlign.left,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cropNames.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = selectedIndex == index;
                  return choiceChipWithImage(index, isSelected)
                      .pSymmetric(h: 5);
                },
              ).hPCT(context: context, heightPCT: 5),
              Visibility(
                visible: selectedCrop.isNotBlank,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomText(
                      textKey: "${AppStrings.diseasesIn} $selectedCrop",
                      color: AppColors.subHeading,
                      style: AppTextStyle.bodyMedium,
                      size: 20.0,
                    ),
                    15.heightBox,
                    GridView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.8,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: localDiseaseNames.count(),
                      itemBuilder: (context, position) {
                        return Stack(
                          children: [
                            WidgetHelper().getCachedImage(
                              diseasePhotos[position],
                              double.infinity,
                              double.infinity,
                              boxFit: BoxFit.fitHeight,
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              right: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      localDiseaseNames[position],
                                      style: AppTextStyle.labelLarge
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColors.invert,
                                  )
                                      .iconSize(15)
                                      .p4()
                                      .box
                                      .make()
                                      .color(AppColors.white)
                                      .cornerRadius(20)
                                ],
                              )
                                  .onInkTap(() {
                                    openModalBottomSheet(
                                      context,
                                      localDiseaseList[position],
                                    );
                                  })
                                  .pOnly(top: 5, left: 10, bottom: 5, right: 5)
                                  .box
                                  .make()
                                  .color(Colors.black.withOpacity(0.4))
                                  .glassMorphic(blur: 2)
                                  .cornerRadius(20)
                                  .centered(),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ).pSymmetric(h: 10.0, v: 10),
              ),
            ],
          ).pSymmetric(h: 5.0),
        ),
      ),
    );
  }

  void openModalBottomSheet(BuildContext context, Disease disease) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: StyleHelper.cardShapeBorderTop(20),
      builder: (BuildContext context) {
        return DiseaseDetails(
          disease: disease,
        ).hPCT(context: context, heightPCT: 93);
      },
    );
  }

  //ChoiceChips of Crops with index
  Widget choiceChipWithImage(int index, bool isSelected) {
    return RawChip(
      avatar: WidgetHelper().getCachedImage(
        cropsImage[index],
        30,
        30,
        boxFit: BoxFit.fitHeight,
      ),
      showCheckmark: false,
      label: CustomText(
        textKey: cropNames[index],
        style: AppTextStyle.labelLarge,
        color: isSelected ? AppColors.background : AppColors.primary,
      ),
      backgroundColor: AppColors.background,
      selectedColor: AppColors.primary,
      selected: selectedIndex == index,
      onSelected: (bool selected) {
        selectedIndex = index;
        selectedCrop = cropNames[selectedIndex];
        isSelected = selected;
        getLocalNamesAndPhotosForCrop(selectedCrop);
        setState(() {});
      },
    );
  }
}
