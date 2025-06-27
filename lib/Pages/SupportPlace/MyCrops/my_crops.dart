
import 'package:farmsanta_new/Constants/strings.dart';
import 'package:farmsanta_new/Functions/common.dart';
import 'package:farmsanta_new/Services/store_helper.dart';
import 'package:farmsanta_new/Widgets/Widgets/custom_text.dart';
import 'package:farmsanta_new/Widgets/classes/app_bar.dart';
import 'package:farmsanta_new/themeFiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Constants/colors.dart';
import '../../../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../../../Models/SupportPlace/Disease/Disease.dart';
import '../../../Models/SupportPlace/POP/PopDetailsDTO.dart';
import '../../../Models/SupportPlace/farmscout/farm_scouting.dart';
import '../../../Widgets/classes/widget_helper_class.dart';
import '../../../themeFiles/app_typography.dart';
import '../CropAdvisory/crop_advisory.dart';
import '../CropAdvisory/crop_advisory_details.dart';
import '../MyQueries/DetailScreens/pending_query.dart';
import '../MyQueries/DetailScreens/solved_query.dart';
import '../MyQueries/my_queries.dart';
import '../POP/pop.dart';
import 'Diseases/crop_diseases.dart';

class MyCrops extends StatefulWidget {
  static String routeName = '/my-crops';
  const MyCrops({Key? key}) : super(key: key);

  @override
  State<MyCrops> createState() => _MyCropsState();
}

class _MyCropsState extends State<MyCrops> {
  int selectedIndex = -1;
  String selectedCrop = "";

  List<String> images = [];
  List<String> cropNames = [];
  List<CropAdvisoryModel> filteredCropAdvisory = [];
  List<Disease> filteredDisease = [];
  List<PoPModel> filteredPOP = [];
  List<FarmScouting> filteredFarmScouting = [];

  @override
  void initState() {
    var store = StoreHelper.store;
    cropNames = store.myCropNames;
    images = store.myCropImages;

    //setting initial list of data
    filteredDisease.addAll(store.diseasesList);
    filteredCropAdvisory.addAll(store.cropAdvisoriesList);
    filteredPOP.addAll(store.popList);
    filteredFarmScouting.addAll(store.farmScoutingList);

    super.initState();
  }

