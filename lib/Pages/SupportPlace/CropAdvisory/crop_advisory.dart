
import 'package:farmsanta_new/Pages/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_symbols/flutter_material_symbols.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../Constants/strings.dart';
import '../../../../../Functions/common.dart';
import '../../../../../Models/SupportPlace/CropAdvisory/crop_advisory_model.dart';
import '../../../../../Widgets/Widgets/custom_edit_text_white_back.dart';
import '../../../../../Widgets/classes/app_bar.dart';
import '../../../../../Widgets/classes/card_helper.dart';
import '../../../../../themeFiles/app_colors.dart';
import '../../../Services/store_helper.dart';
import 'add_filter_screen.dart';
import 'crop_advisory_details.dart';

class CropAdvisoryScreen extends BaseScreen {
  static const routeName = "/crop-advisory-screen";
  const CropAdvisoryScreen({super.key});

  @override
  BaseScreenState<CropAdvisoryScreen> createState() =>
      _CropAdvisoryScreenState();
}

class _CropAdvisoryScreenState extends BaseScreenState<CropAdvisoryScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBarDesigns.getAppTitleOnly(AppStrings.cropAdvisory),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Search, save and filter
              Row(children: [
                //Search InputBox
                CustomInputField(
                  isFocused: false,
                  showIcon: true,
                  hint: AppStrings.search,
                  textEditingController: searchController,
                  borderRadius: 25,
                  fillColor: AppColors.grayLight,
                  //filter icon
                  suffixWidget: Icon(
                    MaterialSymbols.sort,
                    size: 25,
                    color: AppColors.primary,
                  ).onTap(() {
                    _addFilter();
                  }),
                ).expand(flex: 7),
              ]).pSymmetric(h: 15),

              Column(
                children: List.generate(cropAdvisoriesCardList.length, (index) {
                  CropAdvisoryModel model = cropAdvisoriesCardList[index];
                  return CardHelper.cropAdvisoryCard(
                      context, model, AppColors.primary, onTap: () {
                    navigateToPageWithoutReplaceMent(CropAdvisoryDetailScreen(
                      model: model,
                    ));
                  });
                }),
              ),
            ],
          ),
        ));
  }


  List<CropAdvisoryModel> cropAdvisoriesCardList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    getList();
    super.initState();

    //TODO search condition
    searchController.addListener(() {
      String searchText = searchController.text;
      cropAdvisoriesCardList =
          StoreHelper.store.cropAdvisoriesList.where((element) {
        return element.firstName.contains(searchText);
      }).toList();
      setState(() {});
    });
  }

  void getList() {
    cropAdvisoriesCardList = StoreHelper.store.cropAdvisoriesList;
  }

  void _addFilter() async {
    var data = await showModalBottomSheet(

      backgroundColor: AppColors.textFieldLintBackground,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return const AddFilterScreen().hPCT(context: context, heightPCT: 96);
        });
    Navigator.pop(context);


    if (data != null && data.isNotEmpty) {
      var croplist = data[0][0];
      var advisoryTag = data[0][1];
      var stageList = data[0][2];
      cropAdvisoriesCardList =
          StoreHelper.store.cropAdvisoriesList.where((element) {
        return (croplist.isNotEmpty && croplist.contains(element.crop)) ||
            (advisoryTag.isNotEmpty &&
                advisoryTag.contains(element.advisoryTagName)) ||
            (stageList.isNotEmpty && stageList.contains(element.growthStage));
      }).toList();
    } else {
      getList();
    }

    setState(() {});
  }
}
