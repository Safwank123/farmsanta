import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '/Models/SupportPlace/farmscout/farm_scouting.dart';
import '../../../../../Constants/strings.dart';
import '../../../Services/store_helper.dart';
import '../../base_screen.dart';
import 'Widgets/my_queries_card.dart';

class SolvedScreen extends BaseScreen {
  static const String routeName = "/myQueries-solved-screen";

  final TextEditingController searchController;
  const SolvedScreen(this.searchController, {super.key});

  @override
  BaseScreenState<SolvedScreen> createState() => _SolvedScreenState();
}

class _SolvedScreenState extends BaseScreenState<SolvedScreen> {
  List<FarmScouting> filteredList = [];

  @override
  void initState() {
    filteredList.addAll(StoreHelper.store.solvedFarmScoutingList);

    super.initState();

    widget.searchController.addListener(() {
      String searchText = widget.searchController.text;
      filteredList.clear();
      filteredList.addAll(StoreHelper.store.solvedFarmScoutingList
          .where((element) => element.crop == searchText));
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return GridView.builder(
        itemCount: filteredList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return myQueriesCard(
              farmScoutingModel: filteredList[index],
              buttonText: AppStrings.viewSolution,
              isSolved: true);
        }).p12();
  }
}