  //filtering list on the basis of selected crop
  selectCrop() {
    filteredDisease.clear();
    filteredDisease.addAll(StoreHelper.store.diseasesList
        .where((element) => element.crops.contains(selectedCrop)));

    filteredCropAdvisory.clear();
    filteredCropAdvisory.addAll(StoreHelper.store.cropAdvisoriesList
        .where((element) => element.crop == selectedCrop));

    filteredPOP.clear();
    filteredPOP.addAll(StoreHelper.store.popList
        .where((element) => element.crop == selectedCrop));

    filteredFarmScouting.clear();
    filteredFarmScouting.addAll(StoreHelper.store.farmScoutingList
        .where((element) => element.crop == selectedCrop));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //Appbar
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.myCrops),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //choice chips of selected crop
              if (cropNames.isNotEmpty)
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cropNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return choiceChipWithImage(
                            images, cropNames, index, selectedIndex == index)
                        .pSymmetric(h: 5);
                  },
                ).hPCT(context: context, heightPCT: 5).centered(),

              //diseases and ... text
              mycrops(AppStrings.diseasesInCrops, AppStrings.viewMore,
                  const CropDiseasesPage()),

              //horizontal list of dieases cards
              filteredDisease.isEmpty
                  ? CustomText(textKey: AppStrings.noDiseases).centered()
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children:
                              List.generate(filteredDisease.length, (index) {
                        return diseaseCardList(filteredDisease[index]).p4();
                      })),
                    ),

              // latest advisories...text
              mycrops(AppStrings.latestAdvisories, AppStrings.viewmore,
                  const CropAdvisoryScreen()),

              //crop advisories card list
              if (filteredCropAdvisory.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children:
                          List.generate(filteredCropAdvisory.length, (index) {
                    return cropAdvisoriesCardList(filteredCropAdvisory[index])
                        .p4();
                  })),
                )
              else
                CustomText(textKey: AppStrings.noAdvisories).centered(),

              //latest pop...text
              mycrops(AppStrings.pop, AppStrings.viewmore, const PopScreen()),

              //pop card list
              if (filteredPOP.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(filteredPOP.length, (index) {
                    return popCardList(filteredPOP[index]).p4();
                  })),
                )
              else
                CustomText(textKey: AppStrings.noPOP).centered(),

              //crop queries...text
              mycrops(AppStrings.cropQueries, "", const MyQueriesScreen()),

              //crop queries card
              if (filteredFarmScouting.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children:
                          List.generate(filteredFarmScouting.length, (index) {
                    return myQueriesCard(filteredFarmScouting[index], true)
                        .p4();
                  })),
                )
              else
                CustomText(textKey: AppStrings.noQueries).centered()
            ],
          ).p2(),
        ));
  }

  Widget mycrops(String heading, String? viewMore, dynamic newPage) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              textKey: heading,
              bold: true,
              size: 18,
            ),
            10.heightBox,
            SizedBox(
              child: viewMore == ""
                  ? const Icon(Icons.arrow_forward)
                  : CustomText(
                      textKey: AppStrings.viewMore,
                      color: AppColors.gray,
                      size: 14,
                    ),
            ).onTap(
              () {
                navigateToPageReplaceMent(newPage);
              },
            )
          ],
        ),
      ],
    ).p16();
  }

  //ChoiceChips of Crops with index
  Widget choiceChipWithImage(
      List image, List name, int index, bool isSelected) {
    return RawChip(
      avatar: WidgetHelper().getCachedImage(
        image[index],
        20,
        20,
        boxFit: BoxFit.fitHeight,
      ),
      showCheckmark: false,
      label: CustomText(
        textKey: name[index],
        style: AppTextStyle.labelLarge,
        color: isSelected ? AppColors.background : AppColors.primary,
      ),
      backgroundColor: AppColors.background,
      selectedColor: AppColors.primary,
      selected: selectedIndex == index,
      onSelected: (bool selected) {
        selectedIndex = index;
        selectedCrop = name[selectedIndex];
        selectCrop();
      },
    );
  }

  //crop advisory card list widget
  Widget cropAdvisoriesCardList(CropAdvisoryModel model) {
    String formattedOrdered =
        DateFormat('dd Mon, yyyy').format(model.createdTimestamp);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(model.profileImage),
                  radius: 10,
                  backgroundColor: AppColors.white,
                ),
                5.widthBox,
                CustomText(
                  textKey: model.createdBy,
                  color: AppColors.gray,
                ),
              ],
            ),
            5.heightBox,
            Stack(
              children: [
                WidgetHelper().getCachedImage(
                  model.photos[0].fileName.toString(),
                  150,
                  130,
                  boxFit: BoxFit.fitHeight,
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: CustomText(
                    textKey: formattedOrdered,
                    style: AppTextStyle.labelLarge
                        .copyWith(color: AppColors.white),
                  )
                      .p2()
                      .onInkTap(() {})
                      .box
                      .make()
                      .color(Colors.black.withOpacity(0.4))
                      .cornerRadius(20)
                      .scale(scaleValue: 0.8, alignment: Alignment.bottomLeft),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.invert,
                    )
                        .iconSize(10)
                        .p4()
                        .box
                        .make()
                        .color(AppColors.white)
                        .cornerRadius(20))
              ],
            ).onTap(() {
              navigateToPageWithoutReplaceMent(const CropAdvisoryScreen());
            }),
            5.heightBox,
            CustomText(
              textKey: model.advisoryTag,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        5.heightBox,
        CustomText(
          textKey: AppStrings.viewAdvisories,
          color: AppColors.white,
          size: 10,
        ).p8().box.make().color(AppColors.primary).cornerRadius(30).onTap(() {
          navigateToPageWithoutReplaceMent(CropAdvisoryDetailScreen(
            model: model,
          ));
        }),
      ],
    );
  }

  //Pop card list widget
  Widget popCardList(PoPModel model) {
    return Stack(
      children: [
        WidgetHelper().getCachedImage(
          model.photos![0].fileName.toString(),
          160,
          150,
          boxFit: BoxFit.fitHeight,
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage(
                    model.profileImage!,
                  ),
                  radius: 10,
                  backgroundColor: AppColors.white),
              5.widthBox,
              CustomText(
                textKey: model.createdBy!,
                color: AppColors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.crop!,
                  style:
                      AppTextStyle.labelLarge.copyWith(color: AppColors.white),
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
              .onInkTap(() {})
              .pOnly(top: 5, left: 10, bottom: 5, right: 5)
              .box
              .make()
              .color(Colors.black.withOpacity(0.4))
              .glassMorphic(blur: 2)
              .cornerRadius(20)
              .centered(),
        ),
      ],
    ).onTap(() {
      navigateToPageWithoutReplaceMent(const PopScreen());
    });
    ;
  }

  //Diseases card list widget
  Widget diseaseCardList(Disease model) {
    return Stack(
      children: [
        WidgetHelper().getCachedImage(
          model.photos[0].fileName.toString(),
          150,
          150,
          boxFit: BoxFit.fitHeight,
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  model.symptomsOfAttack!,
                  style:
                      AppTextStyle.labelLarge.copyWith(color: AppColors.white),
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
              .onInkTap(() {})
              .pOnly(top: 5, left: 10, bottom: 5, right: 5)
              .box
              .make()
              .color(Colors.black.withOpacity(0.4))
              .glassMorphic(blur: 2)
              .cornerRadius(20)
              .centered(),
        )
      ],
    ).onTap(() {
      navigateToPageWithoutReplaceMent(const CropDiseasesPage());
    });
  }

  Widget myQueriesCard(FarmScouting farmScoutingModel, bool isSolved) {
    // properties in map
    var propertyMap = {
      0: AppStrings.crop,
      1: AppStrings.growthStage,
      2: AppStrings.plantPartIssue,
    };

// values in map
    var valueMap = {
      0: farmScoutingModel.crop,
      1: farmScoutingModel.cropStage,
      2: farmScoutingModel.images[0].plantPart
    };

    return Column(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            // image
            WidgetHelper()
                .getCachedImage(farmScoutingModel.images[0].image!, 80, 150),

            // date on top of image
            Positioned(
              bottom: 5,
              left: 5,
              child: CustomText(
                      textKey: DateFormat('d MMMM, y').format(
                          DateTime.parse(farmScoutingModel.createdTimestamp!)),
                      style: AppTextStyle.bodySmall
                          .copyWith(color: AppColors.white))
                  .pSymmetric(v: 5, h: 10)
                  .glassMorphic(blur: 4)
                  .box
                  .make()
                  .color(AppColors.invert.withOpacity(0.1))
                  .cornerRadius(15)
                  .centered(),
            )
          ],
        ),

        // some spacing
        5.heightBox,

        // property and value
        for (int i = 0; i < 3; i++)
          Column(
            children: [
              propertyValueWidget(
                  propertyColor: AppColors.gray,
                  property: propertyMap[i]!,
                  value: valueMap[i]!),
            ],
          ),

        // some spacing
        5.heightBox,

        //view Query Button
        CustomText(
          textKey: "View Query",
          color: AppColors.white,
        )
            .pSymmetric(h: 30, v: 4)
            .box
            .make()
            .color(AppColors.primary)
            .cornerRadius(20)
      ],
    )
        .pSymmetric(h: 5, v: 10)
        .box
        .make()
        .color(AppColors.grayLight)
        .onInkTap(() {
      if (isSolved) {
        navigateToPageWithoutReplaceMent(SolvedQuery(
          title: valueMap[0]!,
          advisoryDetails: StoreHelper.store.advisoryDetails!,
          advisoryTable: StoreHelper.store.advisoryTable!,
          farmScoutingModel: farmScoutingModel,
        ));
      } else {
        navigateToPageWithoutReplaceMent(PendingQuery(
          title: valueMap[0]!,
          farmScoutingModel: farmScoutingModel,
        ));
      }
    });
  }

// widget contain property and value in row
  Widget propertyValueWidget(
      {required String property,
      required String value,
      Color propertyColor = primaryColor,
      Color valueColor = primaryColor}) {
    return Row(
      children: [
        CustomText(
          textKey: '$property:',
          color: propertyColor,
        ),
        5.widthBox,
        CustomText(
          textKey: value,
          color: valueColor,
        ),
      ],
    );
  }
}
